# Upload package update — 2026-10-15

## Basis and changes

- Downloaded the current public repository at commit `af18512102c8f4224428d42209ee7ce1866d6e21`.
- Updated README title, introduction, setup links, build notes and Support section.
- Added `.github/FUNDING.yml` for `https://buymeacoffee.com/soso1999`.
- Added `esphome/voice-satellite-secure.yaml`, documented its selection and local secrets, and added upload guidance. The original `voice-satellite.yaml` is byte-identical to the basis commit.

## Checks rerun for this update

- Optional example: `esphome config` with ESPHome 2026.9.1 succeeded using locally generated temporary credentials outside the package and the original remote model URLs. ESPHome warns that encrypted OTA is preferable to password OTA when API encryption is configured; this is explained in the setup guide. No firmware compile or hardware test was performed.
- Optional example compared to the original: only two leading explanatory comments, `api.encryption.key` and `ota.password` were added. Audio, pins, wake-word models and automations are unchanged.
- All original files remain included. Every file under `cad/` and `images/`, and the original firmware, compared byte for byte against the basis commit.
- All local Markdown targets checked, checksum manifest regenerated and checked, ZIP CRC integrity and extracted file contents checked.
- No Git history, local secrets, build caches or validation credentials included in the ZIP.

The record below describes earlier checks; those earlier firmware/CAD checks were not rerun except where explicitly listed above.

---

# Original packaging validation record — 2026-10-15

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
