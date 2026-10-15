# ESP32-S3 Home Assistant Voice Satellite

**DIY smart speaker with local wake-word detection, ESPHome and a 3D-printed enclosure.**

[![Buy me a coffee](https://img.shields.io/badge/Buy_me_a_coffee-Support_this_project-FFDD00?logo=buymeacoffee&logoColor=000000)](https://buymeacoffee.com/soso1999)
[![Software License: MIT](https://img.shields.io/badge/Software-MIT-blue.svg)](LICENSE-MIT)
[![Hardware & Docs: CC BY-SA 4.0](https://img.shields.io/badge/Hardware%20%26%20Docs-CC%20BY--SA%204.0-lightgrey.svg)](LICENSE-CC-BY-SA-4.0)

A completed DIY voice satellite built on perfboard, in a custom 3D-printed enclosure. Local **Okay Nabu** detection and a local **Stop** wake word run on the ESP32-S3. Home Assistant Cloud provides speech-to-text and text-to-speech; a local Qwen model, connected through Home Assistant's llama.cpp integration, handles conversation and permitted device actions.

**Deutsch:** Fertig aufgebauter ESP32-S3-Sprachsatellit mit INMP441, MAX98357A und gedrucktem Gehäuse. Wakewords und Qwen laufen lokal; STT/TTS nutzen Home Assistant Cloud. Die Originalfotos, finale v0.4-CAD-Quelle und beide Druckteile sind enthalten.

<p align="center">
  <img src="images/build-01.jpg" alt="Completed ESP32-S3 Home Assistant voice satellite" width="650">
</p>

<p align="center">
  <a href="images/README.md">View all build photos →</a>
</p>

## Features

- ESP32-S3 DevKitC-1, INMP441 I²S microphone, MAX98357A I²S amplifier.
- Local microWakeWord “Okay Nabu”; “Stop” enabled during longer TTS announcements.
- Separate music and announcement pipelines with a mixer and 48 kHz resamplers.
- Home Assistant Cloud STT/TTS with a local Qwen conversation agent.
- Real OpenSCAD source and separate enclosure/front-grille STL files, v0.4, 82 × 110 × 35 mm.

## Start here

1. Check [BOM](hardware/BOM.md) and [wiring](hardware/WIRING.md), including your board's flash/PSRAM variant.
2. Follow [ESPHome setup](esphome/README.md). Choose the unchanged original firmware or the separate example with API encryption and an OTA password.
3. Follow [Home Assistant setup](home-assistant/SETUP.md) to select the Cloud STT/TTS and Qwen pipeline on the satellite.
4. Use [CAD and printing](cad/README.md) for the v0.4 enclosure, front grille and printing notes.
5. Check [troubleshooting](docs/TROUBLESHOOTING.md) if needed and review the [licensing information](LICENSE.md) before reusing or modifying the project.

## How it works

```text
INMP441 → local Okay Nabu → Home Assistant Cloud STT
                                 ↓
                    Home Assistant → local Qwen server
                                 ↓
Cloud TTS → announcement pipeline → resampler → mixer → MAX98357A
Music     → media pipeline        → resampler ↗
```

During announcements longer than roughly one second, the firmware switches to the local Stop model. A detection stops the satellite's announcement and requests the voice session to stop. This does not guarantee cancellation of backend LLM generation or stop media on other devices.

This is a hybrid local/cloud setup: Qwen runs on a separate computer, not on the ESP32. Spoken requests use cloud STT/TTS. A Home Assistant Cloud subscription and internet access are needed for that pipeline.

## Building and using your satellite

The speaker has been assembled and used with the voice pipeline described above. For your own build, check the board variant, wiring and speaker ratings before flashing. Start voice tests at 25–30% playback volume: loud playback can mask the Stop wake word, and there is no dedicated acoustic echo-cancellation hardware. The original firmware starts at 70% volume.

The v0.4 enclosure source and separate printable parts are included alongside build photos. Detailed file history, checks and known limits are recorded in [validation](docs/VALIDATION.md) and [provenance](docs/PROVENANCE.md).

## Repository map

| Directory | Contents |
|---|---|
| `hardware/` | BOM, pin mapping, measured dimensions |
| `esphome/` | Original firmware, optional security example, secrets template, installation guide |
| `home-assistant/` | Cloud voice pipeline, local model and tool setup |
| `cad/` | v0.4 OpenSCAD, STL, previews, original notes and validation |
| `images/` | Original final-build photographs and attribution |
| `docs/` | Provenance, troubleshooting, validation, publishing |

## Support ☕

If this project helps you build your own Home Assistant voice satellite, you can support my work with a coffee. Thank you!

**[Buy me a coffee](https://buymeacoffee.com/soso1999)**

## License

This repository uses separate licenses for software and non-software content:

- **Software, ESPHome YAML files and scripts:** [MIT License](LICENSE-MIT)
- **CAD files, 3D models, schematics, documentation and photographs:** [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](LICENSE-CC-BY-SA-4.0)

See [LICENSE.md](LICENSE.md) for the repository's complete licensing overview. File-specific license notices, where present, take precedence.

Independent community project; not an official Espressif, ESPHome, Home Assistant, Nabu Casa or Qwen product.
