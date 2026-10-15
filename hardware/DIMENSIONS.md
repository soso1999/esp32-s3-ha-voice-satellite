# Measurements and final CAD coordinates

All values in mm. Measurements from the chat describe the physical parts; v0.4 coordinates below describe the supplied model. Their origins and orientation differ.

| Physical measurement | Value |
|---|---:|
| Perfboard | 70 × 50 |
| Mounting center spacing | 65 × 45 |
| Board mounting holes | Ø2.5 |
| Assembly height including protruding pins | 21 |
| Pins below board | 5 |
| Round microphone module | Ø14.3 |
| Original microphone references | center 13 from left, 41 from “front edge” |
| Speaker body | 26.8 × 30 × 15.2 |
| Speaker holes / center spacing | Ø3 / 36.5 |
| Ear hole behind speaker front face | 7 |
| Antenna nominal opening | Ø6.25, requested rear/lower position |
| USB span along edge | 7–27 |
| Board underside to USB top | approximately 12.5 |
| USB sockets recessed behind board edge | approximately 5 |

## v0.4 model, preserved unchanged

The earlier work project corrected axis interpretation after reviewing photos. In the SCAD front view the speaker is above the electronics; USB is on the left. x runs right, y up, z from rear wall to front grille.

- Outer size: 82 × 110 × 35; wall/front thickness 2.4, corner radius 6.
- PCB origin (6,11); PCB 70 × 50. Mounting pattern centered, edge offsets 2.5.
- Standoffs 12.5 above inner rear wall, not the earlier proposed 6–6.5.
- PCB underside z=14.9; pins end z=9.9. Highest component z=30.9; grille inner face z=32.6: nominal clearance 1.7.
- Corrected mic interpretation: 41 along the long board edge, 13 down from board top. Model center (47,48), aperture Ø16.7. This is a coordinate correction, not a new measured microphone position.
- USB opening left side, outer 25 × 15, y=15.5…40.5 and z=13.4…28.4. Inner chamfer widens it to 27.4 × 17.4.
- Speaker holes (22.75,85.4) and (59.25,85.4), Ø3.3; mount height 7 from grille interior.
- Antenna center (72,100), rear wall, Ø6.5 including 0.25 allowance. With y increasing upward this is near the upper end of the model, whereas the original request said rear/bottom. Verify the intended standing orientation before reprinting; the supplied final source was not silently relocated.

The microphone's individual height and acoustic gap were not measured. Check actual board/connector/cable clearance before tightening. See the preserved original CAD notes and dimension sketch for the coordinate system.
