
# CACE Summary for ota-improved {.unnumbered .unlisted}

**netlist source**: schematic

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| Output voltage ratio | ngspice              | gain                 |        0.99 V/V |  1.000 V/V |          any |  1.002 V/V |     1.01 V/V |  1.006 V/V |   Pass ✅    |
| Bandwidth            | ngspice              | bw                   |         10e6 Hz | 146600000.000 Hz |          any | 206653000.000 Hz |          any | 254164000.000 Hz |   Pass ✅    |
| Output noise         | ngspice              | noise                |             any |   0.309 mV |          any |   0.391 mV |       0.6 mV |   0.530 mV |   Pass ✅    |
| Settling time        | ngspice              | tsettle              |             any |   0.134 us |          any |   0.141 us |         1 us |   0.151 us |   Pass ✅    |


## Plots {.unnumbered .unlisted}

## gain_vs_temp {.unnumbered .unlisted}

![gain_vs_temp](./cace/_docs/ota-improved/schematic/gain_vs_temp.png)

## gain_vs_vin {.unnumbered .unlisted}

![gain_vs_vin](./cace/_docs/ota-improved/schematic/gain_vs_vin.png)

## gain_vs_vdd {.unnumbered .unlisted}

![gain_vs_vdd](./cace/_docs/ota-improved/schematic/gain_vs_vdd.png)

## gain_vs_corner {.unnumbered .unlisted}

![gain_vs_corner](./cace/_docs/ota-improved/schematic/gain_vs_corner.png)

## bw_vs_temp {.unnumbered .unlisted}

![bw_vs_temp](./cace/_docs/ota-improved/schematic/bw_vs_temp.png)

## bw_vs_vin {.unnumbered .unlisted}

![bw_vs_vin](./cace/_docs/ota-improved/schematic/bw_vs_vin.png)

## bw_vs_vdd {.unnumbered .unlisted}

![bw_vs_vdd](./cace/_docs/ota-improved/schematic/bw_vs_vdd.png)

## bw_vs_corner {.unnumbered .unlisted}

![bw_vs_corner](./cace/_docs/ota-improved/schematic/bw_vs_corner.png)

## noise_vs_temp {.unnumbered .unlisted}

![noise_vs_temp](./cace/_docs/ota-improved/schematic/noise_vs_temp.png)

## noise_vs_vin {.unnumbered .unlisted}

![noise_vs_vin](./cace/_docs/ota-improved/schematic/noise_vs_vin.png)

## noise_vs_vdd {.unnumbered .unlisted}

![noise_vs_vdd](./cace/_docs/ota-improved/schematic/noise_vs_vdd.png)

## noise_vs_corner {.unnumbered .unlisted}

![noise_vs_corner](./cace/_docs/ota-improved/schematic/noise_vs_corner.png)

## settling_vs_temp {.unnumbered .unlisted}

![settling_vs_temp](./cace/_docs/ota-improved/schematic/settling_vs_temp.png)

## settling_vs_vin {.unnumbered .unlisted}

![settling_vs_vin](./cace/_docs/ota-improved/schematic/settling_vs_vin.png)

## settling_vs_vdd {.unnumbered .unlisted}

![settling_vs_vdd](./cace/_docs/ota-improved/schematic/settling_vs_vdd.png)

## settling_vs_corner {.unnumbered .unlisted}

![settling_vs_corner](./cace/_docs/ota-improved/schematic/settling_vs_corner.png)
