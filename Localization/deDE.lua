local addonName, addon = ...;
local L = LibStub(addon.Libs.AceLocale):NewLocale(addonName, "deDE");
if not L then return end
addon.L = L;

KrowiAF.PluginsApi:LoadPluginLocalization(L);

-- [[ https://legacy.curseforge.com/wow/addons/krowi-achievement-filter/localization ]] --
-- [[ Everything after this line is automatically generated from CurseForge and is not meant for manual edit - SOURCETOKEN - AUTOGENTOKEN ]] --

-- [[ Exported at 2025-12-27 11-13-59 ]] --
L["%c"] = true
L["%d/%m/%Y %I:%M %p"] = true
L["%m/%d/%Y %I:%M %p"] = true
L["%m/%d/%Y %R"] = "%d.%m.%Y %R"
L["%Y/%m/%d %I:%M %p"] = true
L["%Y/%m/%d %R"] = "%d.%m.%Y %R Uhr"
L["10th Anniversary"] = "10-jähriges Jubiläum"
L["450 skill"] = "Fertigkeit 450"
L["525 skill"] = "Fertigkeit 525"
L["600 skill"] = "Fertigkeit 600"
L["Academy Ascent"] = "Akademieaufstieg"
L["Account"] = true
L["Account wide (default)"] = "Account (Standard)"
L["Achievement browsing history"] = "Erfolgsbrowser-Verlauf"
L["Achievement Calendar"] = "Erfolgs-Kalender "
L["Achievement is Completed"] = "Erfolg ist abgeschlossen"
L["Achievement is Completed Desc"] = "Zeige die Erfolgs-Kriterien an, auch wenn der Erfolg bereits abgeschlossen ist."
L["Achievement is excluded"] = "Erfolg wurde ausgeblendet"
L["Achievement is watched"] = "Erfolg auf Beobachtungsliste"
L["Achievement points earned by"] = "Erfolgspunkte erzielt durch"
L["Achievement shown temporarily"] = "Dieser Erfolg wird nur vorübergehend angezeigt, da er keinem der gesetzten Filter entspricht."
L["Achievement was Not Earned by Me"] = "Erfolg nicht durch den aktuellen Charakter abgeschlossen wurde"
L["Achievement was Not Earned by Me Desc"] = "Erfolgs-Kriterien anzeigen, wenn der aktuelle Charakter den Erfolg noch nicht erreicht hat. Dies ermöglicht eine bessere Kontrolle, wenn du mehrere Charaktere spielst."
L["Achievement Window"] = "Erfolgs-Fenster"
L["Achievement window height offset"] = "Erfolgs-Fensterhöhe"
L["Achievement window height offset Desc"] = [=[Die zusätzliche Höhe, die zur Standardhöhe des Erfolgs-Fensters addiert oder davon subtrahiert wird.

Dieser Wert kann geändert werden, während das Erfolg-Fenster geöffnet ist und eine der von {addonName} hinzugefügten Registerkarten ausgewählt wurde. Dies kann Auswirkungen (1) auf das Spiel haben.

(1) FPS-Einbrüche und Stottern während der Anpassung des Wertes, NICHT während der normalen Addon-Nutzung.]=]
L["Achievements"] = "Erfolge"
L["Achievements width offset"] = "Erfolgs-Fensterbreite"
L["Achievements width offset Desc"] = [=[Die zusätzliche Breite, die zur Standardbreite des Erfolgs-Fensters addiert oder davon subtrahiert wird.

Dieser Wert kann geändert werden, während das Erfolg-Fenster geöffnet ist und eine der von {addonName} hinzugefügten Registerkarten ausgewählt wurde. Dies kann Auswirkungen (1) auf das Spiel haben.

(1) FPS-Einbrüche und Stottern während der Anpassung des Wertes, NICHT während der normalen Addon-Nutzung.]=]
L["Active"] = "Aktiv"
L["Active Event Login Delay"] = "Aktive Ereignisse Login-Verzögerung"
L["Active Events"] = "Aktive Ereignisse"
L["Active events"] = "Aktive Ereignisse"
L["Add addon name to world map icon"] = "Addon-Namen zum Weltkarten-Icon hinzufügen"
L["Add addon name to world map icon Desc"] = "Fügt '{addonName}' am Ende des Tooltips hinzu, wenn man mit der Maus über das Icon fährt."
L["Add Locale"] = "Installationspfad hinzufügen"
L["Add Locale Desc"] = "Fügt den Installationspfad des aktuellen Spiels zum {wowheadLink} hinzu."
L["Add to / Remove from Watch List"] = "Hinzufügen zur / Entfernen von der Beobachtungsliste"
L["Add to Watch List"] = "Zu {watchList} hinzufügen"
L["Added in version"] = "Hinzugefügt mit Version"
L["Adjustable Categories"] = "Anpassbare Kategorien"
L["Aki the Chosen"] = "Aki die Auserwählte"
L["Allied Race"] = "Verbündetes Volk"
L["Alt"] = true
L["Always Show Completed"] = "Erreichte Erfolge immer anzeigen"
L["Always show realm"] = "Immer Realm anzeigen"
L["Always show realm Desc"] = "Zeigt immer den Realm deines Charakters an, unabhängig davon, ob sich der Charakter auf demselben Realm wie dieser Charakter befindet."
L["Amathet"] = true
L["Andurs"] = true
L["Apex Canopy River Run"] = "Flusslauf des Hohen Blätterdachs"
L["Aqir"] = true
L["Archive Ambit"] = "Archivring"
L["Are you sure you want to delete character?"] = "Sind Sie sicher, dass Sie {character} löschen möchten? Dieser Charakter wird wieder hinzugefügt, wenn Sie sich erneut mit diesem einloggen. Wenn Sie den Charakter dauerhaft nicht sehen wollen, markieren Sie bitte die {ignore} Checkbox."
L["Assault on Azsuna"] = "Schlacht um Azsuna"
L["Assault on Drustvar"] = "Angriff Drustvar"
L["Assault on Highmountain"] = "Schlacht um den Hochberg"
L["Assault on Nazmir"] = "Angriff Nazmir"
L["Assault on Stormheim"] = "Schlacht um Sturmheim"
L["Assault on Stormsong Valley"] = "Angriff Sturmsangtal"
L["Assault on Tiragarde Sound"] = "Angriff Tiragardesund"
L["Assault on Val'sharah"] = "Schlacht um Val'sharah"
L["Assault on Vol'dun"] = "Angriff Vol'dun"
L["Assault on Zuldazar"] = "Angriff Zuldazar"
L["Assault: Amathet"] = "Angriff: Vorstoß der Amathet (Amathet)"
L["Assault: Aqir"] = "Angriff: Ausgegrabene Aqir (Aqir)"
L["Assault: Mantid"] = "Angriff: Der unendliche Schwarm (Mantid)"
L["Assault: Mogu"] = "Angriff: Die verfeindeten Klans (Mogu)"
L["Assault: N'Zoth (Uldum)"] = "Angriffe von N'Zoth (Uldum)"
L["Assault: N'Zoth (Vale of Eternal Blossoms)"] = "Angriffe von N'Zoth (Das Tal der ewigen Blüten)"
L["Author"] = "Autor"
L["Auto number of summary achievements"] = "Automatisierte Anzeige der Erfolgsansicht (Anzahl der Erfolge)"
L["Auto number of summary achievements Desc"] = "Passt die Anzahl der angezeigten Erfolge automatisch an, so dass keine Scroll-Leiste angezeigt wird."
L["Awakened Raids"] = "Erweckte Schlachtzüge"
L["Awakening the Machine"] = "Erweckung der Maschine"
L["Azerothian Archives"] = "Azerothischen Archive"
L["Azsuna"] = true
L["Azure Span"] = "Das Azurblaue Gebirge"
L["Azure Span: Next"] = "Das Azurblaue Gebirge: Nächstes Event"
L["Blizzard"] = true
L["BlizzCon"] = true
L["Brackenhide Hollow"] = "Brackenfellhöhle"
L["Brawler's Guild"] = "Kampfgilde"
L["Breaknecking Races"] = "Halsbrecherrennen"
L["Brewfest"] = "Braufest"
L["Broken Isles Cup"] = "Verheerte Inseln Pokal"
L["Build"] = "Version"
L["Buildings"] = "Gebäude"
L["Burning Pandaren Spirit"] = "Brennender Pandarengeist"
L["Bur's Mount Collection"] = "Bur's Reittier Sammlung"
L["Button"] = true
L["Calendar"] = "Kalender"
L["Calendar button"] = "Kalender-Button"
L["Calendar button horizontal position Desc"] = "Stelle die horizontale Position des {calendarButton} ein."
L["Calendar button vertical position Desc"] = "Stelle die vertikale Position des {calendarButton} ein."
L["Calendar Desc"] = [=[Erscheinungsbild des {calendar}.

|T:1:8|t- Die Anzahl der Erfolge und Punkte oben sind die verdienten Erfolge und Punkte für den aktuellen sichtbaren Monat und nicht für alle sichtbaren Tage.
|T:1:8|t- Navigieren Sie zum vorherigen oder nächsten Monat, indem Sie auf die Schaltflächen oben neben dem Monat klicken oder das Scrollrad der Maus verwenden.
|T:1:8|t- Wenn Sie mit der Maus über einen Tag fahren, wird dieser hervorgehoben (Tag 11) und die an diesem Tag verdienten Erfolge (falls vorhanden) werden im Fenster an der Seite angezeigt. Wenn Sie die Maus von dem hervorgehobenen Tag entfernen, wird das Fenster an der Seite entweder geschlossen oder zeigt die Erfolge des neuen Tages an, über dem sich die Maus befindet.
|T:1:8|t- Wenn Sie auf einen Tag klicken (ihn auswählen), wird er noch deutlicher hervorgehoben (Tag 18) und das Fenster an der Seite bleibt offen (gesperrt). So kannst Du durch die Erfolge blättern, mit der Maus über sie fahren, um den Tooltip zu sehen, oder sie anklicken, um sie im Erfolgsfenster zu finden (der Kalender wird geschlossen). Das Auswählen eines Tages funktioniert nur, wenn an diesem Tag Erfolge erzielt wurden. Wenn Du auf einen ausgewählten Tag klickst, wird er abgewählt und das Fenster an der Seite wird entsperrt, sodass er sich wieder wie ein markierter Tag verhält. Ein Pfeil auf dem Tag zeigt an, dass an diesem Tag mehr als 4 Errungenschaften erworben wurden. 

Optionen (1)
|T:1:8|t- Beim (erneuten) Öffnen des Kalenders kann man wählen, ob immer der zuletzt betrachtete Monat ausgewählt bleiben soll ({lockMonth}) oder nur, wenn man auf eine Errungenschaft klickt ({lockAchievementMonth}).
|T:1:8|t- Der erste Tag der Woche kann geändert werden und ist derzeit auf {firstWeekDay} eingestellt.

(1) Die Optionen befinden sich unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {calendar}.]=]
L["Calendar Events"] = "Kalender Ereignisse"
L["Call of the Crusade"] = "Der Ruf des Kreuzzugs"
L["Cataclysm (pre-patch)"] = true
L["Categories"] = "Kategorien"
L["Categories not loaded"] = "{addonName} ist noch nicht vollständig geladen. Schließ das Erfolgsfenster und öffne es erneut, um die angezeigten Kategorien zu aktualisieren."
L["Categories width offset"] = "Kategorien Fensterbreite"
L["Categories width offset Desc"] = [=[Die zusätzliche Breite, die zur Standardkategorienbreite addiert oder von ihr subtrahiert wird.

Dieser Wert kann geändert werden, während das Erfolgsfenster geöffnet ist und eine der von {AddonName} hinzugefügten Tabs ausgewählt wurde. Dies kann Auswirkungen (1) auf das Spiel haben.

(1) FPS-Einbrüche und Stottern während der Anpassung des Wertes, NICHT während der normalen Addon-Nutzung.

{reloadRequired}]=]
L["Category shown temporarily"] = "Diese Kategorie wurde durch Klicken auf die {eventName} Event Erinnerung ausgewählt und wird nur vorübergehend angezeigt, da sie keine Erfolge enthält, die den eingestellten Filtern entsprechen."
L["Caverns Criss-Cross"] = "Kreuz und quer durch die Höhlen"
L["Center Header"] = "Erfolgs-Überschrift zentrieren"
L["Center header"] = "Kopfzeile zentrieren"
L["Center header Desc"] = "Zentriere die Kopfzeile im Erfolgsfenster."
L["Center Header Desc"] = "Zentriere die Erfolgs-Überschrift"
L["Central Circuit"] = "Zentralrundstrecke"
L["Chains of Domination"] = "Ketten der Herrschaft"
L["Character / Account wide"] = "Charakter & Account"
L["Character only"] = "Nur Charakter-Erfolge"
L["Character Specific"] = "Charakter-spezifisch"
L["Character Specific Desc"] = "Die {watchList} umfasst immer einen accountweiten Datensatz, der alle beobachteten Erfolge für alle Charaktere aufzeichnet. Wenn sie deaktiviert wird, wird dieser kontoübergreifende Datensatz verwendet. Wenn sie für die charakterspezifische Verwendung aktiviert wird, wechseln alle Charaktere, die das gleiche Profil verwenden, in diesen Modus. Bei der Deaktivierung wird die accountweite {watchList} wieder verwendet und die charakterspezifische {watchList} wird entfernt."
L["Characters"] = "Charaktere"
L["Chat messages"] = "Chat-Mitteilungen"
L["Checked"] = "Aktivert"
L["Children's Week"] = "Kinderwoche"
L["Class Halls"] = "Klassenhallen"
L["Clear all"] = "Alle löschen"
L["Clear all Desc"] = "Löschen Sie alle Erfolge von der Beobachtungsliste."
L["Clear search field on Right Click"] = "Lösche das Such-Feld durch Rechts-Klick."
L["Clear search field on Right Click Desc"] = "Aktiviere/deaktiviere das Löschen des Suchfeldes, wenn Du mit der rechten Maustaste darauf klickst."
L["Click here to view in achievement window"] = "Hier klicken, um im Erfolgs-Fenster anzuzeigen"
L["Click here to view in achievements"] = "Im Erfolgs-Fenster öffnen"
L["Cliffside Circuit"] = "Klippenrundstrecke"
L["Cobalt Assembly"] = "Kobaltkonvent"
L["Coldheart Interstitia"] = "Kaltherzinterstitia"
L["Collapse Chain"] = "Serien-Erfolge Ausblenden"
L["Collecting data"] = "Sammle Daten..."
L["Collector's Edition"] = true
L["Comments"] = "Kommentare"
L["Community Feast"] = "Gemeinschaftliches Festmahl"
L["Community Feast: Active"] = "Gemeinschaftliches Festmahl: Aktiv"
L["Community Feast: Cooking"] = "Gemeinschaftliches Festmahl: Kochen"
L["Community Feast: Next"] = "Gemeinschaftliches Festmahl: Nächstes Event"
L["Community Feast: Ready"] = "Gemeinschaftliches Festmahl: Fertig"
L["Community Feast: Soon"] = "Gemeinschaftliches Festmahl: Startet Bald"
L["Community Feast: Starting Soon"] = "Gemeinschaftliches Festmahl: Startet Bald"
L["Compact"] = "Kompakte Erfolge anzeigen"
L["Compact Achievements"] = "Kompakte Erfolgs-Fenster anzeigen"
L["Compact Achievements Desc"] = "Die Anzeige der Erfolge ist auf 2/3 der ursprünglichen Größe verkleinert, ähnlich wie bei der Zusammenfassung der Erfolge."
L["Compact Achievements T Desc"] = [=[- Erfolge sind 2/3 so groß wie die zusammengefassten Errungenschaften.
- Zeigt entweder die erste Zeile der Beschreibung oder die Belohnung an.

Kompakte Erfolge können in den Optionen ({compactEnabled}) aktiviert werden (1).

(1) Die Optionen befinden sich unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}.]=]
L["Compact Desc"] = [=[Verwende eine kompaktere Version mit nur einer Zeile der Zeitanzeige.

{reloadRequired} ]=]
L["Completion"] = "Komplettierung"
L["Copy Account Wide to Character"] = "Account-übergreifend auf Beobachtungsliste pro Charakter umstellen"
L["Copy Account Wide to Character Desc"] = "Kopiere die accountweite {watchList} (alle von allen Charakteren beobachteten Erfolge) in die aktuelle charakterspezifische {watchList}. Von nun an wird dieser Charakter seine eigene {watchList} haben."
L["Covenant"] = "Pakt"
L["Covenant Assaults"] = "Paktangriffe"
L["Covenant assaults"] = "Paktangriffe"
L["Credits"] = true
L["Criteria"] = "Kriterien"
L["Criteria Behaviour"] = "Erfolgs-Kriterien Darstellung"
L["Criteria Behaviour Desc"] = [=[So verhält sich ein Kriterium mit zu langem Text.

|T:1:8|t- {overflow}: Der Text wird wie üblich angezeigt und läuft einfach über. Dies kann dazu führen, dass sich Texte überschneiden.
|T:1:8|t- {truncate}: Schneidet den Text ab und zeigt '...' am Ende an.
|T:1:8|t- {flexible}: Kriterien mit zu langen Texten werden in eine neue Zeile gesetzt. Andere Kriterien werden in zwei Spalten angezeigt. ]=]
L["Criteria is Completed"] = "Kriterien erfüllt sind"
L["Criteria is Completed Desc"] = "Erfolgs-Kriterien anzeigen, auch wenn die Erfolgs-Kriterien bereits erfüllt sind."
L["Criteria of"] = "Kriterien"
L["Cross-Expansion"] = "Addon-Übergreifend"
L["Ctrl"] = true
L["Current Obtainable"] = "Aktuell Erreichbar"
L["Current Zone"] = "Aktuelle Zone"
L["CurseForge"] = true
L["CurseForge Desc"] = "Öffnet ein Popup-Fenster mit einem Link zur Seite {addonName} {curseForge}."
L["Custom"] = "Benutzerdefiniert"
L["Dark Heart"] = "Das Dunkle Herz"
L["Darkmoon Faire"] = "Dunkelmond-Jahrmarkt"
L["Dastardly Duos"] = "Durchtriebene Duos"
L["Data Manager"] = "Charakterübersicht"
L["Date and Time format"] = "Datum und Zeit (Format)"
L["Date and Time formatting guide"] = "Formatierungsanleitung für Datum und Uhrzeit"
L["Date and Time formatting guide Desc"] = [=[{a} - Abbreviated weekday name (eg. Wed)
{A} - Full weekday name (eg. Wednesday)
{b} - Abbreviated month name (eg. Sep)
{B} - Full month name (eg. September)
{c} - Date and time representation appropriate for locale (eg. 23/04/07 10:20:41)
{C} - The century number (year/100) (eg. 20)
{d} - Day of month as decimal number (01 - 31)
{D} - Equivalent to %m/%d/%y (eg. 04/23/07)
{e} - Day of month as decimal number (1 - 31)
{H} - Hour in 24-hour format (00 - 23)
{I} - Hour in 12-hour format (01 - 12)
{j} - Day of year as decimal number (001 - 366)
{k} - Hour in 24-hour format (0 - 23)
{l} - Hour in 12-hour format (1 - 12)
{m} - Month as decimal number (01 - 12)
{M} - Minute as decimal number (00 - 59)
{p} - Current locale's A.M./P.M. indicator for 12-hour clock (eg. AM/PM)
{P} - Current locale's A.M./P.M. indicator for 12-hour clock (eg. am/pm)
{R} - Equivalent to %H:%M (eg. 10:20)
{s} - Number of second since Epoch, i.e., since 1970-01-01 00:00:00 UTC (1177323641)
{S} - Second as decimal number (00 - 59)
{u} - Weekday as decimal number (1 - 7; Monday is 1)
{U} - Week of year as decimal number, with Sunday as first day of week 1 (00 - 53)
{w} - Weekday as decimal number (0 - 6; Sunday is 0)
{W} - Week of year as decimal number, with Monday as first day of week 1 (00 - 53)
{x} - Date representation for current locale (Standard date string)
{X} - Time representation for current locale (Standard time string)
{y} - Year without century, as decimal number (00 - 99) (eg. 07)
{Y} - Year with century, as decimal number (eg. 2007)
{z} - Time-zone as hour offset from GMT (eg. +0200)
{Z} - Time-zone name or abbreviation; no characters if time zone is unknown ]=]
L["Day of the Dead"] = "Tag der Toten"
L["Debug"] = true
L["Debug Desc"] = "Jede der unten aufgeführten Optionen ist für Debugging- und Testzwecke verfügbar. Verwendung auf eigene Gefahr!"
L["Default value"] = "Vorgabewert (Standard)"
L["Defending Azeroth Assaults"] = "Verteidigung Azeroths"
L["Defending the Ruby Sanctum"] = "Sturm auf das Rubinsanktum"
L["Deselect All"] = "Alle abwählen"
L["Diablo"] = true
L["Diablo III"] = "Diablo 3"
L["Diablo IV"] = "Diablo 4"
L["Discord"] = true
L["Discord Desc"] = "Öffnet ein Popup-Fenster mit einem Link zum {serverName} Discord-Server. Hier können Sie Kommentare, Berichte, Bemerkungen, Ideen und alles andere posten."
L["Donations"] = "Spenden"
L["Dos-Ryga"] = true
L["Down"] = "Runter"
L["Dragon Glyphs"] = "Drachenglyphen"
L["Dragon Racing"] = "Drachenrennen"
L["Dragonbane Keep"] = "Drachenfluchfestung"
L["Dragonblight"] = "Drachenöde"
L["Dragonflight (pre-patch)"] = true
L["Dragonriding"] = "Drachenreiten"
L["Dragonriding Races"] = "Drachenreiten"
L["Dreamsurge"] = "Traumsprünge"
L["Dreamsurges"] = "Traumsprünge"
L["Drops"] = "Beute"
L["Drustvar"] = true
L["Dueler's Guild"] = "Duellantengilde"
L["during"] = "während"
L["Dustwallow Marsh"] = "Düstermarschen"
L["Earned By"] = "Erzielt durch"
L["Earned By Desc"] = [=[Header
|T:1:8|t- {achievementPointsEarnedBy}: Zeigt {achievementPointsEarnedBy_wc} Ihren aktuellen Charakter und/oder {achievementPointsEarnedBy_wc} Ihren Account an ({achievementPointsEarnedByFormat}) (1).
|T:1:8|t- {tooltip}: Übersicht darüber, welcher Charakter wie viele Erfolgspunkte verdient hat. Jeder Charakter muss mindestens einmal eingeloggt sein, um in diese Liste aufgenommen zu werden. Zeigt den Realm des Charakters an, wenn er unterschiedlich ist. Kann in den Optionen (1) so eingestellt werden, dass er immer angezeigt wird: Erfolge werden berücksichtigt, wenn sie mit einem beliebigen Charakter Ihres Kontos erzielt wurden (Standard).

|T:1:8|t- {character}: Erfolge werden nur dann als erworben markiert wenn sie mit dem aktuellen Charakter erzielt wurden und als teilweise erworben, wenn nicht mit dem aktuellen Charakter erworben wurden.

Tooltip
|T:1:8|t- {earnedBy}: Zeigt {earnedByNumber} Charaktere an, die den Erfolg verdient haben (2). Fraktions-exklusive Errungenschaften mit einem verknüpften Gegenstück werden berücksichtigt. D.h. Allianz-Charaktere können für Horden-Erfolge auftauchen. Zeigt den Realm des Charakters an, wenn er unterschiedlich ist. Kann über die Optionen (2) erzwungen werden, immer anzuzeigen: Zeigt {notEarnedByNumber} Charaktere an, die diese Errungenschaft noch nicht verdient haben (2). Fraktions-exklusive Errungenschaften mit einem verknüpften Gegenstück werden berücksichtigt. D.h. Allianz-Charaktere können für Horden-Errungenschaften auftauchen.  Zeigt den Realm des Charakters an, wenn er sich unterscheidet. Die Anzeige kann in den Optionen (2) erzwungen werden.

(1) Die Optionen befinden sich unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {header}
(2) Optionen finden Sie unter {gameMenu} {Pfeil} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}]=]
L["Eastern Kingdoms Cup"] = "Östliche Königreiche Pokal"
L["Echoes of Doom"] = "Die Vorboten des Unheils"
L["Emberflow Flight"] = "Glutstrom-Flug"
L["Embers of Neltharion"] = "Glut von Neltharion"
L["Emerald Garden Ascent"] = "Smaragdgartenaufstieg"
L["Enable"] = "Aktivieren"
L["Enable debug info"] = "Debug-Informationen einschalten"
L["Enable debug info Desc"] = "Debug-Informationen einschalten/ausschalten"
L["Enable Desc"] = "Aktivieren / Deaktivieren Sie das Plugin. Wenn das Plugin hier deaktiviert ist ABER das Addon aktiv ist, können unvorhersehbare Dinge passieren."
L["Enable Tab Priority"] = "Tab-Priorität aktivieren"
L["Enable Tab Priority Desc"] = "Aktiviere die Tab-Prioritäts-Option"
L["Enable trace info"] = "Trace-Informationen einschalten"
L["Enable trace info Desc"] = "Trace-Informationen einschalten/ausschalten"
L["Enable Upcoming Calendar Events"] = "Aktiviere Anstehende Kalender-Ereignisse"
L["Enable Upcoming Calendar Events Desc"] = "Wenn deaktiviert, wird das {upcomingCalendarEvents} Modul deaktviert."
L["End Time"] = "Ende (Zeit)"
L["Enhanced filtering and sorting"] = "Erweitertes Filtern und Sortieren"
L["Enhanced filtering and sorting Desc"] = [=[Das Filtern und Sortieren von Erfolgen wurde um folgende Funktionen erweitert.

Kategorien:
|T:1:8|t- {mergeSmallCategories}: Kategorien zusammenführen, wenn dies bei weniger als {mergeSmallCategoriesNumber} Erfolgen (1) möglich ist.

Filterung (mehrere Filter können gleichzeitig ausgewählt werden):
|T:1:8|t- {completed}: Erreichte Erfolge anzeigen.
|T:1:8|t- {notCompleted}: Nicht abgeschlossene Erfolge anzeigen.
|T:1:8|t- {obtainable}: Erreichbare Erfolge anzeigen.
|T:1:8|t- {notObtainable}: Nicht erreichbare Erfolge anzeigen.
|T:1:8|t- {faction} ({resetFactionFilters} {resetFactionFiltersEnabled}) (2)
|T:1:8|t- {neutral}: Zeigt Erfolge an, die von {alliance_wc} wie auch von {horde_wc} erworben werden können.
|T:1:8|t|T:1:8|t- {alliance}: Zeigt Erfolge an, die nur von {alliance_wc} erworben werden können.
|T:1:8|t|T:1:8|t- {horde}: Zeige Erfolge, die nur von {horde_wc} verdient werden können.
|T:1:8|t- {excluded}: Ausgeschlossene Erfolge anzeigen.
|T:1:8|t- {collapseChain}: Nur den letzten abgeschlossenen und den ersten nicht abgeschlossenen Erfolg in einer Serie anzeigen.

Sortierung:
|T:1:8|t- {noSorting}: Keine Sortierung angewandt.
|T:1:8|t- {sortByName}: Sortieren von Erfolgen basierend auf ihren Namen.
|T:1:8|t- {sortByCompletion}: Sortiert Erfolge danach, ob sie abgeschlossen sind oder nicht.
|T:1:8|t- {sortByID}: Sortiert die Erfolge nach ihrer ID.
|T:1:8|t- {reverseSort}: Wenn dies ausgewählt ist, wird die Reihenfolge der sortierten Erfolge umgekehrt.

{tabs}:
|T:1:8|t- Diese haben alle oben genannten Filter und Sortierfunktionen, können aber unabhängig von den anderen geändert werden.
|T:1:8|t- Wenn Sie einen der oben genannten Filter ändern, werden die Filter und Sortierfunktionen der einzelnen Registerkarten überschrieben. 

{specialCategories}:
|T:1:8|t- Diese haben alle oben erwähnten Filter und Sortierfunktionen, können aber unabhängig von den anderen geändert werden.

{earnedBy} (siehe {earnedByTutorial} für weitere Details)
|T:1:8|t- {account}: Erfolge werden berücksichtigt, wenn sie mit einem beliebigen Charakter Ihres Kontos erzielt wurden: Erfolge werden gewertet, wenn sie mit dem aktuellen Charakter erzielt wurden, und teilweise gewertet, wenn sie mit einem anderen Charakter auf dem Konto erzielt wurden, aber nicht mit dem aktuellen Charakter.

Sonstiges:
|T:1:8|t- {help}: Startet das Tutorial von Anfang an.
|T:1:8|t- Zeigt die spezielle Tutorial-Seite an, ohne das Gesehene zurückzusetzen.
|T:1:8|t- {options}: Öffnet die Optionen des Addons (2).

Mehr Filter und Sortieroptionen können auf {discord} oder {curseForge} (Links in den Optionen) abgerufen werden.

(1) Die Optionen befinden sich unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}
(2) Optionen finden Sie unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName}.]=]
L["Enhanced tooltip"] = "Erweiterter Tooltip"
L["Enhanced tooltip Achievements Desc"] = [=[Jeder Tooltip enthält zusätzliche Informationen darüber, wie Erfolge miteinander in Beziehung stehen (falls sie es tun). Es wurden mehrere neue Bereiche hinzugefügt.

Features:
|T:1:8|t- {notObtainable}: Zeigt einen Hinweis '{noLongerObtainable}', wenn der Erfolg nicht mehr erreichbar ist.
|T:1:8|t- {earnedBy}: Siehe {earnedBy} für weitere Informationen.
|T:1:8|t- {partOfAChain}: Zeigt die Liste der Erfolge an, zu denen der Serien-Erfolg gehört (1) ({partOfAChainEnabled}) (2).
|T:1:8|t- {requiredFor}: Zeigt eine Liste der Erfolge an, für die der Serien-Erfolg abgeschlossen werden muss, um ihn zu erhalten (1) ({requiredForEnabled}) (2).
|T:1:8|t- {otherFaction}: Zeigt den zugehörigen Erfolg der anderen Fraktion ({otherFactionEnabled}) (2).
|T:1:8|t- {objectivesProgress}: Zeigt eine Liste der Ziele mit Fortschritt an ({objectivesProgressEnabled}) (2).
|T:1:8|t- Benutzerdefinierte Ziele: Einige Errungenschaften haben benutzerdefinierte Ziele, wie z.B. die Transmog-Errungenschaften, die den Fortschritt bei den entsprechenden Transmog-Sets anzeigen.

Icons:
|T:1:8|t- {ready}: Der Erfolg ist abgeschlossen.
|T:1:8|t- {waiting}: Der Erfolg ist noch nicht abgeschlossen.
|T:1:8|t- {notready}: Der Erfolg kann nicht mehr erreicht werden.

Farben:
|T:1:8|t- {green}: Der Erfolg/das Ziel ist abgeschlossen.
|T:1:8|t- {grey}: Der Erfolg/das Ziel ist nicht abgeschlossen.
|T:1:8|t- {red}: Der Erfolg kann nicht mehr erreicht werden.
|T:1:8|t- Hell {lightGreen}, {lightGrey} oder {lightRed}: Der Erfolg ist in ein Serien-Erfolg.

Weitere benutzerdefinierte Informationen können auf {discord} oder {curseForge} (Links in den Optionen) angefordert werden.

(1) Optional können zwei Icons pro Zeile angezeigt werden. Das erste Icon ist das Standard-Icon, das zweite ist für den aktuellen Charakter ({currentCharacterIconEnabled}) (2).
(2) Die Optionen finden sich unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}.]=]
L["Enhanced tooltip Categories Desc"] = [=[Jeder Tooltip enthält zusätzliche Informationen darüber, wie viele Erfolge noch erreichbar bzw. nicht mehr erreichbar sowie abgeschlossen bzw. noch nicht abgeschlossen sind.

Die Zahlen im Fortschrittsbalken haben das folgende Format:
|T:1:8|tOC (+NONC) / T
|T:1:8|t|T:1:8|t- {oc}: Die nicht erreichten noch nicht abgeschlossenen Erfolge.
|T:1:8|t|T:1:8|t- {nonc}: Die nicht mehr erhältlichen, nicht abgeschlossenen Erfolge (1).
|T:1:8|t|T:1:8|t- T: Gesamt-Anzahl der Erfolge.

Die Farben bedeuten folgendes:
|T:1:8|t- {green}: Die nicht erreichten noch nicht abgeschlossenen Erfolge.
|T:1:8|t- {red}: Die nicht mehr erhältlichen, nicht abgeschlossenen Erfolge (1).
|T:1:8|t- Weiss: Alle noch erreichbaren nicht abgeschlossenen Erfolge.

Der rote Teil des Fortschrittsbalkens und die Zahl in Klammern können entweder in den Optionen  ({showNotObtainable}) (1) oder durch Deaktivieren des Filters {notObtainable} deaktiviert werden.

(1) Die Optionen findest Du unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}.]=]
L["Error Tabs Order"] = "{blizzard} Tab {statistics} kann nicht vor {guild} stehen."
L["Escalation"] = "Eskalation"
L["Eternity's End"] = "Ende der Ewigkeit"
L["Event Reminder"] = "Event Erinnerung"
L["Event Reminder Desc"] = [=[{events} werden zum neuen Tab {events} hinzugefügt und eine Erinnerung erscheint (max. {numPopUps} zur gleichen Zeit), wenn eines der Ereignisse aktiv ist ({popUpEnabled}) (1).

Die Ereigniserinnerung hat den Namen des Ereignisses und bis zu 2 Zeilen Zeitanzeige (Endzeit des Ereignisses) (1).
Das Format der Zeitanzeige kann aus vordefinierten Vorgaben oder auch Benutzerdefiniert ausgewählt werden (1).
Es existiert auch eine kompakte Version mit einer einzigen Zeile für die Zeitanzeige (compactEnabled) (1). 

Ein Klick auf die Ereigniserinnerung öffnet die dazugehörige Kategorie mit den noch erreichbaren Erfolgen, solange das Ereignis aktiv ist.
Die Ereigniserinnerung verschwindet, wenn mit der rechten Maustaste auf die Erinnerung geklickt wird oder nach {eventAlertFadeDelay} Sekunden, wenn die Erinnerung ignoriert wird (1). 

Die Erinnerung wird auch auf der rechten Seite des Erfolg-Fensters angezeigt.

Ereignistypen:
|T:1:8|t- Kalender-Ereignisse (z.B.: Feiertage).
|T:1:8|t- Widget-Ereignisse (z.B.: Torghast).
|T:1:8|t- Welt-Ereignisse (z.B.: Angriffe).

(1) Die Optionen findest Du unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {eventReminders}.]=]
L["Event Reminders"] = "Event Erinnerung"
L["Event Reminders Enable Desc"] = "Wenn deaktiviert, wird das gesamte {eventReminders} Modul ausgeschaltet."
L["Events"] = "Ereignisse"
L["Exclude"] = "Ausblenden"
L["Exclude Excluded achievements"] = "Ausgeschlossene Erfolge Suchen"
L["Exclude Excluded achievements Desc"] = "Ausgeschlossene Erfolge von den Suchergebnissen ausschließen bzw. in die Suchergebnisse aufnehmen."
L["Excluded"] = "Filter: Erfolg Ausgeblendet"
L["Expansions"] = "Erweiterungen"
L["Expansions tab"] = "Erweiterungen-Tab"
L["Expansions tab Desc"] = [=[Erfolge werden in Kategorien pro Erweiterung mit einer logischeren Hierarchie gruppiert.

Die Hierarchie ist wie folgt: 
|T:1:8|t- {expansion}
|T:1:8|t|T:1:8|t- {zones}
|T:1:8|t|T:1:8|t- {quests}
|T:1:8|t|T:1:8|t- {exploration}
|T:1:8|t|T:1:8|t- {pvp}
|T:1:8|t|T:1:8|t- {reputation}
|T:1:8|t|T:1:8|t- {dungeons}
|T:1:8|t|T:1:8|t- {raids}
|T:1:8|t|T:1:8|t- {petBattles}
|T:1:8|t|T:1:8|t- {expansionFeatures}

Spezielle Kategorien: 
|T:1:8|t- {currentZone}: Zeigt die Erfolge an, die mit der aktuellen Zone verknüpft sind, in der Sie sich befinden.
|T:1:8|t- {selectedZone}: Zeigt die Erfolge an, die mit der ausgewählten Zone auf der Weltkarte verknüpft sind.
|T:1:8|t- {watchListCategory}: Zeigt die Erfolge an die sich auf Ihrer Beobachtungs-Liste befinden. Errungenschaften können mit oder ohne ihre Unterkategorien angezeigt werden (1).
|T:1:8|t- {excludedCategory}: Zeigt die ausgeschlossenen Erfolge an. Erfolge können mit oder ohne ihre Unterkategorien (1) angezeigt werden. Kann dauerhaft aus den Optionen ausgeblendet werden (1).

(1) Die Optionen findest du unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}.]=]
L["Export"] = true
L["Export Criteria"] = "Erfolgs-Kriterien Export"
L["Export Criteria Desc"] = "Exportiert Erfolgs-Kriterien in die Gespeicherten Variablen. Dies wird verwendet, um neue Inhalte hinzuzufügen."
L["Export Missing Achievements"] = "Fehlende Erfolge exportieren"
L["Export Missing Achievements Desc"] = "Exportiere die fehlenden Erfolge. Dies ist eine Debug-Funktion und sollte nicht verwendet werden."
L["Export Removed Achievements"] = "Entfernte Erfolge exportieren"
L["Export Removed Achievements Desc"] = "Exportiere die entfernten Erfolge. Dies ist eine Debug-Funktion und sollte nicht verwendet werden."
L["Faction Assaults"] = "Fraktionsübergriffe"
L["Faction Icon Transparency"] = "Fraktions Symbol Transparenz"
L["Faction Icon Transparency Desc"] = "Die Transparenz des Fraktionssymbols, wobei 0 für völlig transparent und 1 für völlig undurchsichtig steht."
L["Fade delay"] = "Ausblendeverzögerung"
L["Fade delay Desc"] = "Zeit in Sekunden, die das Ereignis Popup-Fenster braucht, um zu verschwinden, wenn es ignoriert wird. Mit einem Rechtsklick kann es sofort geschlossen werden."
L["Fall of the Lich King"] = "Der Untergang des Lichkönigs"
L["Fated Raids"] = "Schicksalhafte Raids"
L["Fated Raids: Castle Nathria"] = "Schicksalhafte Raids: Schloss Nathria"
L["Fated Raids: Castle Nathria (CN)"] = "Schicksalhafte Raids: Schloss Nathria (CN)"
L["Fated Raids: Castle Nathria (EU)"] = "Schicksalhafte Raids: Schloss Nathria (EU)"
L["Fated Raids: Castle Nathria (US)"] = "Schicksalhafte Raids: Schloss Nathria (US)"
L["Fated Raids: Sanctum of Domination"] = "Schicksalhafte Raids: Sanktum der Herrschaft"
L["Fated Raids: Sanctum of Domination (CN)"] = "Schicksalhafte Raids: Sanktum der Herrschaft (CN)"
L["Fated Raids: Sanctum of Domination (EU)"] = "Schicksalhafte Raids: Sanktum der Herrschaft (EU)"
L["Fated Raids: Sanctum of Domination (US)"] = "Schicksalhafte Raids: Sanktum der Herrschaft (US)"
L["Fated Raids: Sepulcher of the First Ones"] = "Schicksalhafte Raids: Mausoleum der Ersten"
L["Fated Raids: Sepulcher of the First Ones (CN)"] = "Schicksalhafte Raids: Mausoleum der Ersten (CN)"
L["Fated Raids: Sepulcher of the First Ones (EU)"] = "Schicksalhafte Raids: Mausoleum der Ersten (EU)"
L["Fated Raids: Sepulcher of the First Ones (US)"] = "Schicksalhafte Raids: Mausoleum der Ersten (US)"
L["Feast of Winter Veil"] = "Winterhauch"
L["Fen Flythrough"] = "Moor-Durchflug"
L["Filters"] = "Filter"
L["Firestorms"] = "Feuerstürme"
L["First day of the week"] = "Erster Tag der Woche"
L["First day of the week Desc"] = "Der erste Tag der Woche, den der Kalender verwenden soll."
L["FixTabs"] = [=[Es werden einmalig wieder alle Tabs angezeigt. Dies war notwendig, um die neue Funktion zur Sortierung der Registerkarten einzuführen.
Entschuldige bitte die Unannehmlichkeiten. ]=]
L["Flashfrost Flyover"] = "Blitzfrost-Überflug"
L["Flexible"] = "Flexibel"
L["Flowing Pandaren Spirit"] = "Fließender Pandarengeist"
L["for achievement"] = "für {achievement}"
L["Force two columns"] = "Zwei Spalten erzwingen"
L["Force two columns Desc"] = "Aktiviere/deaktiviere den Algorithmus zur Erzwingung von zwei Spalten für die Erfolgs-Ziele. Wenn diese Option aktiviert ist und nur eine Spalte mit Zielen angezeigt wird, weil der Text eines oder mehrerer Ziele zu lang ist, wird auf der Grundlage der anderen Einstellungen eine zweite Spalte erzwungen."
L["Force two columns threshold"] = "Schwelle für zwei Spalten erzwingen"
L["Force two columns threshold Desc"] = "Die Anzahl der Kriterien, die der Erfolg haben muss, damit eine zweite Spalte angezeigt wird, wenn normalerweise nur eine angezeigt würde."
L["Forget Me Not: Next"] = "Theatertruppe: Vergissmeinnicht: Bald"
L["Format"] = true
L["Fracture Chambers"] = "Frakturkammern"
L["Fractures in Time"] = "Risse in der Zeit"
L["from"] = "von"
L["from the start of"] = "ab dem Beginn der"
L["Full Search"] = "Vollständige Suche"
L["Full Search Desc"] = "Durch die Auswahl von \"{showAllResults}\" kannst Du alle Suchergebnisse anzeigen lassen. Weitere Einzelheiten findest Du im {quickSearchTutorial}-Tutorial."
L["Fury Incarnate"] = "Inkarnation des Zorns"
L["Fury of Hellfire"] = "Zorn des Höllenfeuers"
L["Future Obtainable"] = "Erreichbarkeit in der Zukunft"
L["Fyrakk Assault"] = "Angriffe von Fyrakk"
L["Fyrakk Assaults"] = "Angriffe von Fyrakk"
L["Garden Gallivant"] = "Gartenpromenade"
L["Garrisons Update"] = "Garnisonsupdate"
L["Gathering"] = "Zusammenkunft"
L["Ghosts of K'aresh"] = "Geister von K'aresh"
L["Gifts"] = "Geschenke"
L["Gladiator's Sanctum"] = "Heiligtum des Gladiators"
L["Glory"] = "Standard"
L["Go back one achievement"] = "Einen Erfolg zurück blättern"
L["Go forward one achievement"] = "Einen Erfolg vorwärts blättern"
L["Go to"] = "Gehe zu"
L["Going away with"] = "Nicht mehr erzielbar ab"
L["Gorespine"] = "Blutstachel"
L["Grand Hunts"] = "Große Jagd"
L["Grand Hunts: Ohn'ahran Plains"] = "Große Jagd: Ebenen von Ohn'ahra"
L["Grand Hunts: Thaldraszus"] = "Große Jagd: Thaldraszus"
L["Grand Hunts: The Azure Span"] = "Große Jagd: Das Azurblaue Gebirge"
L["Grand Hunts: The Waking Shore"] = "Große Jagd: Die Küste des Erwachens"
L["Green"] = "Grün"
L["Grey"] = "Grau"
L["Greyhoof"] = "Grauhuf"
L["Grow direction"] = "Richtung"
L["Grow direction Desc"] = "Die Richtung, in der neue Benachrichtigungs-Fenster hinzugefügt werden sollen."
L["Guardians of the Dream"] = "Wächter des Traums"
L["Guides"] = "Hilfe-Leitfaden"
L["Hallow's End"] = "Schlotternächte"
L["Has Reward"] = "Belohnung verfügbar"
L["Header"] = true
L["Header tooltip"] = "Überschrift Tooltip"
L["Hearthstone"] = true
L["Hearthstone's 10th Anniversary"] = "10-jähriges Jubiläum von Hearthstone"
L["Heroes of the Storm"] = true
L["Hide Date Completed"] = "Erfolgs Abschluss-Datum verbergen"
L["Hide Date Completed Desc"] = "Verbirgt das Datum, an dem der Erfolg abgeschlossen wurde."
L["Hide Not Earned By if current character earned the achievement"] = "{notEarnedBy} ausblenden, wenn der aktuelle Charakter den Erfolg schon erlangt hat"
L["Hide Not Earned By if current character earned the achievement Desc"] = "Blendet den Abschnitt {notEarnedBy} aus, wenn der aktuelle Charakter den Erfolg erworben hat. Der Abschnitt {earnedBy} wird ansonsten weiterhin wie gewohnt angezeigt."
L["Highmountain"] = "Der Hochberg"
L["Holidays"] = "Feiertage"
L["Horizontal position"] = "Horizontale Position"
L["Horrific Visions Revisited"] = "Überarbeitete Verstörende Visionen"
L["Hour of Twilight"] = "Die Stunde des Zwielichts"
L["Housing Decor"] = "Behausungsdekorationen"
L["Icon Left click"] = "um das \"Erfolge\" Fenster zu öffnen."
L["Icon Right click"] = "für die Optionen."
L["ID"] = true
L["Ignore"] = "Ignorieren"
L["Ignore Filters"] = "Filter Ingorieren"
L["Ignore Filters Desc"] = "Ignoriere jegliche Filter und zeige alle Erfolge in dieser {category}."
L["Imbu"] = true
L["Import"] = true
L["In"] = "in"
L["in"] = true
L["In instances"] = "In einer Instanz"
L["Include"] = "Hinzufügen"
L["Include all"] = "\"Filter: Erfolge ausgeblendet\" einbeziehen"
L["Include all Desc"] = "Schließen Sie alle ausgeschlossenen Erfolge mit ein."
L["Indentation"] = "Unterkategorien einrücken"
L["Indentation Desc"] = "Die Breite der Einrückung von Unterkategorien."
L["Invasions"] = "Invasionen"
L["is"] = "ist"
L["Iskaara Flyover"] = "Iskaara-Überflug"
L["Kafi"] = true
L["Kalimdor Cup"] = "Kalimdor Pokal"
L["Ka'wi the Gorger"] = "Ka'wi der Schlinger"
L["Keep current character"] = "Aktuellen Charakter beibehalten"
L["Keep current character Desc"] = "Behalte den aktuellen Charakter im Tooltip der Charaktere, unabhängig davon, ob der Charakter von der Liste durch die {maxNumChar} abgeschnitten werden würde oder nicht."
L["Keybindings Desc"] = "Um die Tastaturbelegung für {addonName} zu ändern, wählen Sie den Tab \"Spiel\" oben links in diesem Fenster. Wählen Sie dann die Kategorie {keybindings} auf der linken Seite. Wählen Sie schließlich AddOns in der rechten Ansicht."
L["Kyrian Assault"] = "Kyrian Paktangriff"
L["Landfall"] = "Invasion"
L["Layout"] = true
L["Left"] = "Links"
L["Left Alt"] = "Links Alt"
L["Left click"] = "Links-Klick"
L["Left Ctrl"] = "Links Ctrl"
L["Left Shift"] = "Links Shift"
L["Legacy of Arathor"] = "Vermächtnis von Arathor"
L["Legion Assaults"] = "Angriffe der Legion"
L["Legion Remix"] = true
L["Legion: Remix"] = true
L["Level 80"] = true
L["Level 85"] = true
L["Level 90"] = true
L["Leveling"] = "Level"
L["Line"] = "Zeile"
L["Load Tracking Achievements"] = "Tracking-Erfolge anzeigen"
L["Load Tracking Achievements Desc"] = "Anzeige von Erfolgen, die als Tracking-Erfolge gekennzeichnet sind und normalerweise für den Spieler nicht sichtbar sind. Dies ermöglicht auch die Suche und Anzeige dieser im Erfolgsfenster."
L["Loaded"] = "Geladen"
L["Loaded Desc"] = "Zeigt an, ob das mit dem Plugin verbundene Addon geladen ist oder nicht."
L["Localizations"] = "Sprach-Lokalisierungen"
L["Location"] = "Ort"
L["Lock month"] = "Gewählten Monat immer behalten."
L["Lock month Desc"] = "Behalte den zuletzt angezeigten immer Monat bei, wenn du den Kalender wieder öffnest, nachdem er geschlossen wurde."
L["Lock month when closed by achievement"] = "Gewählten Monat behalten beim Anklicken eines Erfolgs."
L["Lock month when closed by achievement Desc"] = "Behalte den zuletzt angezeigten Monat bei, wenn du den Kalender wieder öffnest, nachdem er durch Anklicken eines Erfolgs geschlossen wurde."
L["Lorewalking"] = "Lehrensuche"
L["Love is in the Air"] = "Liebe liegt in der Luft"
L["Lucky Yi"] = "Glückspilz Yi"
L["Lunar Festival"] = "Mondfest"
L["Make windows movable"] = "Fenster verschiebbar machen"
L["Make windows movable Desc"] = [=[Macht das Erfolgsfenster, die Kalenderansicht und die Charakterübersicht beweglich/nicht beweglich.

Wenn diese Option aktiviert ist, wird das jeweilige Fenster bei gedrückter linker Maustaste verschoben. Dies gilt für die Kopfzeile und die Ränder. ]=]
L["Mantid"] = "Mantis"
L["Maruukai Dash"] = "Maruukaispurt"
L["Max number of alerts"] = "Maximale Anzahl der Ereignis Popup-Fenster"
L["Max number of alerts Desc"] = "Die maximale Anzahl der gleichzeitig angezeigten Ereignis Popup-Fenster."
L["Maximum number of characters"] = "Maximale Charakter-Anzahl"
L["Maximum number of characters Desc"] = "Die maximale Anzahl der Charaktere, die im Tooltip angezeigt werden sollen."
L["Merge Small Categories"] = "Kleine Kategorien zusammenführen"
L["Merge small categories threshold"] = "Schwelle für kleine Kategorien zusammenführen"
L["Merge small categories threshold Desc"] = [=[Kategorien mit einer Anzahl von Erfolgen, die unter dieser Zahl liegt, werden mit der übergeordneten Kategorie verschmolzen.

Nur voreingestellte Kategorien können verschmolzen werden (meist untergeordnete Kategorien aus Zonen). Dies kann Auswirkungen (1) auf das Spiel haben.

(1) FPS-Einbrüche und Stottern beim Anpassen des Wertes, NICHT bei normaler Addon-Nutzung.]=]
L["Micro Button"] = "Micro-Button"
L["Midsummer Fire Festival"] = "Sonnenwende"
L["Minimum characters to search"] = "Mindestanzahl der zu suchenden Charaktere"
L["Minimum characters to search Desc"] = [=[Die Anzahl der Charaktere, die benötigt werden, um die Suche nach Erfolgen, die der Abfrage entsprechen, zu starten. Je kleiner die Zahl, desto größer die Auswirkung (1) auf das Spiel.

(1) FPS-Einbrüche und Stottern bei der Suche.]=]
L["Mirror of the Sky Dash"] = "Spurt zum Spiegel des Himmels"
L["Mists of Pandaria (pre-patch)"] = true
L["Modifiers"] = "Modifikatoren"
L["Mogu"] = true
L["More"] = "Mehr..."
L["Mort'regar"] = true
L["Most progress"] = "Fortschritt"
L["Mouse Wheel Scroll Speed"] = "Maus Rad Scroll-Geschwindigkeit"
L["Mouse Wheel Scroll Speed Desc"] = "Die Anzahl der {items}, die beim Klicken auf die Buttons nach oben/unten in der Scroll-Leiste oder beim Drehen des Mausrads neu angezeigt werden."
L["Movable"] = "Bewegliche Fenster"
L["Mythic+"] = true
L["Nazmir"] = true
L["Necrolord Assault"] = "Nekrolord Paktangriff"
L["Necrolords Assault"] = "Nekrolord Paktangriff"
L["never obtainable"] = "nicht erzielbar"
L["New Achievement Colors"] = "Neue Erfolgs-Farben"
L["New Achievement Colors Desc"] = [=[- Das Standard-Gold eines erhaltenen Erfolgs. Der Rahmen wird von Rot auf Gold geändert.
- Das neue Rot eines erhaltenen, nicht erhältlichen Erfolgs mit rotem Standardrahmen.
- Das neue Rot eines nicht erhaltenen, nicht erhältlichen Erfolgs mit grauem Standardrahmen.
- Das Standardblau eines erhaltenen, accountweiten Erfolgs mit blauem Standardrahmen. ]=]
L["New achievement window tabs"] = "Neue Tabs für das Erfolgs-Fenster"
L["New achievement window tabs Desc"] = [=[Dem Erfolg-Fenster werden durch {addonName_y} neue Tabs hinzugefügt.
Dies bietet eine neue Möglichkeit, Erfolge auf vertraute Weise anzuzeigen, ohne die Standard-Tabs zu beeinträchtigen.

Tabs:
|T:1:8|t- {achievements}: Eine Kopie der Standard-Registerkarte {achievements}, aber mit allen neuen Funktionen, die von {addonName_y} hinzugefügt wurden.
|T:1:8|t- {expansions}: Erfolge sind in Kategorien pro Erweiterung mit einer logischeren Hierarchie gruppiert. Siehe das {expansionsTabTutorial}-Tutorial für weitere Details.
|T:1:8|t- {events}: Erfolge sind in Kategorien pro Ereignis gruppiert. Dies reicht von Feiertagen bis hin zu Weltereignissen wie Angriffen.
|T:1:8|t- {pvp}: Erfolge sind in Kategorien pro Schlachtfeld gruppiert.
|T:1:8|t- {specials}: Diese Kategorien sind Sammlungen von Erfolgen, die Reittiere, Titel, Transmog und andere Dinge verleihen, die nirgendwo anders richtig hinpassen.

In den Optionen können sowohl die Standardreiter als auch die durch {addonName_y} hinzugefügten Reiter ausgeblendet werden (1).

(1) Die Optionen findest du unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {tabs}.]=]
L["News"] = "Neuigkeiten"
L["Next"] = "Weiter"
L["Next from startDate until endDate"] = "Demächst ab {startDate} bis {endDate}"
L["Next occurrence unknown"] = "Nächstes Erscheinungsdatum unbekannt"
L["Night Fae Assault"] = "Night Fae Paktangriff"
L["Nightfall"] = "Nachtsturz"
L["Nitun"] = true
L["No achievements are available with the current set of filters"] = "Es können keine Erfolge mit den von dir gesetzten Filtern angezeigt werden."
L["No category selected"] = "Keine Kategorie ausgewählt"
L["No characters found"] = "Keine Charaktere gefunden"
L["No data found"] = "Keine Inhalte gefunden"
L["No time data available"] = "Keine Zeitdaten verfügbar"
L["Noblegarden"] = "Nobelgarten"
L["Nokhudon Hold"] = "Festung Nokhudon"
L["NONC"] = true
L["None"] = "Keine"
L["No-No"] = true
L["Northrend Cup"] = "Northrend Pokal"
L["Not Categorized"] = "Nicht kategorisiert"
L["Not Earned By"] = "Nicht erzielt durch"
L["Not earned by:"] = "Nicht erzielt durch:"
L["Not loaded"] = "Nicht Geladen"
L["Not Obtainable"] = "Nicht Verfügbar"
L["Not part of set"] = "Nicht Teil des Transmog-Sets"
L["Number of Earned By characters"] = "Anzahl der {earnedBy} Charaktere"
L["Number of Earned By characters Desc"] = [=[Die Anzahl der Charaktere, die angezeigt werden, die den Erfolg erlangt haben.

 Wenn Du hier 0 einstellst, wird diese Funktion deaktiviert. ]=]
L["Number of lines"] = "Zeilen-Anzahl "
L["Number of Most progress characters"] = "Anzahl der Charaktere mit den größten Erfolgs-Fortschritten"
L["Number of Most progress characters Desc"] = [=[Die Anzahl der Charaktere, die angezeigt werden, die schon einen Erfolgs-Fortschritt gemacht haben.

Wenn Sie den Wert 0 einstellen, wird diese Funktion deaktiviert. ]=]
L["Number of Not Earned By characters"] = "Anzahl der {notEarnedBy} Charaktere"
L["Number of Not Earned By characters Desc"] = [=[Die Anzahl der Charaktere, die angezeigt werden, die den Erfolg nicht erlangt haben.

 Wenn Du hier 0 einstellst, wird diese Funktion deaktiviert. ]=]
L["Number of search previews"] = "Anzahl der Such-Vorschauen"
L["Number of search previews Desc"] = "Die Anzahl der Erfolge, die als Vorschau in der gesamten Liste der gefundenen Erfolge angezeigt werden."
L["Number of summary achievements"] = "Anzahl aller Erfolge"
L["Number of summary achievements Desc"] = "Die Anzahl der Erfolge, die in der Zusammenfassung der einzelnen Registerkarten angezeigt werden."
L["Number of Temporarily obtainable lines Desc"] = "Die Anzahl der Zeilen, die für {temporarilyObtainable} Erfolge angezeigt werden, wenn mehr als ein Zeitraum zum Erreichen des Erfolgs möglich war."
L["N'Zoth (Uldum)"] = true
L["N'Zoth (Vale of Eternal Blossoms)"] = "N'Zoth (Das Tal der ewigen Blüten)"
L["N'Zoth Assaults"] = "Angriffe von N'Zoth"
L["Objectives"] = "Ziele"
L["Objectives progress"] = "Erfolgs-Fortschritt"
L["Obtainable"] = "Verfügbar"
L["OC"] = true
L["Offsets"] = "Fenster Abstände"
L["Ohn'ahran Plains"] = "Ebenen von Ohn'ahra"
L["Ohn'ahran Plains: Next"] = "Ebenen von Ohn'ahra: Nächstes Event"
L["Ohn'iri Springs"] = "Quellen von Ohn'iri"
L["On Event Start"] = "Bei Ereignisbeginn"
L["On Login"] = "Beim Login"
L["On Reload"] = "Nach einem Reload"
L["only obtainable by one player"] = "nur von einem Spieler zu erzielen"
L["Only search filtered achievements"] = "Nur nach gefilterten Erfolgen suchen"
L["Only search filtered achievements Desc"] = "Nur Erfolge suchen, die mit den eingestellten Filtern sichtbar sind."
L["Only when time data is available"] = "Nur wenn Zeit-Daten verfügbar sind"
L["Open"] = "Öffnen"
L["Order"] = "Tab Reihenfolge"
L["Other"] = "Andere"
L["Other faction"] = "Andere Fraktion"
L["Other locations"] = "Weitere..."
L["Other wings"] = "Weitere Flügel"
L["Outland Cup"] = "Scherbenwelt Pokal"
L["Overflow"] = "Überlauf"
L["Overwatch"] = true
L["Pandaren"] = true
L["Pandaria Cup"] = "Pandaria Pokal"
L["Part of a chain"] = "Teil eines Serien-Erfolgs"
L["Passage Pathway"] = "Weg durch die Passage"
L["Past Obtainable"] = "Erreichbarkeit in der Vergangenheit"
L["Paste to Chat"] = "Kopiere in das Chat Fenster"
L["Patch"] = true
L["Pilgrim's Bounty"] = "Die Pilgerfreuden"
L["Pirates' Day"] = "Piratentag"
L["Placeholder"] = "Platzhalter"
L["Plugins"] = true
L["Plunderstorm"] = true
L["Points"] = "Punkte"
L["Pop ups"] = "Popup-Fenster"
L["Pre-Patch Event"] = true
L["Presets"] = "Voreinstellungen"
L["Primal Storms"] = "Urstürme"
L["Primalist Tomorrow"] = "Urzeitliche Primalisten"
L["Print map info"] = "Karten-ID einfügen"
L["Print map info Desc"] = "Füge die Karten-ID im Chat ein"
L["Print map info w/o reload"] = "Karten-ID ohne neu laden einfügen"
L["Print map info w/o reload Desc"] = "Füge die Karten-ID ohne neu laden ein"
L["PvE Season"] = "PvE Saison"
L["PvP"] = true
L["PvP Season"] = "PvP Saison"
L["Quick Search"] = "Schnell-Suche"
L["Quick Search Desc"] = [=[Durchsuche die durch {addonName} hinzugefügten Tabs nach Erfolgen. Die Standard-Tabs werden dabei nicht durchsucht. 

Features:
|T:1:8|t- Suche nach dem Titel und der Beschreibung eines Erfolgs; Alphabetisch sortiert nach dem Titel.
|T:1:8|t- Suche nach der ID eines Erfolgs indem die Suchanfrage mit '#' begonnen wird; Sortiert nach aufsteigender ID. 

Optionen (1): 
|T:1:8|t- {clearOnRightClick} ({clearOnRightClickEnabled})
|T:1:8|t- {excludeExcludedAchievements} ({excludeExcludedAchievementsEnabled} schließt Erfolge "{excludeExcludedAchievementsFrom}" aus den Suchergebnissen aus)
|T:1:8|t- {searchFilteredAchievements} ({searchFilteredAchievementsEnabled})
|T:1:8|t- {minCharToSearch} ({minCharToSearchNumber})
|T:1:8|t- {numSearchPreviews} ({numSearchPreviewsNumber})

(1) Die Optionen findest du unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName}.]=]
L["Radiant Echoes"] = "Strahlende Echos"
L["Rage of the Firelands"] = "Sturm auf die Feuerlande"
L["Rated"] = "Gewertet"
L["Ravine River Run"] = "Schluchtflusslauf"
L["Realm"] = true
L["Realm First!"] = true
L["Rebind Micro Button"] = "Micro-Button ändern"
L["Rebind Micro Button Desc"] = "Binde den Micro-Button \"Erfolge\" neu, um einen anderen Tab als den Standard-Tab zu öffnen."
L["Recruit-a-Friend"] = "Werbt einen Freund"
L["Red"] = "Rot"
L["Refresh Events"] = "Ereignisse aktualisieren"
L["Refresh interval"] = "Aktualisierungsintervall"
L["Refresh interval Desc"] = "Die Zeit in Sekunden zwischen den Aktualisierungen der Ereignis-Daten. Eine längere Zeitspanne kann die Erstellung neuer Popup-Fenster bzw. das Bereinigen vorhandener Popup-Fenster verzögern."
L["Related Tab"] = "Zugehöriger Tab"
L["Related Tab Desc"] = "Fügt dem {wowheadLink} ein zusätzliches Bit hinzu, damit ein anderer Tab als der Standard-Tab ausgewählt werden kann."
L["Remember frame position"] = "{frame} Position merken"
L["Remember frame position Desc"] = "Die Position des {frame} wird gespeichert. Dadurch bleibt der {frame} bei der nächsten Anmeldung an seiner letzten bekannten Position."
L["Remix Bronze"] = true
L["Remix Infinite Knowledge"] = "Remix Ewige Forschung"
L["Remove from Watch List"] = "Von {watchList} löschen"
L["Required for"] = "Wird benötigt für..."
L["Requires"] = "Voraussetzung"
L["Researchers Under Fire"] = "Forscher unter Feuer"
L["Reset Faction Filters"] = "Fraktions Filter zurücksetzen"
L["Reset Faction Filters Desc"] = "Die Fraktions-Filter zurücksetzen / beibehalten. Das bedeutet, dass, wenn du dich z.B. mit einem {Allianz}-Charakter anmeldest und einer der {neutralen}, {Allianz}- oder {Horden} Fraktions-Filter aktiviert/deaktiviert ist, werden nur die {neutral} und {alliance} Fraktions-Filter aktiviert. Diese Option wird bevorzugt, wenn viel zwischen {Allianz} und {Horde} gewechselt wird."
L["Reset filters"] = "Filter zurücksetzen"
L["Reset position"] = "Position zurücksetzen"
L["Reset position Desc"] = "Setzt das {frame} auf seine Standardposition zurück."
L["Reset view"] = "Ansicht zurücksetzen"
L["Reset view on open"] = "Zurücksetzen der Ansicht beim Öffnen"
L["Reset view on open Desc"] = "Alle geöffneten Kategorien schliessen und die erste Kategorie auswählen."
L["Return to the Forbidden Reach"] = "Rückkehr auf die Verbotene Insel"
L["Reverse Sort"] = "Umgekehrte Sortierung"
L["Right"] = "Rechts"
L["Right Alt"] = "Rechts Alt"
L["Right click"] = "Rechts-Klick"
L["Right Click Menu"] = "Rechts-Klick Menü"
L["Right Click Menu Desc"] = [=[Jeder Erfolg in den durch {addonName} hinzugefügten neuen Tabs hat ein {rightClickMenu}.

Features:
|T:1:8|t- Link zu {wowhead}.
|T:1:8|t- {goTo}-Verknüpfung zu Erfolgen, die {partOfAChain} sind, die {require} diesen Erfolg erfordern, um abgeschlossen zu werden oder die auch in anderen Kategorien zu finden sind. Erfolge in der Kategorie {currentZone} haben eine Verknüpfung zu ihrer richtigen Position im Kategorienbaum.
|T:1:8|t- Link zu {xuFuPetGuides}, wenn der Erfolg mit {petBattles} zusammenhängt und {xuFuPetGuides} relevante Informationen dazu enthält.
|T:1:8|t- Link zu Transmog-Sets, wenn es das Ziel des Erfolgs ist, diese zu sammeln.
{pluginText}
|T:1:8|t- {more}: Gruppiert weitere "Rechts-Klick" Optionen, um das Hauptmenü nicht zu überladen.
|T:1:8|t- {addToWatch}: Fügt den Erfolg zur Kategorie {watchList} hinzu. (Nur bei Erfolgen verfügbar die noch nicht auf der Beobachtungsliste sind).
|T:1:8|t|T:1:8|t- {removeFromWatch}: Entfernt den Erfolg aus der Kategorie {watchList}. (Nur bei Erfolgen verfügbar die derzeit auf der Beobachtungsliste sind).
|T:1:8|t|T:1:8|t- {include}: Nimmt den Erfolg wieder in die normale Ansicht auf. (Nur bei Erfolgen verfügbar die vorher ausgeschlossen worden sind).
|T:1:8|t|T:1:8|t- {exclude}: Schließt den Erfolg aus der normalen Ansicht aus. (Nur bei Erfolgen verfügbar die noch nicht ausgeschlossen worden sind).

Optionen:
|T:1:8|t- Bei jedem Erfolg kann eine Schaltfläche angezeigt werden, die das {rightClickMenu} öffnet. ({enabled}) (1)

(1) Die Optionen befinden sich unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {rightClickMenu}.]=]
L["Right Ctrl"] = "Rechts Ctrl"
L["Right Shift"] = "Rechts Shift"
L["Rise of Azshara"] = "Azsharas Aufstieg"
L["Rise of the Zandalari"] = "Aufstieg der Zandalari"
L["River Rapids Route"] = "Stromschnellenstrecke"
L["Ruby Lifeshrine Loop"] = "Rubinlebensschrein-Schleife"
L["Rydyr"] = true
L["Sandstorms"] = "Sandstürme"
L["Scalecracker Keep"] = "Schuppenknackergipfel"
L["Screenshot Mode"] = "Bildschirmfoto-Modus"
L["Screenshot Mode Desc"] = [=[Fügt einen schwarzen Rahmen über allem hinzu. Nur neu geöffnete Fenster sind sichtbar. Dies wird zum Erstellen von Screenshots verwendet.

Ein Neuladen ist erforderlich, um den schwarzen Rahmen zu entfernen! ]=]
L["Screenshots"] = "Bildschirmfoto"
L["Search"] = "Suche"
L["Search Criteria"] = "Suche: Kriterien"
L["Search Descriptions"] = "Suche: Beschreibung"
L["Search field"] = "Such-Feld"
L["Search Ids"] = "Suche: IDs"
L["Search Names"] = "Suche: Namen"
L["Search options"] = "Such-Optionen"
L["Search preview"] = "Such-Vorschau"
L["Search Results"] = "Suchergebnisse"
L["Search Rewards"] = "Suche: Belohnungen"
L["Searing Gorge"] = "Sengende Schlucht"
L["Season"] = "Saison"
L["Second column threshold"] = "Zweite Spalte: Schwellenwert"
L["Second column threshold Desc"] = "Erfolge mit mehr Teilaufgaben als dieser Zahl werden in zwei Spalten statt in einer angezeigt."
L["Secrets of Azeroth"] = "Geheimnisse von Azeroth"
L["Secrets of Azeroth (EU)"] = "Geheimnisse von Azeroth (EU)"
L["Secrets of Azeroth (KR)"] = "Geheimnisse von Azeroth (KR)"
L["Secrets of Azeroth (US)"] = "Geheimnisse von Azeroth (US)"
L["Secrets of Ulduar"] = "Die Geheimnisse von Ulduar"
L["Seeds of Renewal"] = "Saat der Erneuerung"
L["Select achievements to see your browsing history"] = "Erfolge auswählen, um Ihren Erfolgs-Browserverlauf anzuzeigen"
L["Select All"] = "Alle auswählen"
L["Selected Zone"] = "Ausgewählte Zone"
L["Set Keybind"] = "Tastaturbelegung ändern"
L["Set Keybind Desc"] = "Setze die Tastaturbelegung für den ausgewählten Tab auf \"Y\". Dies hebt die Bindung aller anderen an 'Y' gebundenen Aktionen auf. Andere Tastaturbelegungen können in den regulären {keyBindings} festgelegt werden."
L["Shadowlands (pre-patch)"] = true
L["Shadows of Argus"] = "Schatten von Argus"
L["Shift"] = true
L["Shipyard"] = "Werft"
L["Show"] = "Zeige"
L["Show Added in version"] = "Zeige {addedInVersion}"
L["Show Added in version Desc"] = "{addedInVersion} anzeigen/ausblenden. Wenn diese Option aktiviert ist wird beim jedem Erfolg die Version des Spiels, im Tooltip angezeigt, mit der dieser dem Spiel hinzugefügt wurde."
L["Show alertSystem on event start Desc"] = "Ein-/Ausblenden des {alertSystem} für ein Ereignis, sobald es beginnt."
L["Show alertSystem on event start in instances Desc"] = "Ein-/Ausblenden des {alertSystem} für ein Ereignis, sobald es beginnt, während man sich in einer Instanz befindet."
L["Show alertSystem on event start only when time data is available Desc"] = "Das Ereignis {alertSystem} für ein Ereignis das gerade beginnt nur anzeigen/ausblenden, wenn noch eine Restzeit für das Ereignis verfügbar ist."
L["Show alertSystem on login Desc"] = "Ereignis {alertSystem} beim Neuladen oder Betreten des Spiels anzeigen/ausblenden."
L["Show alertSystem on login in instances Desc"] = "Ein-/Ausblenden von Ereignis {alertSystem} beim Neu-laden oder Betreten des Spiels innerhalb einer Instanz."
L["Show alertSystem on login only when time data is available Desc"] = "Das Ereignis {alertSystem} beim Beitritt zum Spiel nur anzeigen/ausblenden, wenn noch eine Restzeit für das Ereignis vorhanden ist."
L["Show alertSystem on reload Desc"] = "Ereignis {alertSystem} anzeigen/ausblenden, wenn das Spiel neu geladen wird."
L["Show alertSystem on reload in instances Desc"] = "Ereignis {alertSystem} anzeigen/ausblenden, wenn das Spiel innerhalb einer Instanz neu geladen wird."
L["Show alertSystem on reload only when time data is available Desc"] = "Das Ereignis {alertSystem} beim Neuladen des Spiels nur anzeigen/ausblenden, wenn noch Restzeit für das Ereignis vorhanden ist."
L["Show All Results in Category"] = "Zeige alle Suchergebnisse in einer Kategorie an"
L["Show All Results in Category Desc"] = "Alle Suchergebnisse in einer Kategorie anzeigen, die während dieser Sitzung bestehen bleibt."
L["Show Criteria"] = "Zeige Kriterien"
L["Show Criteria Desc"] = "Zeige Kriterien im Einheiten Tooltip die für das Erlangen eines Erfolgs notwendig sind."
L["Show Criteria If"] = "Zeige Kriterien wenn"
L["Show current character icons"] = "Zeige aktuelle Charakter Icons"
L["Show current character icons Desc"] = [=[Zeigt / Verbirgt aktuelle Charaktersymbole.

Wenn diese Option aktiviert ist, erscheint ein zweites Symbol vor {partOfAChain} und {requiredFor} Erfolgen, das den Fortschritt des aktuellen Charakters anzeigt. ]=]
L["Show Date Completed Time"] = "Datum anzeigen inklusive Zeitpunkt"
L["Show Date Completed Time Desc"] = "Zeigt den Zeitpunkt (Stunden, Minuten und Sekunden) an, zu der der Erfolg erreicht wurde. Hinweis: Blizzard speichert diese Informationen nicht, so dass nur neu erworbene Erfolge diese Daten enthalten. Das Löschen der Dateien und/oder des Ordners \"Gespeicherte Variablen\" oder des WTF-Ordners setzt diese Informationen auf die Standardzeit von 12:00:00 Uhr zurück."
L["Show Excluded Category"] = "Kategorie \"Erfolge ausgeblendet\" anzeigen"
L["Show Excluded Category Desc"] = [=[Zeige / verstecke {excluded} Kategorie.

Wenn das Häkchen gesetzt ist, wird diese Kategorie nur angezeigt, wenn es tatsächlich ausgeschlossene Erfolge gibt und die eingestellten Filter es erlauben, diese anzuzeigen.

Wenn das Häkchen nicht gesetzt ist, ist die Kategorie immer versteckt und die Filter sind ebenfalls versteckt. ]=]
L["Show Faction Faction Icon"] = "Zeige {faction} Fraktions Symbol"
L["Show Faction Faction Icon Desc"] = "Zeigt das {faction} Fraktionssymbol auf den Erfolgen an, wenn nur {faction} Spieler diese verdienen können."
L["Show faction icon"] = "Fraktions-Symbol anzeigen"
L["Show faction icon Desc"] = "Ein Fraktionssymbol vor dem Namen des Charakters anzeigen."
L["Show minimap icon"] = "Zeige Minimap Icon"
L["Show minimap icon Desc"] = "Zeige / Verstecke das Minimap Icon."
L["Show Not Obtainable"] = "Zeige {notObtainable}"
L["Show Not Obtainable Desc"] = "Zeigt / versteckt {notObtainable} Erfolge in Rot auf dem Fortschrittsbalken."
L["Show Objectives progress"] = "Zeige {objectivesProgress}"
L["Show Objectives progress Desc"] = [=[{objectivesProgress} ein-/ausblenden.

Wenn diese Option aktiviert ist, werden die {objectivesProgress} der Erfolge im Tooltip angezeigt. ]=]
L["Show Other faction"] = "Zeige weitere Fraktionen"
L["Show Other faction Desc"] = [=[Zeige / verstecke {otherFaction}.

Wenn diese Option aktiviert ist, wird der Erfolg der anderen Fraktion im Tooltip angezeigt, sofern verfügbar. Dadurch wird es vielleicht klarer, warum euer neuer Horde-Charakter bestimmte Errungenschaften hat, wenn ihr vorher nur Allianz gespielt habt. ]=]
L["Show Other Faction Warband as Completed"] = "Andere Fraktions-Kriegsmeute als abgeschlossen anzeigen"
L["Show Other Faction Warband as Completed Desc"] = "Einige Erfolge sind fraktionsspezifisch und gleichzeitig kriegsmeuten gebunden. Diese Erfolge können auf einem Charakter einer Fraktion als abgeschlossen erscheinen, aber nicht auf einem Charakter der anderen Fraktion. Wenn diese Option aktiviert ist, erscheinen die kriegsgebundenen Erfolge auf dem Charakter der anderen Fraktion als abgeschlossen, wenn der Charakter die Errungenschaft auf der anderen Fraktion abgeschlossen hat. Ein Beispiel dafür ist, dass {hordeIntro} und {allianceIntro} für {warStories} benötigt werden, wobei {hordeIntro} nur für Charaktere der Horde und {allianceIntro} für Charaktere der Allianz als abgeschlossen erscheint."
L["Show Part of a chain"] = "Zeige {partOfAChain}"
L["Show Part of a chain Desc"] = "{partOfAChain} aktivieren / deaktivieren. Wenn diese Option aktiviert ist, wird im Tooltip die Verkettung angezeigt, zu der der Erfolg gehört."
L["Show placeholders"] = "Zeige Platzhalter"
L["Show placeholders Desc"] = "Zeigt eine Reihe von Platzhalter-Ereignissen an, um eine visuelle Anzeige der Wirkung der oben genannten Einstellungen zu ermöglichen. Diese können wieder geschlossen werden, indem du die Maus über sie bewegest oder mit der rechten Maustaste darauf klickst."
L["Show placeholders filter"] = "Filter \"Platzhalter\" anzeigen"
L["Show placeholders filter Desc"] = [=[Zeigt / Versteckt den Platzhalterfilter in den Filtern. Dieser wird verwendet, um Erfolge anzuzeigen, die noch nicht im Spiel sind.

Kann Spoiler enthalten, wenn aktiviert! ]=]
L["Show pop ups on login delay Desc"] = "Verzögern Sie das Einblenden der ersten Ereignis-Popups beim Einloggen."
L["Show Required for"] = "Zeige {requiredFor}"
L["Show Required for Desc"] = [=[{requiredFor} ein-/ausblenden.

Wenn diese Option aktiviert ist, wird der Erfolg, für den der ausgewählte Erfolg abgeschlossen werden muss, in der QuickInfo angezeigt. ]=]
L["Show Rewards"] = "Zeige Belohnungen"
L["Show Rewards Desc"] = [=[{rewards} anzeigen/ausblenden,

Wenn diese Option aktiviert ist, werden die {rewards}, die diese Erfolge gewähren, im Tooltip angezeigt, sofern verfügbar. ]=]
L["Show Right Click Menu"] = "{rightClickMenu} Button anzeigen"
L["Show Right Click Menu Desc"] = [=[Zeigt / Versteckt den {rightClickMenu} Button auf jedem Erfolg.

Dies dient als Alternative für einen Rechtsklick auf den Erfolg. ]=]
L["Show Start Time & End Time"] = "Zeige {startTime} & {endTime}"
L["Show Start Time & End Time Desc"] = "{StartZeit} & {EndeZeit} anzeigen/ausblenden. Wenn diese Option aktiviert ist und die Erfolge {temporarilyObtainable} sind, wird die Start- und Endzeit des Zeitraums, in dem der Erfolg erhältlich ist, im Tooltip angezeigt. Dies gilt nur für Erfolge, die aufgrund von Kalenderereignissen {temporarilyObtainable} sind."
L["Show Sub Categories"] = "Unterkategorien anzeigen"
L["Show Sub Categories Desc"] = [=[Unterkategorien anzeigen/ausblenden.

Wenn diese Option aktiviert ist, werden die Erfolge unter ihren ursprünglichen Unterkategorien platziert, anstatt alle zusammen unter der einzigen Kategorie {Kategorie}. ]=]
L["Show Temporarily obtainable"] = "Zeige {temporarilyObtainable}e Erfolge"
L["Show Temporarily obtainable Desc"] = "{TemporarilyObtainable} anzeigen/ausblenden. Wenn diese Option aktiviert ist und die Erfolge {temporarilyObtainable} sind, wird diese Information im Tooltip angezeigt."
L["Show Temporarily obtainable Icon"] = "Zeige {tempObt} Symbol"
L["Show Temporarily obtainable Icon Desc"] = "Zeigt / versteckt ein zusätzliches Symbol auf dem Erfolg, wenn es nur {tempObt} ist."
L["Show Warband Icon"] = "Zeige {warband} Icon"
L["Show Warband Icon Desc"] = "Zeigt / versteckt ein zusätzliches Symbol in der Kopfzeile eines Erfolgs, wenn es ein {Warband} Erfolg ist."
L["Show world map icon"] = "Zeige Welt-Map Icon"
L["Show world map icon Desc"] = "Zeige / Verstecke das Welt-Map Icon."
L["Side Button Anchor"] = "Seitlicher Button-Anker"
L["Side Button Anchor Desc"] = "Das Fenster, an dem die seitlichen Buttons auf der rechten Seite angebracht werden."
L["Side Window"] = "Scroll-Leiste"
L["Siege of Orgrimmar"] = "Schlacht um Orgrimmar"
L["Siege on Dragonbane Keep"] = "Belagerung der Drachenfluchfestung"
L["Siege on Dragonbane Keep: Active"] = "Belagerung der Drachenfluchfestung: Aktiv"
L["Siege on Dragonbane Keep: Gathering"] = "Belagerung der Drachenfluchfestung: Sammeln"
L["Siren Isle"] = "Sireneninsel"
L["Skitterer Xi'a"] = "Huscher Xi'a"
L["Skoldus Hall"] = "Skoldushalle"
L["Skyriding Races"] = "Himmelsreiten"
L["Skyrocketing Races"] = "Raketenrennen"
L["Slagmire"] = "Schlackensumpf"
L["Snowstorms"] = "Schneestürme"
L["Soon"] = "Bald"
L["Sort priority"] = "Priorität sortieren"
L["Soulforges"] = "Die Seelenschmieden"
L["Sources"] = "Quellen"
L["Southshore vs. Tarren Mill"] = "Süderstade vs. Tarrens Mühle"
L["Spacing"] = "Abstand"
L["Spacing Desc"] = "Der Abstand, der zum Standardabstand zwischen den Tabs addiert bzw. von diesem subtrahiert wird."
L["Special Categories"] = "Spezial Kategorie"
L["Special thanks"] = "Besonderer Dank"
L["Specials"] = "Spezial"
L["Spreading the Light"] = "Schlüsselflammen"
L["Stables"] = "Ställe"
L["StarCraft II"] = "StarCraft 2"
L["Start Time"] = "Beginn (Zeit)"
L["Stop tracking"] = "Verfolgung beenden"
L["Stormheim"] = "Sturmheim"
L["Stormsong Valley"] = "Das Sturmsangtal"
L["Strand of the Ancients"] = "Strand der Uralten"
L["Style"] = "Style Erfolgs-Fenster"
L["Summary Desc"] = [=[{achievementsHeader}:
|T:1:8|t- Zeigt die letzten {numAchievements} für Account- und Charaktererfolge (1).

{categoriesHeader}:
|T:1:8|t- Zeigt den Fortschritt für jede Kategorie im Tab. Dies ist derselbe Fortschritt, den du sehen würdest, wenn du mit der Maus über eine Kategorie auf der Seite fährst.

(1) Optionen findest du unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {categories} {arrow} {summary}.]=]
L["Sundapple Copse Circuit"] = "Sonnentüpfelheinstrecke"
L["Superbloom"] = "Superblüte"
L["Superbloom: Active"] = "Superblüte: Aktiv"
L["Superbloom: Next"] = "Superblüte: Nächstes Event"
L["Tab"] = true
L["tab"] = "Tab"
L["Tab Priority"] = "Tab-Priorität"
L["Tab Priority Desc"] = "Wenn diese Option aktiviert ist, wird beim Klicken auf einen Erfolg (um zu diesem Erfolg zu gelangen) der priorisierte Tab zuerst verwendet, um nach dem Erfolg zu suchen und das Fenster zu diesem Tab zu öffnen. Wenn der Erfolg nicht in diesem Tab vorhanden ist, gelten die Standardregeln."
L["Tabs"] = true
L["Ta's Pet Collection"] = "Ta's Haustier Sammlung"
L["Teleport"] = true
L["Temporarily obtainable"] = "Befristet erreichbar"
L["temporarily obtainable"] = "befristet erreichbar"
L["Temporarily obtainable Header Colors"] = "{tempObt} Kopfzeilen-Farbe"
L["Temporarily obtainable Header Colors Desc"] = "Wenn diese Option aktiviert ist, werden die standardmäßigen orangefarbenen und blauen Header-Farben durch grüne, gelbe und rote Farben ergänzt, die anzeigen, dass der Erfolg derzeit erreichbar ist, in Zukunft erreichbar sein wird oder nicht mehr erreichbar ist."
L["Temporarily Obtainable Text"] = "{isWillBeWas}{neverOnceTempObt}{startText}{startDetail}{endText}{endDetail}"
L["Thaldraszus"] = true
L["Thaldraszus: Next"] = "Thaldraszus: Nächstes Event"
L["The Azure Span"] = "Das Azurblaue Gebirge"
L["The Azure Span Slalom"] = "Slalom des Azurblauen Gebirges"
L["The Azure Span Sprint"] = "Sprint des Azurblauen Gebirges"
L["The Big Dig: Active"] = "Das große Buddeln: Aktiv"
L["The Big Dig: Next"] = "Das große Buddeln: Nächstes Event"
L["The Big Dig: Soon"] = "Das große Buddeln: Bald"
L["The Cruelty of Dornic: Next"] = "Theatertruppe: Die Grausamkeit von Dornic: Bald"
L["The Entitled"] = "Hochverehrter"
L["the event name with run time"] = "{eventName} ab {startDate} bis {endDate}"
L["The Flowing Forest Flight"] = "Flug des Wallenden Walds"
L["The Iron Tide"] = "Die Eiserne Flut"
L["The Rivals: Next"] = "Theatertruppe: Die Rivalen: Bald"
L["The Shattering"] = "Die Zerschlagung Azeroths"
L["The Thraegar's Descent: Next"] = "Theatertruppe: Der Abstieg des Thraegar: Bald"
L["The Thunder King"] = "Der Donnerkönig"
L["The Tomb of Sargeras"] = "Grabmal des Sargeras"
L["The Vakthros Ascent"] = "Vakthrosaufstieg"
L["The Waking Shore"] = "Die Küste des Erwachens"
L["The Wanderer: Next"] = "Theatertruppe: Der Wanderer: Bald"
L["The War Within (pre-patch)"] = true
L["The Warning"] = "Die Warnung"
L["Theater Troupe"] = "Theatertruppe"
L["This achievement"] = "Dieser Erfolg"
L["This achievement can't be earned by this character."] = "Dieser Erfolg kann nicht von diesem Charakter erzielt werden."
L["This achievement is no longer obtainable"] = "Dieser Erfolg kann nicht länger erzielt werden."
L["This category has no achievements"] = "Diese Kategorie hat keine Erfolge"
L["This character's class has no transmog set that meet the requirements."] = "Die Klasse deines Charakters erfüllt nicht die Anforderungen für dieses Transmog-Set."
L["Thundering Pandaren Spirit"] = "Bebender Pandarengeist"
L["Thunderstorms"] = "Gewitterstürme"
L["Tides of Vengeance"] = "Wogen der Rache"
L["Time display"] = "Zeit Anzeige"
L["Time Left"] = "Zeit übrig"
L["Time Rift"] = "Zeitrisse"
L["Time Rift: Active"] = "Zeitriss: Aktiv"
L["Time Rift: Next"] = "Zeitrisse: Nächstes Event"
L["Time Rift: Starting Soon"] = "Zeitriss: Startet Bald"
L["Time Rifts"] = "Zeitrisse"
L["Tiragarde Sound"] = "Der Tiragardesund"
L["Titan Lockdown"] = "Titanenabriegelung"
L["Titan Lockdown: Active"] = "Titanenabriegelung: Aktiv"
L["Titan Lockdown: Next"] = "Titanenabriegelung: Nächstes Event"
L["Titan Lockdown: Soon"] = "Titanenabriegelung: Startet Bald"
L["Titan Lockdown: Starting Soon"] = "Titanenabriegelung: Startet Bald"
L["Ti'un the Wanderer"] = "Ti'un der Wanderer"
L["Toggle"] = "Auswählen"
L["Toggle Tracking"] = "Erfolgs-Verfolgung umschalten"
L["Toggle window once opened"] = "Fenster nach dem Öffnen umschalten"
L["Toggle window once opened Desc"] = "Wenn das Erfolgsfenster das erste Mal geöffnet wird, öffnet sich ein Tab und zeigt die Zusammenfassung an. Ab dem zweiten Mal, unabhängig von der verwendeten Tastenkombination, öffnet sich die zuletzt gezeigte Ansicht."
L["Tooltip"] = true
L["Torghast"] = true
L["Track achievement browsing history"] = "Verfolgung des Erfolgs-Browsing-Verlaufs"
L["Track achievement browsing history Desc"] = "Wenn diese Option aktiviert ist, wird in der Fensterüberschrift eine Schaltfläche zum Zurück- und Vorwärtsblättern angezeigt. Dies ermöglicht die Navigation durch den Browserverlauf ausgewählter Errungenschaften, so wie es Ihr Internetbrowser für besuchte Websites tut."
L["Tracking"] = "Tracking-Erfolge"
L["Tracking Achievements"] = "Tracking-Erfolge"
L["Trader's Tender"] = "Händlerdevisen"
L["Trading Post"] = "Handelsposten"
L["Transmog Sets"] = "Transmog-Sets"
L["Truncate"] = "Abschneiden"
L["Turbulent Timeways"] = "Turbulente Zeitwege"
L["Tutorial"] = true
L["Tutorial Desc"] = "Öffne das Tutorial beim Start."
L["Tyrhold"] = true
L["Uktulut Coaster"] = "Uktuluter Küstenachter"
L["Uncategorized"] = "Nicht kategorisiert"
L["Unchecked"] = "Nicht aktiviert"
L["Undermine(d)"] = true
L["until the end of"] = "bis zum Ende von"
L["Up"] = "Hoch"
L["up until the start of"] = "bis zum Ende von"
L["Upcoming"] = "Anstehend"
L["Upcoming Calendar Event Days"] = "Anstehende Kalender-Ereignisse Tage"
L["Upcoming Calendar Event Days Desc"] = "Die Anzahl der Tage im Voraus, die anstehende Kalender-Ereignisse angezeigt werden sollen."
L["Upcoming Calendar Event Login Delay"] = "Anstehende Kalender-Ereignisse Login-Verzögerung"
L["Upcoming Calendar Events"] = "Anstehende Kalender-Ereignisse"
L["Upper Reaches"] = "Die Oberen Ebenen"
L["Val'sharah"] = true
L["Vendor"] = "Verkäufer"
L["Venthyr Assault"] = "Venthyr Paktangriff"
L["Vertical position"] = "Vertikale Position"
L["View Tutorial"] = "Tutorial anzeigen"
L["Visions of N'Zoth"] = "Visionen von N'Zoth"
L["Vol'dun"] = true
L["Wago"] = true
L["Wago Desc"] = "Öffnet ein Popup-Fenster mit einem Link zur Seite {addonName} {wago}."
L["Waking Shores"] = "Küste des Erwachens"
L["Waking Shores: Next"] = "Küste des Erwachens: Nächstes Event"
L["Warband Achievement"] = "Kriegsmeuten-Erfolg"
L["Warband Campsite"] = "Kriegsmeute Lagerplatz"
L["Warband Header Color"] = "{warband} Kopfzeilen Farbe"
L["Warband Header Color Desc"] = "Wenn diese Option deaktiviert ist, wird die standardmäßige blaue Farbe der Kopfzeile durch eine orange Farbe ersetzt. In diesem Fall wird empfohlen das {warbandIcon} zu aktivieren."
L["Warcraft III: Reforged"] = true
L["Warcraft Rumble"] = true
L["was"] = "war"
L["Watch List"] = "Beobachtungsliste"
L["When achievement completed"] = "Wenn Erfolg abgeschlossen"
L["When achievement completed Desc"] = [=[Zeigt / verbirgt {objectivesProgress}, wenn die Erfolge abgeschlossen sind.

Wenn diese Option aktiviert ist, werden die {objectivesProgress} der Erfolge im Tooltip angezeigt, unabhängig davon, ob der Erfolg abgeschlossen ist oder nicht. ]=]
L["Whispering Pandaren Spirit"] = "Flüsternder Pandarengeist"
L["Widget Events"] = "Widget Ereignisse"
L["Wild Preserve Circuit"] = "Wildreservat-Parcours"
L["Wild Preserve Slalom"] = "Wildreservat-Slalom"
L["will be"] = "wird"
L["Window"] = "Fenster"
L["Wingrest Roundabout"] = "Schwingenrastkreisel"
L["World Events"] = "Welt Ereignisse"
L["World Map"] = "Welt Karte"
L["World Map Button"] = true
L["World Map Button Desc"] = [=[Hover:
|T:1:8|t- Zeigt an, wie viele Achievements wie die {enhancedTooltipCategories} basierend auf den für die {selectedZone} eingestellten Filtern (nicht) erhältlich und (nicht) abgeschlossen sind.
|T:1:8|t- Weitere Informationen findest du unter {enhancedTooltipCategories} und {enhancedFilteringAndSorting}.

Click:
|T:1:8|t- Öffnet das Achievement-Fenster für die Kategorie {selectedZone}. ]=]
L["Worldsoul Memory"] = "Weltenseelenerinnerung"
L["WoW Remix: Mists of Pandaria"] = true
L["Wowhead"] = true
L["Wowhead Link"] = true
L["WoWInterface"] = true
L["WoWInterface Desc"] = "Öffnet ein Popup-Fenster mit einem Link zur Seite {addonName} {woWInterface}."
L["WoW's 10th Anniversary"] = "10-jähriges Jubiläum von WoW"
L["WoW's 18th Anniversary"] = "WoW's 18. Geburtstag"
L["WoW's 19th Anniversary"] = "WoW's 19. Geburtstag"
L["WoW's 20th Anniversary"] = "20-jähriges Jubiläum von WoW"
L["WoW's 21st Anniversary"] = "WoW's 21. Geburtstag"
L["WoW's Anniversary"] = "WoW's Geburtstag"
L["X offset Desc"] = "Der horizontale Versatz von der Startposition."
L["Xu-Fu's Pet Guides"] = true
L["XYZ offset"] = "{xyz} Abstände"
L["Y offset Desc"] = "Der vertikale Versatz von der Startposition."
L["Zaqali Ruin Investigation"] = "Zaqaliruinen"
L["Zaqali Ruin Investigation: Active"] = "Zaqaliruinen: Aktiv"
L["Zaqali Ruin Investigation: Next"] = "Zaqaliruinen: Nächstes Event"
L["Zaqali Ruin Investigation: Soon"] = "Zaqaliruinen: Bald"
L["Zaqali Ruin Investigation: Starting Soon"] = "Zaqaliruinen: Startet Bald"
L["Zones"] = "Zonen"