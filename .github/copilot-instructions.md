# Analog Circuit Design - AI Coding Agent Instructions

## Project Overview
Educational material for intermediate-level MOSFET analog circuit design course (JKU 336.009). Built with Quarto for multi-format publishing (HTML website + PDF), containing theoretical content, Python-based MOSFET sizing calculations, and Xschem/ngspice circuit simulations using IHP's SG13G2 130nm CMOS PDK.

## Architecture & Structure

### Content Organization
- `aicd.qmd` - Main document orchestrator that includes all sections via `{{< include >}}`
- `content/*/` - Modular Quarto chapters (intro, sizing, current_mirror, ota_basic, etc.)
- `content/_macros.qmd` - LaTeX macros for circuit notation (e.g., `\VDD`, `\VGS`, `\gmid`) included in all documents
- `gmid/*.ipynb` - Python Jupyter notebooks for MOSFET sizing using gm/ID methodology
- `xschem/*.sch` - Circuit schematics with embedded ngspice simulation commands
- `cace/*.yaml` - CACE characterization specs for circuit validation

### Technology Stack
- **Documentation**: Quarto (HTML + Typst PDF), using `freeze: auto` for caching
- **Sizing/Analysis**: Python with `pygmid` (gm/ID lookup tables), `schemdraw` (circuit diagrams), `numpy`, `pandas`, `matplotlib`
- **Simulation**: Xschem (schematic entry) + ngspice (SPICE simulation)
- **PDK**: IHP SG13G2 130nm - devices: `sg13_lv_nmos`, `sg13_lv_pmos`, `sg13_hv_nmos`, `sg13_hv_pmos`

## Critical Workflows

### Build & Preview
```bash
quarto preview          # Live preview with hot reload
quarto render           # Generate _site/ output (HTML + PDF)
./convertsch2svg.sh     # Batch convert Xschem .sch to .svg (uses sak-sch2svg.sh)
```

### Circuit Simulation
Simulations are **embedded in schematics** (not standalone netlist files):
1. Open circuit in Xschem: `xschem xschem/ota-5t_tb-ac.sch`
2. Press `Netlist` (keyboard shortcut in Xschem UI) to generate SPICE netlist
3. Press `Simulate` to run ngspice with embedded commands
4. Results display in Xschem's embedded graph window

### MOSFET Sizing (gm/ID Methodology)
See `gmid/sizing_basic_ota.ipynb` pattern:
1. Load lookup tables: `lk('sg13_lv_nmos.mat')` and `lk('sg13_lv_pmos.mat')`
2. Define specs (bandwidth, power, load capacitance, gm/ID targets)
3. Calculate `gm` from bandwidth: `gm = f_bw * 4π * C_load`
4. Derive `ID = gm / (gm/ID)`, then lookup `VGS`, `gm/gds`, parasitic capacitances
5. Verify design with `GM_GDS`, `GM_CGS`, `GM_CDD` ratios from lookup tables

**Lookup table generation**: Use `xschem/techsweep_sg13g2_lv_nmos.sch` → outputs `gmid/techsweep_sg13_txt_to_mat.ipynb` converts to `.mat` files

## Project-Specific Conventions

### File Naming
- Schematics: `circuit_name.sch`, testbenches: `circuit_name_tb-<type>.sch` (e.g., `-ac`, `-tran`, `-noise`, `-loopgain`)
- Symbols: `circuit_name.sym` for hierarchical blocks
- Notebooks: `sizing_<circuit>.ipynb` or `techsweep_<process>_<device>.ipynb`

### LaTeX Notation (from _macros.qmd)
Use custom commands consistently:
- Voltages: `\VDD`, `\VGS`, `\VDS` (uppercase subscripts for DC/large-signal)
- Small-signal: `\vgs`, `\vds` (lowercase for AC)
- Transconductance: `\gm`, `\gmid` (gm/ID), `\gmgds` (gm/gds)
- Capacitances: `\CGG`, `\Cgs`, `\CGD`

### Python Sizing Pattern
```python
# Standard imports in all sizing notebooks
from pygmid import Lookup as lk
import numpy as np

# Consistent parameter naming
gm_id_m12 = 10        # gm/ID target (V^-1)
l_12 = 5              # Length in minimum units (not µm directly)
vgs_m12 = lv_nmos.look_upVGS(GM_ID=gm_id_m12, L=l_12, VDS=0.75, VSB=0.0)
```

### Xschem Integration
- Schematics reference PDK primitives via `sg13g2_pr` library
- Simulation commands embedded in `code_shown.sym` component (visible netlist text)
- SVG exports for web documentation generated via `convertsch2svg.sh`

## Dependencies & External Integrations

- **IIC-OSIC-TOOLS Docker**: Pre-configured environment with Xschem, ngspice, SG13G2 PDK (tag `2025.09+`)
- **CACE**: Circuit characterization tool, runs testbenches defined in `cace/*.yaml` with PVT sweeps
- **pygmid**: Critical for gm/ID methodology - relies on `.mat` lookup tables derived from technology sweeps
- **Quarto freeze**: Expensive computations cached in `_freeze/`, delete to force re-render

## Key Files for Understanding
- [_quarto.yml](_quarto.yml) - Build configuration, website structure
- [content/_macros.qmd](content/_macros.qmd) - Standard notation/LaTeX commands
- [gmid/sizing_basic_ota.ipynb](gmid/sizing_basic_ota.ipynb) - Reference sizing methodology
- [xschem/ota-5t.sch](xschem/ota-5t.sch) - Basic 5-transistor OTA example circuit
- [cace/voltage-buffer-ota.yaml](cace/voltage-buffer-ota.yaml) - CACE characterization template

## Avoid Common Pitfalls
- **Don't** run simulations via terminal commands - Xschem handles this via GUI
- **Don't** edit `_site/` or `_freeze/` manually - generated content
- **Don't** modify `.mat` files directly - regenerate from techsweep schematics
- **Always** use absolute biasing (current sources) in analog circuits, never resistor dividers
- **Check** device operating regions: VDS ≥ VGS - Vth for saturation (typical requirement)
