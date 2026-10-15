# Upload-Anleitung

1. ZIP lokal entpacken und den Ordner `esp32-s3-ha-voice-satellite` öffnen.
2. Im bestehenden GitHub-Repository **Add file → Upload files** öffnen.
3. Den Inhalt des entpackten Projektordners ins Hauptverzeichnis hochladen, nicht den übergeordneten Ordner oder die ZIP-Datei. Vorhandene Dateien werden durch den Commit aktualisiert; es muss nichts gelöscht werden.
4. Auch die versteckten Dateien `.github/FUNDING.yml` und `.gitignore` übernehmen. Falls `.github` im Dateidialog fehlt: auf GitHub **Add file → Create new file** wählen, `.github/FUNDING.yml` als Namen und `buy_me_a_coffee: soso1999` als Inhalt eintragen.
5. Änderungen prüfen und committen. Der Support-Link steht oben im README und im Abschnitt **Support ☕**. Für den Sponsor-Button ggf. **Settings → General → Features → Sponsorships** aktivieren.

Die Originaldatei `esphome/voice-satellite.yaml` bleibt unverändert. Die zusätzliche Datei `voice-satellite-secure.yaml` ist eine optionale Alternative mit API-Verschlüsselung und OTA-Passwort. Für die erste Installation dieser Alternative USB verwenden, die Secrets lokal ausfüllen und nur eine Konfiguration pro Gerät einsetzen. Siehe `esphome/README.md` für die Einrichtung und den Hinweis auf verschlüsseltes OTA.

CAD, STL, Vorschaubilder und Fotos sind unverändert. Es wurde keine Lizenz ausgewählt und nichts direkt auf GitHub geändert. Hinweise zu Beschreibung und Topics stehen in `docs/PUBLISHING.md`; diese Einstellungen werden durch Datei-Upload nicht übernommen.
