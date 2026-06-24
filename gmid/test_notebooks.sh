#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# Regression test for the gm/ID Jupyter notebooks
# ---------------------------------------------------------------------------
# Executes every notebook in this directory end-to-end with nbconvert and
# fails if any cell raises. This catches breakage in the sizing scripts (e.g.
# a pygmid/numpy API change or a regenerated .mat lookup table) that the Quarto
# render does not cover, because only a few notebooks are `{{< embed >}}`'d.
#
# Notebooks are executed in a throw-away copy of the required input data
# (the .mat / .txt files), so a notebook that *writes* data (such as
# techsweep_sg13_txt_to_mat regenerating the .mat files) never touches the
# working tree.
#
# Usage:
#   gmid/test_notebooks.sh                 # test all notebooks in gmid/
#   gmid/test_notebooks.sh a.ipynb b.ipynb # test only the given notebooks
#   NB_TIMEOUT=900 gmid/test_notebooks.sh  # per-cell timeout in seconds
#
# SPDX-FileCopyrightText: 2026 Harald Pretl
# Johannes Kepler University, Institute for Integrated Circuits
# SPDX-License-Identifier: Apache-2.0
# ---------------------------------------------------------------------------

set -u

GMID_DIR="$(cd "$(dirname "$0")" && pwd)"
TIMEOUT="${NB_TIMEOUT:-600}"

# --- collect notebooks -----------------------------------------------------
declare -a NOTEBOOKS
if [ "$#" -gt 0 ]; then
	NOTEBOOKS=("$@")
else
	while IFS= read -r f; do
		NOTEBOOKS+=("$f")
	done < <(find "$GMID_DIR" -maxdepth 1 -name '*.ipynb' | sort)
fi

if [ "${#NOTEBOOKS[@]}" -eq 0 ]; then
	echo "No notebooks found." >&2
	exit 1
fi

# --- isolated work dir with a copy of the input data -----------------------
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
cp "$GMID_DIR"/*.mat "$work"/ 2>/dev/null || true
cp "$GMID_DIR"/*.txt "$work"/ 2>/dev/null || true

echo "============================================================"
echo " gm/ID notebook regression"
echo "   notebooks : ${#NOTEBOOKS[@]}"
echo "   timeout   : ${TIMEOUT}s per cell"
echo "============================================================"

PASS=0
declare -a FAILED
for nb in "${NOTEBOOKS[@]}"; do
	name="$(basename "$nb")"
	log="${work}/${name}.log"
	printf '>>> %-45s ' "$name"

	cp "$nb" "${work}/${name}"
	if ( cd "$work" && jupyter nbconvert --to notebook --execute \
			--ExecutePreprocessor.timeout="$TIMEOUT" \
			--output "executed_${name}" "$name" ) >"$log" 2>&1; then
		echo "ok"
		PASS=$((PASS + 1))
	else
		echo "FAIL"
		FAILED+=("$name")
		echo "    --- last lines of nbconvert output: ------------------"
		tail -n 20 "$log" | sed 's/^/    /'
	fi
done

echo "============================================================"
echo " Passed: $PASS / ${#NOTEBOOKS[@]}"
if [ "$PASS" -lt "${#NOTEBOOKS[@]}" ]; then
	echo " Failed: $(( ${#NOTEBOOKS[@]} - PASS ))"
	for f in ${FAILED[@]+"${FAILED[@]}"}; do echo "   - $f"; done
	echo "============================================================"
	exit 1
fi
echo " All notebooks executed cleanly."
echo "============================================================"
exit 0
