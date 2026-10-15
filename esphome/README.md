# ESPHome firmware

`voice-satellite.yaml` is extracted from the last complete Stop-enabled configuration in the source chat (turn 67bad795-94a8-45a2-8aa1-3ab72d7b8fe8). GPIOs, audio settings and logic are preserved. A later message confirmed Stop worked at lower volume; the subsequent suggestion to reduce its cutoff was not confirmed as applied, so it is not silently included.

The baseline in the conversation was ESPHome 2026.9.1. The configuration selects `esp32-s3-devkitc-1`, 16 MB flash, ESP-IDF and octal PSRAM at 80 MHz with `ignore_not_found: false`. Verify your module variant first.

## Choose a configuration

- `voice-satellite.yaml`: unchanged original Stop-enabled configuration, with no API encryption or OTA password.
- `voice-satellite-secure.yaml`: optional standalone example for new installations. Only API encryption and OTA password authentication are added; GPIOs, audio, volume, wake words and automations match the original. Use one configuration per physical device, not both.

## Install

1. Copy this directory into a local ESPHome project or create the device in ESPHome Device Builder and paste the supplied YAML.
2. Copy `secrets.yaml.example` to `secrets.yaml`; fill in Wi-Fi credentials locally. For the optional example, also replace the API key and OTA password placeholders. The API key must encode 32 random bytes in Base64; generation commands are included in the template.
3. Run validation and compile before flashing. Use a USB data cable for the first installation; subsequently use OTA.

```sh
python -m pip install -r requirements.txt
cp secrets.yaml.example secrets.yaml
# Edit secrets.yaml before connecting to your real network.
esphome config voice-satellite-secure.yaml
esphome compile voice-satellite-secure.yaml
esphome run voice-satellite-secure.yaml
```

The commands above use the optional security example. To keep the original baseline, substitute `voice-satellite.yaml` in all three commands. Neither example is a second device definition for the same satellite.

Wake-word models are downloaded by ESPHome at build time. The Stop manifest points at an upstream release URL; model binaries are not bundled. Builds require network access and are not fully vendored/reproducible from this archive alone.

## Operation

Idle enables Okay Nabu and disables Stop. Voice capture uses the microphone; announcements longer than roughly one second enable Stop and restart wake-word processing. A detected Stop stops announcement playback and the voice assistant. Idle/end/error paths restore Okay Nabu. The firmware includes a 30-second wake-word watchdog and a Home Assistant “Voice Assistant Test” button.

The recovered configuration uses INFO logging, 500 ms audio buffers and 2 s speaker/mixer timeouts. Keep this baseline before experimenting with audio tuning. Music Assistant is optional; it uses the separate media pipeline.

## Local connection security

The optional example uses `!secret api_encryption_key` for the native API and `!secret ota_password` for OTA authentication. Keep populated `secrets.yaml` local; it is excluded by `.gitignore`. Enter the same API key in Home Assistant when pairing. Update Home Assistant's stored key if changing an existing device's key.

Use USB for the first installation of this example or migration from the original: the running firmware's OTA credentials may differ from the new configuration. Keep the existing configuration and credentials available until the new connection works.

ESPHome 2026.9.1 validates this example with a warning recommending encrypted OTA instead of a password when an API encryption key is present. An OTA password authenticates uploads; it does not encrypt the firmware transfer. This example preserves the project's pinned ESPHome 2026.9.1 workflow. For encrypted OTA on compatible installations, follow the upstream [OTA encryption and migration instructions](https://esphome.io/components/ota/esphome/#encryption); do not blindly change an existing device's OTA settings. API key format is documented in the [native API reference](https://esphome.io/components/api/).

## First checks

Start at 25–30% playback volume. Confirm the Home Assistant test button records a request, Okay Nabu starts a conversation, Cloud TTS is audible, and Stop interrupts a long response after the first second. Confirm Okay Nabu works again afterward and after a Home Assistant reconnect. Check music and TTS separately before combined playback.

See [validation](../docs/VALIDATION.md) for what was actually rerun. No new firmware was flashed during repository preparation.

References: [microWakeWord](https://esphome.io/components/micro_wake_word/), [Voice Assistant](https://esphome.io/components/voice_assistant/), [speaker media player](https://esphome.io/components/media_player/speaker/).
