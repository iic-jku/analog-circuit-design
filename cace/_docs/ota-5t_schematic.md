
# CACE Summary for ota-5t

**netlist source**: schematic

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| Gain                 | ngspice              | gain                 |         0.8 V/V |  0.832 V/V |          any |  0.971 V/V |     1.05 V/V |  0.980 V/V |   Pass ✅    |
| Bandwidth            | ngspice              | bw                   |         10e6 Hz | 15551000.000 Hz |          any | 26912100.000 Hz |          any | 34051700.000 Hz |   Pass ✅    |
| Output noise         | ngspice              | noise                |             any |   0.308 mV |          any |   0.371 mV |         1 mV |   0.455 mV |   Pass ✅    |
| Settling time        | ngspice              | tsettle              |             any |   0.135 us |          any |   0.142 us |        10 us |   0.155 us |   Pass ✅    |


## Plots

## gain_vs_temp

![gain_vs_temp](./cace/_docs/ota-5t/schematic/gain_vs_temp.png)

## gain_vs_vin

![gain_vs_vin](./cace/_docs/ota-5t/schematic/gain_vs_vin.png)

## gain_vs_vdd

![gain_vs_vdd](./cace/_docs/ota-5t/schematic/gain_vs_vdd.png)

## gain_vs_corner

![gain_vs_corner](./cace/_docs/ota-5t/schematic/gain_vs_corner.png)

## bw_vs_temp

![bw_vs_temp](./cace/_docs/ota-5t/schematic/bw_vs_temp.png)

## bw_vs_vin

![bw_vs_vin](./cace/_docs/ota-5t/schematic/bw_vs_vin.png)

## bw_vs_vdd

![bw_vs_vdd](./cace/_docs/ota-5t/schematic/bw_vs_vdd.png)

## bw_vs_corner

![bw_vs_corner](./cace/_docs/ota-5t/schematic/bw_vs_corner.png)

## noise_vs_temp

![noise_vs_temp](./cace/_docs/ota-5t/schematic/noise_vs_temp.png)

## noise_vs_vin

![noise_vs_vin](./cace/_docs/ota-5t/schematic/noise_vs_vin.png)

## noise_vs_vdd

![noise_vs_vdd](./cace/_docs/ota-5t/schematic/noise_vs_vdd.png)

## noise_vs_corner

![noise_vs_corner](./cace/_docs/ota-5t/schematic/noise_vs_corner.png)

## settling_vs_temp

![settling_vs_temp](./cace/_docs/ota-5t/schematic/settling_vs_temp.png)

## settling_vs_vin

![settling_vs_vin](./cace/_docs/ota-5t/schematic/settling_vs_vin.png)

## settling_vs_vdd

![settling_vs_vdd](./cace/_docs/ota-5t/schematic/settling_vs_vdd.png)

## settling_vs_corner

![settling_vs_corner](./cace/_docs/ota-5t/schematic/settling_vs_corner.png)
