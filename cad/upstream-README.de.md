# ESP32-S3 Smart-Lautsprecher v0.4 – USB auf der ursprünglichen Seite am Außenrand

Die USB-Buchsen liegen laut IMG_3184 auf der **ursprünglichen Seitenwand**, jedoch näher am äußeren Gehäuseeckpfosten als die bisherige Öffnung. Der Seitenwechsel in v0.2/v0.3 beruhte auf einer Fehlinterpretation. In v0.4 liegt die Öffnung wieder auf der Wand des ursprünglichen Probedrucks und ist dort **16 mm zum äußeren Gehäuserand versetzt**.

Die vorhandenen 7–27 entlang der Platinenkante werden jetzt **von der äußeren unteren Platinenkante in Richtung Trennwand** gemessen. Mit Platinenbeginn y=11 ergibt sich der Buchsenbereich y=18…38 und die Fenstermitte y=28 statt bisher y=44. Das großzügige 25 × 15-Fenster erstreckt sich damit über **y=15,5…40,5**. Die Verschiebung stammt aus der korrigierten Maßzuordnung, nicht aus einer millimetergenauen Messung des perspektivischen Fotos. `usb_position_v04.png` stellt die korrigierte Längslage auf derselben Seitenwand dar.

Die Halterhöhe **12,5**, das Mikrofonfenster, die Lautsprecherbefestigung, beide Kabelkerben und das Außenmaß **82 × 110 × 35** werden aus v0.3 übernommen. Die Höhe des USB-Fensters über dem Boden bleibt ebenfalls wie in v0.3; geändert sind seine Seite und seine Position entlang dieser Wand.

## Dateien und Druck

- `gehaeuse_v04.stl`: **neu drucken**, Rückwand auf dem Druckbett.
- `frontgitter_v04.stl`: geometrisch identisch zum Frontgitter aus v0.2 und v0.3; ein vorhandenes Frontgitter dieser Versionen kann verwendet werden. Bei Neudruck Sichtfläche auf das Druckbett, Halter nach oben.
- `smart_speaker_v04.scad`: vollständige, parametrisierbare Quelle.
- `vorschau_v04.png`, `massskizze_v04.png`: Vorschau und Maße.
- `usb_position_v04.png`: Vergleich der USB-Längsposition auf der ursprünglichen Wand.
- `pruefung_v04.json`: digitale Prüfungen an den aus dieser CAD-Datei exportierten STL-Dateien.

Maßstab 1:1 in mm. Außenmaß montiert **82 × 110 × 35**, Wände/Front/Rückwand 2,4, Außenradius 6. Orientierung wie ausdrücklich bestätigt: **Lautsprecher oben, Elektronik unten. USB liegt auf der ursprünglichen Wand des Probedrucks; diese liegt in dieser Außenansicht links.** Beim Blick auf den umgedrehten Deckel in Drucklage erscheint links/rechts vertauscht.

Startwerte für den Druck: PLA oder PETG, 0,2 Schichthöhe, 0,4 Düse, vier Außenlinien, 5–6 Bodenlagen, 20–30 % Füllung. Je nach Drucker lokale Unterstützung unter der oberen Kante der 25 breiten USB-Öffnung vorsehen. Gegebenenfalls längere Platinen-Befestigungsschrauben verwenden; Gewinde-/Pilotpassung am eigenen Druck prüfen.

## Höhen und verbleibender Platz

Alle z-Werte ab äußerer Rückwand, z nach vorne zum Gitter.

| Merkmal | v0.4 |
|---|---:|
| Rückwandinnenseite | z=2,4 |
| Halterhöhe ab innerer Rückwand | **12,5** |
| Platinenunterseite | **z=14,9** |
| Pinspitzen bei gemeldeten 5 unter der Platine | z=9,9 |
| Nominelle Luft unter den Pinspitzen | **7,5** |
| Höchstes Bauteil, bei 21 Gesamthöhe inkl. Pins | **z=30,9** |
| Frontinnenseite | z=32,6 |
| Nomineller Abstand höchstes Bauteil zur Front | **1,7** |
| USB-Fenster außen, ursprüngliche linke Wand | y=15,5…40,5; **z=13,4…28,4** |

**Die 1,7 gelten für das höchste Bauteil, nicht speziell für das Mikrofon.** Die tatsächliche Mikrofonhöhe wurde noch nicht separat gemessen. Es liegt jetzt ebenfalls 3 näher am Gitter; sein genauer Luftspalt lässt sich aus den vorhandenen Maßen nicht bestimmen. Die Vorschau verwendet weiterhin ein schematisches Mikrofon mit angenommenen 8 über einer 1,6 dicken Grundplatine.

Die maximale Gesamthöhe 21 war eine ungefähre Messung. Vor dem endgültigen Anschrauben des Deckels kontrollieren, dass die höchste Stelle, Lötstellen und Kabel frei bleiben. Die CAD-Datei prüft mindestens 1,5 nominellen Frontabstand. Bei diesen Maßen wären 12,7 Halterhöhe die rechnerische Grenze dafür; eine weitere Erhöhung setzt eine genaue Kontrolle des Aufbaus voraus.

## Weitere Geometrie

Die Korrekturen aus v0.2 sind enthalten:

- Platine 70 × 50 bei x=6…76, y=11…61; Lochraster 65 × 45 mittig, je 2,5 Randabstand. Vier Ø6-Halter mit Ø2,0-Pilotloch.
- Mikrofonmodul Ø14,3, freie Öffnung Ø16,7 bei **(47 / 48)**. Aus den vorhandenen Maßen und Fotos zugeordnet: 41 entlang der 70-mm-Kante von links und 13 von der oberen Platinenkante nach unten. Keine neue Messung aus dem perspektivischen Foto.
- USB **auf der ursprünglichen linken Wand**, außen nominal 25 × 15, innen durch 1,2 Fase auf 27,4 × 17,4 aufgeweitet. Längslage aus dem Bereich 7…27 von der äußeren unteren Platinenkante zur Trennwand. Buchsen etwa 5 zurückgesetzt; tatsächliche Steckerreichweite beim Aufbau kontrollieren.
- Kleines Lautsprechergitter mit acht 2 breiten Schlitzen; Gesamtausdehnung x=28,6…53,4, y=71,8…99,0. Löcher bei **(22,75 / 85,4)** und **(59,25 / 85,4)**, mittig zum Gitter, Abstand **36,5**, Durchgang Ø3,3.
- Lautsprecherhalter Ø7 und **7 hoch ab Frontinnenseite**. Die ursprünglichen 7 beschreiben die Tiefe der Laschen hinter der Schall-Vorderseite. Lautsprecher 26,8 × 30 × 15,2, mittig zum Gitter. Für zusätzliche Dichtung Halterhöhe um deren komprimierte Dicke erhöhen. Mit M3-Schrauben durch die Auflagen und reale Laschen, mit Muttern befestigen; Schraubenlänge nach Laschendicke wählen.
- Trennwand y=62,6…65,0 mit **zwei Kabelkerben**, x=9…14 und x=68…73, jeweils 5 breit und 6,6 tief ab offenem Frontrand. Restspalt nach Verdrahtung weich abdichten. Die Zentrierlippe ist über der Trennwand ausgenommen.
- Antennenöffnung hinten bei (72 / 100), Ø6,5 einschließlich 0,25 Druckzugabe auf das Nennmaß Ø6,25.
- Frontbefestigung wie v0.2: vier Durchgänge Ø2,8, Gehäusepilot Ø2,1 und 10 tief; keine Senkung/Gewindeeinsätze. Zentrierlippe mit 0,3 seitlichem Spiel.

## CAD und Prüfung

STL-Export direkt aus `smart_speaker_v04.scad` mit OpenSCAD WebAssembly-node 2025.03.25, Manifold. `part` auf `body`, `lid`, `print`, `assembly`, `exploded` oder `components` setzen. Nur `body`, `lid` und `print` sind Druckteile; die Bauteilhüllen in den Montageansichten sind schematisch. Nach Parameteränderungen F6 rendern und STL exportieren.

```sh
openscad -D 'part="body"' -o gehaeuse_v04.stl smart_speaker_v04.scad
openscad -D 'part="lid"' -o frontgitter_v04.stl smart_speaker_v04.scad
```

Geprüft: geschlossene STL-Netze, konsistente Flächenausrichtung, je ein Körper, Druckbettlage z=0, kollisionsfreie Montage von Gehäuse und Deckel, 12,5 hohe Platinenhalter, die verschobene USB-Öffnung, Lautsprecherhalter und Löcher, Mikrofonöffnung, Antennenöffnung sowie beide Kabelkerben. Das Frontgitter wurde auf geometrische Identität mit v0.3 geprüft. Die Gehäuseänderung wurde auf die beiden betroffenen USB-Fensterbereiche begrenzt geprüft: die gegenüberliegende Öffnung ist geschlossen, die neue Öffnung sitzt auf der ursprünglichen Wand am äußeren Ende der Elektronikkammer. Ein erneuter physischer Passform- und Akustiktest steht aus.
