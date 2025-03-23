
# CACE Summary for ota-5t {.unnumbered .unlisted}

**netlist source**: schematic

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| Output voltage ratio | ngspice              | gain                 |        0.97 V/V |  0.987 V/V |          any |  1.000 V/V |     1.03 V/V |  1.007 V/V |   Pass ✅    |
| Bandwidth            | ngspice              | bw                   |         10e6 Hz | 15550400.000 Hz |          any | 26912100.000 Hz |          any | 34052200.000 Hz |   Pass ✅    |
| Output voltage ratio (MC) | ngspice              | gain_mc              |             any |  0.837 V/V |          any |  1.010 V/V |          any |  1.185 V/V |   Pass ✅    |
| Bandwidth (MC)       | ngspice              | bw_mc                |         10e6 Hz | 18988400.000 Hz |          any | 26567100.000 Hz |          any | 29443100.000 Hz |   Pass ✅    |
| Output noise         | ngspice              | noise                |             any |   0.308 mV |          any |   0.371 mV |         1 mV |   0.454 mV |   Pass ✅    |
| Settling time        | ngspice              | tsettle              |             any |   0.137 us |          any |   0.144 us |        10 us |   0.156 us |   Pass ✅    |


## Plots {.unnumbered .unlisted}

## gain_vs_temp {.unnumbered .unlisted}

![gain_vs_temp](./cace/_docs/ota-5t/schematic/gain_vs_temp.png)

## gain_vs_vin {.unnumbered .unlisted}

![gain_vs_vin](./cace/_docs/ota-5t/schematic/gain_vs_vin.png)

## gain_vs_vdd {.unnumbered .unlisted}

![gain_vs_vdd](./cace/_docs/ota-5t/schematic/gain_vs_vdd.png)

## gain_vs_corner {.unnumbered .unlisted}

![gain_vs_corner](./cace/_docs/ota-5t/schematic/gain_vs_corner.png)

## bw_vs_temp {.unnumbered .unlisted}

![bw_vs_temp](./cace/_docs/ota-5t/schematic/bw_vs_temp.png)

## bw_vs_vin {.unnumbered .unlisted}

![bw_vs_vin](./cace/_docs/ota-5t/schematic/bw_vs_vin.png)

## bw_vs_vdd {.unnumbered .unlisted}

![bw_vs_vdd](./cace/_docs/ota-5t/schematic/bw_vs_vdd.png)

## bw_vs_corner {.unnumbered .unlisted}

![bw_vs_corner](./cace/_docs/ota-5t/schematic/bw_vs_corner.png)

## gain_mc {.unnumbered .unlisted}

![gain_mc](./cace/_docs/ota-5t/schematic/gain_mc.png)

## bw_mc {.unnumbered .unlisted}

![bw_mc](./cace/_docs/ota-5t/schematic/bw_mc.png)

## noise_vs_temp {.unnumbered .unlisted}

![noise_vs_temp](./cace/_docs/ota-5t/schematic/noise_vs_temp.png)

## noise_vs_vin {.unnumbered .unlisted}

![noise_vs_vin](./cace/_docs/ota-5t/schematic/noise_vs_vin.png)

## noise_vs_vdd {.unnumbered .unlisted}

![noise_vs_vdd](./cace/_docs/ota-5t/schematic/noise_vs_vdd.png)

## noise_vs_corner {.unnumbered .unlisted}

![noise_vs_corner](./cace/_docs/ota-5t/schematic/noise_vs_corner.png)

## settling_vs_temp {.unnumbered .unlisted}

![settling_vs_temp](./cace/_docs/ota-5t/schematic/settling_vs_temp.png)

## settling_vs_vin {.unnumbered .unlisted}

![settling_vs_vin](./cace/_docs/ota-5t/schematic/settling_vs_vin.png)

## settling_vs_vdd {.unnumbered .unlisted}

![settling_vs_vdd](./cace/_docs/ota-5t/schematic/settling_vs_vdd.png)

## settling_vs_corner {.unnumbered .unlisted}

![settling_vs_corner](./cace/_docs/ota-5t/schematic/settling_vs_corner.png)
