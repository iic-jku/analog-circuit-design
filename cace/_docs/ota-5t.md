# ota-5t

- Description: Simple voltage buffer for capacitive load realized with 5T-OTA
- PDK: ihp-sg13g2

## Authorship

- Designer: Harald Pretl
- Company: Johannes Kepler University
- Created: August 25, 2024
- License: Apache 2.0
- Last modified: None

## Pins

- vdd
  + Description: Positive analog power supply
  + Type: power
  + Direction: inout
  + Vmin: 1.45
  + Vmax: 1.55
- vss
  + Description: Analog ground
  + Type: ground
  + Direction: inout
- ibias_20u
  + Description: Bias current input 20uA nom.
  + Type: signal
  + Direction: input
- vinp
  + Description: Voltage positive input
  + Type: signal
  + Direction: input
- vinn
  + Description: Voltage negative input
  + Type: signal
  + Direction: input
- vout
  + Description: Voltage output
  + Type: signal
  + Direction: output

## Default Conditions

- vdd
  + Description: Analog power supply voltage
  + Display: Vdd
  + Unit: V
  + Typical: 1.5
- ibias
  + Description: Bias current
  + Display: Ibias
  + Unit: uA
  + Typical: 20
- corner
  + Description: Process corner
  + Display: Corner
  + Typical: tt
- temp
  + Description: Ambient temperature
  + Display: Temperature
  + Unit: °C
  + Typical: 27
- cload
  + Description: Load capacitance
  + Display: Cload
  + Unit: fF
  + Typical: 50

## Symbol

![Symbol of ota-5t](ota-5t_symbol.svg)

## Schematic

![Schematic of ota-5t](ota-5t_schematic.svg)
