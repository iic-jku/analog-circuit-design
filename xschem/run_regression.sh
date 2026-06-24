#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# Regression test for all Xschem schematic testbenches
# ---------------------------------------------------------------------------
# For every top-level testbench (a *.sch containing an ngspice `.control`
# block) this script:
#   1. generates a SPICE netlist with xschem (batch / headless),
#   2. runs the embedded simulation with ngspice in batch mode,
#   3. scans the netlist and simulation logs for errors.
#
# Testbenches are run in parallel. The number of concurrent jobs defaults to
# the CPU count (JOBS env var). To avoid overcommitting the CPU, each ngspice
# instance is told how many threads to use via a per-testbench .spiceinit
# (SPICE_THREADS env var, default = cores / JOBS). Each testbench gets its own
# working sub-directory so parallel runs never clobber each other's files.
#
# It is meant to run inside the IIC-OSIC-TOOLS Docker image (tag `latest`),
# which provides xschem, ngspice and the IHP SG13G2 PDK. It also runs locally
# from that container.
#
# Usage:
#   xschem/run_regression.sh                 # test all auto-detected testbenches
#   xschem/run_regression.sh a.sch b.sch     # test only the given schematics
#   JOBS=4 xschem/run_regression.sh          # cap concurrency at 4 jobs
#   JOBS=4 SPICE_THREADS=2 ... run_regression.sh   # 4 jobs, 2 ngspice threads each
#
# Exit status is non-zero if any testbench fails to netlist or simulate.
#
# SPDX-FileCopyrightText: 2026 Harald Pretl
# Johannes Kepler University, Institute for Integrated Circuits
# SPDX-License-Identifier: Apache-2.0
# ---------------------------------------------------------------------------

set -u

# --- locate the xschem directory (this script lives in it) -----------------
XSCHEM_DIR="$(cd "$(dirname "$0")" && pwd)"
RCFILE="${XSCHEM_DIR}/xschemrc"
SIM_DIR="${XSCHEM_DIR}/simulations"
LOG_DIR="${SIM_DIR}/regression_logs"

# --- number of parallel jobs -----------------------------------------------
NPROC="$(nproc 2>/dev/null || echo 4)"
JOBS="${JOBS:-$NPROC}"

# --- threads per ngspice instance ------------------------------------------
# We already parallelise across testbenches, so each ngspice must stay
# single-/few-threaded to avoid overcommitting the CPU (JOBS * threads cores).
# Default: split the cores evenly over the running jobs (>=1).
SPICE_THREADS="${SPICE_THREADS:-$(( NPROC / JOBS > 0 ? NPROC / JOBS : 1 ))}"
export OMP_NUM_THREADS="$SPICE_THREADS"

# --- PDK selection ---------------------------------------------------------
# The repository's xschemrc only sets PDK when it is unset, so make sure we
# select the IHP PDK and do not inherit a different default from the image.
export PDK="${PDK:-ihp-sg13g2}"

# --- original ngspice init files -------------------------------------------
# ngspice loads a `.spiceinit` from the current directory *instead of* the one
# in $HOME. Because we drop a per-testbench .spiceinit (to cap num_threads), we
# must re-include the original init(s) that set up the PDK: `set ngbehavior`,
# and crucially the `pre_osdi ...` lines that load the compiled PSP transistor
# models (sg13g2_lv_nmos_psp, ...). We collect every original init we can find
# and inline them into the per-testbench .spiceinit.
declare -a INIT_FILES
declare -A _seen_init
add_init() {
	local f
	for f in "$@"; do
		[ -f "$f" ] || continue
		local rp; rp="$(readlink -f "$f" 2>/dev/null || echo "$f")"
		[ -n "${_seen_init[$rp]:-}" ] && continue
		_seen_init[$rp]=1
		INIT_FILES+=("$f")
	done
}
# PDK-shipped init(s) first (model/OSDI setup), then any user/home init.
if [ -n "${PDK_ROOT:-}" ] && [ -d "${PDK_ROOT}/${PDK}" ]; then
	while IFS= read -r f; do add_init "$f"; done \
		< <(find "${PDK_ROOT}/${PDK}" -name '.spiceinit' 2>/dev/null)
fi
add_init /foss/.spiceinit "$HOME/.spiceinit" /root/.spiceinit

# The netlists pull in the PDK corner libraries with a *relative* path
# (e.g. `.lib cornerMOSlv.lib mos_tt`). Because each ngspice runs from its own
# isolated work dir, we must point ngspice's sourcepath at the PDK directory
# that actually holds those libraries.
NGSPICE_LIB_DIRS=""
if [ -n "${PDK_ROOT:-}" ] && [ -d "${PDK_ROOT}/${PDK}" ]; then
	NGSPICE_LIB_DIRS="$(find "${PDK_ROOT}/${PDK}" -name 'corner*.lib' \
		-exec dirname {} \; 2>/dev/null | sort -u | tr '\n' ' ')"
fi

# --- headless wrapper ------------------------------------------------------
# A virtual X server lets xschem initialise Tk and lets ngspice `plot`
# commands run without a real display. Fall back to running directly.
if command -v xvfb-run >/dev/null 2>&1; then
	XVFB=(xvfb-run -a)
else
	XVFB=()
fi

# Patterns that mark a genuinely broken netlist or simulation. The allow-list
# below removes lines that legitimately contain one of these words (e.g.
# convergence-helper notes, warnings, "error tolerance").
# Note: `\berror` (word boundary) matches real ngspice messages such as
# "Error:", "ERROR,", "fatal error" but NOT measurement variables that merely
# end in "error" (e.g. `gainerror = ...`, a legitimate result line).
ERR_PATTERN='\berror|fatal|aborted|there aren.t any circuits|no such file|could not find|unable to find|cannot find|premature end of file'
ERR_ALLOW='warning|tolerance|gmin step|source step|trying gmin|note:'

# --- collect the list of testbenches ---------------------------------------
declare -a TESTBENCHES
if [ "$#" -gt 0 ]; then
	TESTBENCHES=("$@")
else
	# A testbench is any schematic that embeds an ngspice `.control` block.
	while IFS= read -r f; do
		TESTBENCHES+=("$f")
	done < <(grep -rl -e '\.control' --include='*.sch' "$XSCHEM_DIR" | sort)
fi

if [ "${#TESTBENCHES[@]}" -eq 0 ]; then
	echo "No testbenches found." >&2
	exit 1
fi

mkdir -p "$SIM_DIR" "$LOG_DIR"
rm -f "$LOG_DIR"/*.status 2>/dev/null

echo "============================================================"
echo " Xschem testbench regression"
echo "   PDK         : $PDK"
echo "   PDK_ROOT    : ${PDK_ROOT:-<unset>}"
echo "   testbenches : ${#TESTBENCHES[@]}"
echo "   parallel    : $JOBS jobs x $SPICE_THREADS thread(s) on $NPROC cores"
echo "   model libs  : ${NGSPICE_LIB_DIRS:-<not found>}"
echo "   init files  : ${INIT_FILES[*]:-<none found>}"
echo "============================================================"

# --- run a single testbench (executed in the background by the pool) -------
run_one() {
	local sch="$1"
	local name work netlist nl_log sim_log status rc hits

	name="$(basename "${sch%.sch}")"
	work="${SIM_DIR}/${name}"
	netlist="${work}/${name}.spice"
	nl_log="${LOG_DIR}/${name}.netlist.log"
	sim_log="${LOG_DIR}/${name}.ngspice.log"
	status="${LOG_DIR}/${name}.status"

	mkdir -p "$work"
	rm -f "$netlist"

	# 1. netlist with xschem (batch, headless), one isolated dir per testbench
	"${XVFB[@]}" xschem --rcfile "$RCFILE" --no_x --no_readline --quit \
		--spice --netlist --netlist_path "$work" "$sch" >"$nl_log" 2>&1

	if [ ! -s "$netlist" ]; then
		echo "FAIL (no netlist generated)" >"$status"
		printf '>>> %-45s FAIL (no netlist)\n' "$name"
		return
	fi

	# 2. provide the .save files the netlist includes: copy the schematic's
	#    companion .save if present, then create empty placeholders for any
	#    remaining `.include *.save` so ngspice does not abort on a missing
	#    file (the control blocks use `save all` anyway).
	[ -f "${sch%.sch}.save" ] && cp -f "${sch%.sch}.save" "$work/"
	grep -ioE '\.include[[:space:]]+[^[:space:]]+\.save' "$netlist" 2>/dev/null \
		| awk '{print $2}' | while IFS= read -r inc; do
		[ -e "${work}/${inc}" ] || : >"${work}/${inc}"
	done

	# 3. build a local .spiceinit that re-includes the original PDK/user init(s)
	#    (model + OSDI setup), points sourcepath at the corner libs, and caps
	#    ngspice's own threading; then simulate in batch from the isolated dir
	{
		for ini in "${INIT_FILES[@]}"; do
			echo "* --- inlined from ${ini} ---"
			cat "$ini"
			echo
		done
		[ -n "$NGSPICE_LIB_DIRS" ] && \
			echo "set sourcepath = ( \$sourcepath ${NGSPICE_LIB_DIRS})"
		echo "set num_threads=${SPICE_THREADS}"
	} >"${work}/.spiceinit"

	( cd "$work" && "${XVFB[@]}" ngspice -b "${name}.spice" ) >"$sim_log" 2>&1
	rc=$?

	# 4. evaluate
	hits="$(grep -iE "$ERR_PATTERN" "$sim_log" "$nl_log" 2>/dev/null \
		| grep -ivE "$ERR_ALLOW")"

	if [ "$rc" -ne 0 ] || [ -n "$hits" ]; then
		{ printf 'FAIL (rc=%s)\n' "$rc"; printf '%s\n' "$hits"; } >"$status"
		printf '>>> %-45s FAIL\n' "$name"
	else
		echo "ok" >"$status"
		printf '>>> %-45s ok\n' "$name"
	fi
}

# --- parallel pool: keep at most $JOBS workers running ---------------------
for sch in "${TESTBENCHES[@]}"; do
	while [ "$(jobs -rp | wc -l | tr -d ' ')" -ge "$JOBS" ]; do
		wait -n 2>/dev/null || sleep 0.2
	done
	run_one "$sch" &
done
wait

# --- aggregate results -----------------------------------------------------
PASS=0
declare -a FAILED
for sch in "${TESTBENCHES[@]}"; do
	name="$(basename "${sch%.sch}")"
	status="${LOG_DIR}/${name}.status"
	if [ -f "$status" ] && [ "$(head -n1 "$status")" = "ok" ]; then
		PASS=$((PASS + 1))
	else
		FAILED+=("$name")
	fi
done

echo "============================================================"
echo " Passed: $PASS / ${#TESTBENCHES[@]}"
if [ "$PASS" -lt "${#TESTBENCHES[@]}" ]; then
	echo " Failed: $(( ${#TESTBENCHES[@]} - PASS ))"
	for f in ${FAILED[@]+"${FAILED[@]}"}; do
		echo "   - $f"
		sed 's/^/       /' "${LOG_DIR}/${f}.status" 2>/dev/null | head -n 12
	done
	echo " Logs in: $LOG_DIR"
	echo "============================================================"
	exit 1
fi
echo " All testbenches passed."
echo "============================================================"
exit 0
