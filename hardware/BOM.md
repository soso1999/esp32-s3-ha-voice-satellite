# Hardware / bill of materials

| Qty | Part | Notes |
|---:|---|---|
| 1 | ESP32-S3 DevKitC-1 | Recovered firmware selects 16 MB flash and octal PSRAM at 80 MHz. Verify the module marking; DevKitC-1 variants differ. PSRAM capacity was not independently established. |
| 1 | INMP441 I²S microphone breakout | Round module measured Ø14.3 mm; powered from 3.3 V. |
| 1 | MAX98357A I²S amplifier breakout | Digital input and mono speaker output. Exact breakout vendor not recorded. |
| 1 | Speaker | 26.8 × 30 × 15.2 mm; mounting ears 36.5 mm center spacing, Ø3 mm holes. Impedance and power rating not recorded: verify before selecting supply/volume. |
| 1 | Perfboard | 70 × 50 mm, mounting centers 65 × 45 mm, Ø2.5 mm holes. |
| 1 set | External Wi-Fi antenna and pigtail | Present in enclosure design; connector and board antenna variant need verification. Do not assume every DevKitC-1 has an external antenna connector. |
| 1 set | USB cable and regulated 5 V supply | Match real board input and amplifier load; required current not measured. |
| As needed | Hookup wire, headers, speaker connector, solder | Blue speaker connector is the highest part of the measured assembly. |
| 4 | PCB mounting screws | Sized for Ø2.5 mm board holes and printed Ø2 mm pilots; verify screw fit and length. |
| 4 | Front screws | Printed Ø2.8 mm clearances / Ø2.1 mm body pilots, no countersinks. |
| 2 sets | M3 speaker screws and nuts | Printed clearances Ø3.3 mm. Length depends on real mounting ears. |
| 1 each | Printed body and front grille | Included in `cad/`. |

No prices, exact screw lengths, electrical speaker ratings or unrecorded capacitor values have been invented.
