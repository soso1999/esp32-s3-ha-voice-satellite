# Validation record — 2026-10-15

## Packaging checks

- All eight recovered v0.4 CAD/documentation assets compared byte for byte with the uploaded ZIP, including the renamed original README.
- Four final-upload photos copied unchanged; SHA-256 manifest included.
- Local Markdown links checked for existing targets.
- Recovered firmware preserves the last complete Stop-enabled YAML from the source chat; no later unconfirmed sensitivity tuning applied.
- No populated secrets, private logs or household-specific entities included.
- Archive integrity and SHA-256 manifest checked after packaging.

## ESPHome configuration check

ESPHome 2026.9.1 `esphome config` succeeded using placeholder Wi-Fi secrets in a separate scratch copy. Both original wake-word manifests were fetched successfully. Image decoding checks passed for all four photographs. This validates configuration schema and referenced models, not a firmware compile or runtime operation.

## Prior evidence, not rerun here

`cad/pruefung_v04.json` and the original CAD README record earlier OpenSCAD exports, closed connected meshes and geometry/clearance checks. These records are historical, not new test results. The owner reported the built device working and Stop succeeding at reduced volume.

## Limits

No new firmware flash, electrical test, acoustic test, physical fit test or CAD export was performed during repository preparation. Photos show a completed build but do not prove which CAD revision was printed. Variant-specific memory, power wiring and speaker electrical ratings require verification as documented.
