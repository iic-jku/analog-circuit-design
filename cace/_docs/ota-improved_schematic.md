
# CACE Summary for ota-improved {.unnumbered .unlisted}

**netlist source**: schematic

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| Output voltage ratio | ngspice              | gain                 |        0.99 V/V |  1.000 V/V |          any |  1.001 V/V |     1.01 V/V |  1.009 V/V |   Pass ✅    |
| Bandwidth            | ngspice              | bw                   |         10e6 Hz | 107908000.000 Hz |          any | 226025000.000 Hz |          any | 292975000.000 Hz |   Pass ✅    |
| Output noise         | ngspice              | noise                |             any |   0.346 mV |          any |   0.407 mV |         1 mV |   0.497 mV |   Pass ✅    |
| Settling time        | ngspice              | tsettle              |             any |   0.196 us |          any |   0.212 us |         5 us |   0.226 us |   Pass ✅    |


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
