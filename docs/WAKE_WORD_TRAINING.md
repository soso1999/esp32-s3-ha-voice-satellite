# Owner-trained Okay Nabu model

## Training and observed behavior

The owner trained this German **Okay Nabu** model with
[Tater Totterson’s microWakeWord Trainer for Apple Silicon](https://github.com/TaterTotterson/microWakeWord-Trainer-AppleSilicon)
on a **MacBook Pro M2**. Training took approximately **14 hours**, according to the owner.
The exported calibration timestamp is 2026-10-19 13:37:37 UTC.
The owner reports deploying the ESPHome manifest and TFLite model to the ESP32 and
observing substantially better wake-word recognition. No controlled before/after
measurement or confirmed reduction in everyday false activations was supplied.

A supplied trainer screenshot shows 19 positive and 28 negative samples, with
16 kHz mono WAV input. It shows “Not started”; its relationship to this completed
export is unconfirmed. These counts are not asserted to be the complete training dataset.
A separate screenshot shows one trained Okay Nabu model and its ESPHome export.
Personal recordings, screenshots containing local addresses, datasets and training logs
are not included. The exact trainer revision, training command, random seed and
training-data licenses were not supplied, so the training run cannot be reproduced exactly.

## Included exports

All three supplied files are preserved byte for byte in
[`esphome/models/okay_nabu/`](../esphome/models/okay_nabu/):

- `okay_nabu.tflite`: 137,984-byte model binary.
- `okay_nabu.esphome.json`: strict ESPHome manifest; use this for ESPHome.
- `okay_nabu.json`: extended Tater Native manifest and exported calibration results.

Both manifests reference the same TFLite file. The generated author field remains
“Tater Totterson”; it is preserved export metadata, while the owner performed this
training run. No separate openWakeWord companion model was supplied.
File hashes are recorded in `SHA256SUMS` beside the exports.

## Use with ESPHome

1. Download/copy the complete `esphome/` directory, including `models/okay_nabu/`.
2. Choose `voice-satellite-trained.yaml` for the optional trained-model example.
   It is based on the secure example, retaining its pins, audio and Stop behavior.
3. Fill in local Wi-Fi, API encryption and OTA secrets as described in the
   [ESPHome guide](../esphome/README.md). Use one configuration per device.
4. Validate and compile before flashing:

```sh
esphome config voice-satellite-trained.yaml
esphome compile voice-satellite-trained.yaml
```

For an existing configuration, replace only the Okay Nabu model reference and retain
its existing ID and automations:

```yaml
# Under the existing micro_wake_word.models list:
- model: models/okay_nabu/okay_nabu.esphome.json
  id: okay_nabu_model
```

The path is relative to the device YAML; keep the manifest and TFLite binary together.
This follows the [ESPHome local model manifest format](https://esphome.io/components/micro_wake_word/).
The trained model is embedded when firmware is built; the Mac/trainer server is not
needed for subsequent wake-word detection. The separate Stop model still downloads
from upstream during builds. The original and secure YAML examples retain the stock model.

## Exported calibration, not a new benchmark

The extended JSON reports a recall of **0.980108 (98.0108%)**, **0 false accepts/hour**
over **9.670378 hours** of validation ambient material, 50,020 positive tracks and
4 ambient tracks. The target false-accept limit was 0.25/hour. These are values from
the supplied trainer export, not measurements rerun during publication or guarantees
for other rooms, voices or microphones.

The manifest uses probability cutoff **0.98**, sliding window **5**, feature step
**10 ms**, tensor arena **30,000 bytes**, and minimum ESPHome **2024.7.0**.
That minimum describes the model manifest, not compatibility of the entire satellite
configuration. The project baseline remains ESPHome 2026.9.1.

Test recognition at different distances and with household noise, false activations
during conversation/TV, Stop during TTS, and return to Okay Nabu afterward. Keep the
previous working firmware for comparison. No new compile, flash or acoustic test has
been performed for this repository addition.

## Model licensing and provenance

The owner supplied these trained exports and authorized sharing them. Their presence
here does not establish a license for the trainer, underlying datasets, base models
or trained weights. No explicit license file was found in the trainer repository root
when checked on 2026-10-25, and the exports contain no model license declaration.
The model directory is therefore **excluded from the repository’s blanket MIT and
CC BY-SA grants** pending clarification. Do not infer unrestricted reuse from the
software badge. Preserve the source attribution above; review upstream and training-data
terms before redistribution or commercial use.
