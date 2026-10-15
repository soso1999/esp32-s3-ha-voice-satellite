# Wiring

Signal pins are recovered from the last complete Stop-enabled YAML in the source chat. Confirm continuity on the built perfboard before flashing another unit.

| Module | Pin | ESP32 / destination |
|---|---|---|
| INMP441 | VDD | 3.3 V |
| INMP441 | GND | Common GND |
| INMP441 | SCK | GPIO9 |
| INMP441 | WS | GPIO10 |
| INMP441 | SD | GPIO11 |
| INMP441 | L/R | GND (left channel) |
| MAX98357A | BCLK | GPIO7 |
| MAX98357A | LRC / LRCLK | GPIO15 |
| MAX98357A | DIN | GPIO17 |
| MAX98357A | GND | Common GND |
| MAX98357A | VIN | Proposed regulated 5 V rail; original power wiring not conclusively recovered |
| MAX98357A | SPK+ / SPK− | Speaker terminals only |
| MAX98357A | SD / GAIN | Breakout-dependent; inspect actual board defaults, original straps not recorded |

Use separate I²S buses for the microphone and amplifier, as configured. Keep wires short and route microphone signals away from speaker power/output wires. Never power the INMP441 from 5 V. The amplifier has a bridged speaker output: neither speaker terminal is ground.

The amplifier power row is a proposed reconstruction, not a claim about the original board. Check its vendor documentation and the ESP board's power path before connecting it. Do not join independently powered USB/5 V rails without checking backfeed protection. Disconnect power while soldering and inspect for shorts.

The perfboard photographs are build documentation, not a traced schematic. No complete as-built schematic was present in the recovered files.
