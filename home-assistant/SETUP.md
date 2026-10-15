# Home Assistant setup

## Cloud voice services and satellite

1. Connect Home Assistant Cloud in Settings and enable its STT/TTS voice services with your subscription.
2. Add the flashed satellite through the ESPHome integration in Settings → Devices & services. Assign a meaningful room/area.
3. Create a voice assistant pipeline in Settings → Voice assistants. Choose the language, Home Assistant Cloud speech-to-text, your local Qwen conversation agent, and Home Assistant Cloud text-to-speech.
4. In the ESPHome satellite's Home Assistant configuration controls, select that pipeline (or make it the preferred pipeline). The satellite selects a complete pipeline; a conversation agent alone does not automatically appear as a satellite pipeline.

UI labels may vary by Home Assistant version. Local wake-word detection is provided by the firmware; this build does not require a separate server wake-word service.

## Local Qwen conversation agent

The source project ran Qwen through LM Studio's local OpenAI-compatible server and Home Assistant's built-in llama.cpp integration. The logged model identifier was `qwen/qwen3.6-35b-a3b`; it is recorded as project provenance, not a requirement or a claim about catalog availability. Use the exact identifier exposed by your server and a model/template that supports tool calling.

1. Load the model in LM Studio (or another compatible backend), start the server and allow the Home Assistant host to reach it on the local network.
2. Add the **llama.cpp** integration in Settings → Devices & services.
3. Enter your server's API base URL, for example `http://YOUR_MODEL_HOST:1234/v1`, and an API key if required. `localhost` refers to the Home Assistant host when entered there, not to a separate model computer.
4. Select the model and enable Home Assistant control through its Assist API if wanted. Expose the intended entities and scripts to Assist and assign their rooms correctly.
5. Select this agent in the voice pipeline described above.

The source logs showed a request larger than 8192 tokens failing because of the configured context limit. Increase the model's loaded context enough for the system prompt, exposed tool descriptions, conversation and answer, or reduce exposed tools/history. The correct size depends on hardware and workload; no universal value is claimed.

An example voice instruction:

> Respond in the user's language. For spoken answers, normally use 3–5 concise sentences unless asked for detail. Use the available tools for current home information and actions. If a tool fails, explain the failure without claiming the action succeeded.

This prompt is an editable example, not the complete original agent prompt. Keep tools and entity permissions in Home Assistant; they are not configured on the ESP32.

## Verify in stages

First test typed conversation with the agent and a simple exposed light. Then test the satellite's manual voice button. Then use Okay Nabu, ask a general question, test a device action and interrupt a long answer with Stop. If a tool is missing, check Assist exposure before modifying the model. If room commands fail, check the device's inherited area assignment.

Weather, calendars and house status may be added through explicitly exposed Home Assistant scripts that return structured data. Household-specific entities, private logs, calendar content and the original user's automation scripts are intentionally not bundled in this reusable hardware project.

## Optional music

Music Assistant may target the satellite's speaker media player. First confirm manual music playback, then voice control using the exposed player's actual name/area. The media and announcement pipelines remain separate; Stop in this firmware targets the local TTS announcement, not arbitrary remote music players.

References: [official llama.cpp integration](https://www.home-assistant.io/integrations/llama_cpp/), [Home Assistant Cloud voice](https://www.nabucasa.com/config/tts/), [Home Assistant voice assistants](https://www.home-assistant.io/voice_control/).
