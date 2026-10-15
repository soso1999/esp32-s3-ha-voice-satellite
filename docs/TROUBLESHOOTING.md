# Troubleshooting

| Symptom | Check |
|---|---|
| Stop fails during loud answers | Reduce speaker volume to 25–30%, speak near the microphone, inspect wake-word logs. This assembly has no dedicated acoustic echo cancellation. |
| No Stop detection | It activates only after a longer announcement starts, roughly one second later. Temporarily set only `micro_wake_word` logging to DEBUG. Do not assume an action bug without a detection. |
| Detection logged but speech continues | Confirm local announcement playback and `media_player.stop` announcement action; separate detection from playback troubleshooting. |
| Qwen absent from satellite choices | Create a full Assist pipeline with Qwen, then select that pipeline on the satellite. |
| Unable to respond | Inspect backend reachability, model/tool support, context limits and exposed scripts. |
| Named room action cannot find device | Check device/entity area inheritance and Assist exposure. |
| Audio stutters | Preserve INFO logging, 500 ms buffers and 2 s speaker/mixer timeout baseline; check PSRAM detection and power supply. |
| Music buffers without sound | Test media playback alone, then TTS alone; ensure separate media/announcement pipelines and a valid source format. |
| Firmware fails on PSRAM | Verify board memory variant instead of disabling the missing-PSRAM check. |
| USB cable will not reach | v0.4 has a 25 × 15 opening and recessed sockets; check actual cable overmould and socket reach. |
