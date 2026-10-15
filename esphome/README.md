# ESPHome firmware

`voice-satellite.yaml` is extracted from the last complete Stop-enabled configuration in the source chat (turn 67bad795-94a8-45a2-8aa1-3ab72d7b8fe8). GPIOs, audio settings and logic are preserved. A later message confirmed Stop worked at lower volume; the subsequent suggestion to reduce its cutoff was not confirmed as applied, so it is not silently included.

The baseline in the conversation was ESPHome 2026.9.1. The configuration selects `esp32-s3-devkitc-1`, 16 MB flash, ESP-IDF and octal PSRAM at 80 MHz with `ignore_not_found: false`. Verify your module variant first.

## Install

1. Copy this directory into a local ESPHome project or create the device in ESPHome Device Builder and paste the supplied YAML.
2. Copy `secrets.yaml.example` to `secrets.yaml`; fill in Wi-Fi credentials locally.
3. Run validation and compile before flashing. Use a USB data cable for the first installation; subsequently use OTA.

```sh
python -m pip install -r requirements.txt
cp secrets.yaml.example secrets.yaml
# Edit secrets.yaml before connecting to your real network.
esphome config voice-satellite.yaml
esphome compile voice-satellite.yaml
esphome run voice-satellite.yaml
```

Wake-word models are downloaded by ESPHome at build time. The Stop manifest points at an upstream release URL; model binaries are not bundled. Builds require network access and are not fully vendored/reproducible from this archive alone.

## Operation

Idle enables Okay Nabu and disables Stop. Voice capture uses the microphone; announcements longer than roughly one second enable Stop and restart wake-word processing. A detected Stop stops announcement playback and the voice assistant. Idle/end/error paths restore Okay Nabu. The firmware includes a 30-second wake-word watchdog and a Home Assistant “Voice Assistant Test” button.

The recovered configuration uses INFO logging, 500 ms audio buffers and 2 s speaker/mixer timeouts. Keep this baseline before experimenting with audio tuning. Music Assistant is optional; it uses the separate media pipeline.

## Local connection security

The historical configuration has plain `api:` and passwordless ESPHome OTA, preserved for fidelity. Before wider deployment configure an API encryption key and an OTA password using local secrets in ESPHome. Do not put keys in the repository. Re-pair the Home Assistant integration if its API key changes.

## First checks

Start at 25–30% playback volume. Confirm the Home Assistant test button records a request, Okay Nabu starts a conversation, Cloud TTS is audible, and Stop interrupts a long response after the first second. Confirm Okay Nabu works again afterward and after a Home Assistant reconnect. Check music and TTS separately before combined playback.

See [validation](../docs/VALIDATION.md) for what was actually rerun. No new firmware was flashed during repository preparation.

References: [microWakeWord](https://esphome.io/components/micro_wake_word/), [Voice Assistant](https://esphome.io/components/voice_assistant/), [speaker media player](https://esphome.io/components/media_player/speaker/).
