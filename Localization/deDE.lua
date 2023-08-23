local addonName, addon = ...;
local L = LibStub(addon.Libs.AceLocale):NewLocale(addonName, "deDE");
if not L then return end
addon.L = L;

addon.Plugins:LoadLocalization(L);

-- [[ https://legacy.curseforge.com/wow/addons/krowi-achievement-filter/localization ]] --
-- [[ Everything after this line is automatically generated from CurseForge and is not meant for manual edit - SOURCETOKEN - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-08-23 16-15-26 ]] --
L["%c"] = "%c "
L["%d/%m/%Y %I:%M %p"] = "%d/%m/%Y %I:%M %p "
L["%m/%d/%Y %I:%M %p"] = "%m/%d/%Y %I:%M %p "
L["%m/%d/%Y %R"] = "%d.%m.%Y %R "
L["%Y/%m/%d %I:%M %p"] = "%Y/%m/%d %I:%M %p "
L["%Y/%m/%d %R"] = "%d.%m.%Y %R Uhr"
L["450 skill"] = "Fertigkeit 450 "
L["525 skill"] = "Fertigkeit 525 "
L["600 skill"] = "Fertigkeit 600 "
L["Academy Ascent"] = "Akademieaufstieg "
L["Account"] = "Account "
L["Account wide (default)"] = "Account (Standard) "
L["Achievement Calendar"] = "Erfolg-Kalender "
L["Achievement is Completed"] = "Erfolg ist abgeschlossen"
L["Achievement is Completed Desc"] = "Zeige die Erfolgs-Kriterien an, auch wenn der Erfolg bereits abgeschlossen ist. "
L["Achievement is excluded"] = "Erfolg wurde ausgeblendet "
L["Achievement is watched"] = "Erfolg auf Beobachtungsliste "
L["Achievement points earned by"] = "Erfolgspunkte erzielt durch "
L["Achievement shown temporarily"] = "Dieser Erfolg wird nur vorübergehend angezeigt, da er keinem der gesetzten Filter entspricht. "
L["Achievement was Not Earned by Me"] = "Erfolg nicht durch den aktuellen Charakter abgeschlossen wurde "
L["Achievement was Not Earned by Me Desc"] = "Zeigt die Erfolgs-Kriterien an, solange der aktuelle Charakter den Erfolg noch nicht erreicht hat. "
L["Achievement Window"] = "Erfolg-Fenster "
L["Achievement window height offset"] = "Erfolgs Fenster Höhen-Abstand "
L["Achievement window height offset Desc"] = [=[Die Höhe, die zur Standardhöhe des Erfolg-Fensters addiert oder davon subtrahiert wird.

Dieser Wert kann geändert werden, während das Erfolg-Fenster geöffnet ist und eine der von {addonName} hinzugefügten Registerkarten ausgewählt wurde. Dies kann Auswirkungen (1) auf das Spiel haben.

(1) FPS-Einbrüche und Stottern während der Anpassung des Wertes, NICHT während der normalen Addon-Nutzung.]=]
L["Achievements"] = "Erfolge "
L["Active events"] = "Aktive Ereignisse "
L["Add Locale"] = "Installationspfad hinzufügen "
L["Add Locale Desc"] = "Fügt den Installationspfad des aktuellen Spiels zum {wowheadLink} hinzu. "
L["Add to / Remove from Watch List"] = "Hinzufügen zur / Löschen von der Beobachtungsliste "
L["Add to Watch List"] = "Zu {watchList} hinzufügen "
L["Adjustable Categories"] = "Anpassbare Kategorien "
L["Aki the Chosen"] = "Aki die Auserwählte "
L["Already /loved for achievement"] = "Hat deine Liebe {forAchievement} schon erhalten "
L["Already completed for achievement"] = "Schon abgeschlossen {forAchievement} "
L["Already cooked for achievement"] = "Bereits gekocht {forAchievement} "
L["Already defeated for achievement"] = "Bereits besiegt {forAchievement} "
L["Already drank for achievement"] = "Bereits getrunken {for Achievement} "
L["Already eaten for achievement"] = "Bereits gegessen {forAchievement} "
L["Already killed for achievement"] = "Bereits getötet {forAchievement} "
L["Already petted for achievement"] = "Bereits gestreichelt {forAchievement} "
L["Alt"] = "Alt "
L["Always Show Completed"] = "Erreichte Erfolge anzeigen "
L["Always show realm"] = "Immer Realm anzeigen "
L["Always show realm Desc"] = "Zeigt immer den Realm deines Charakters an, unabhängig davon, ob sich der Charakter auf demselben Realm wie dieser Charakter befindet. "
L["Andurs"] = "Andurs "
L["Apex Canopy River Run"] = "Flusslauf des Hohen Blätterdachs "
L["Archive Ambit"] = "Archivring "
L["Are you sure you want to delete character?"] = "Sind Sie sicher, dass Sie {character} löschen möchten? Dieser Charakter wird aber wieder hinzugefügt, wenn Sie sich erneut einloggen. Wenn Sie den Charakter dauerhaft nicht sehen wollen, markieren Sie bitte die {ignore} Checkbox. "
L["Assault on Azsuna"] = "Schlacht um Azsuna "
L["Assault on Drustvar"] = "Angriff Drustvar "
L["Assault on Highmountain"] = "Schlacht um den Hochberg "
L["Assault on Nazmir"] = "Angriff Nazmir "
L["Assault on Stormheim"] = "Schlacht um Sturmheim "
L["Assault on Stormsong Valley"] = "Angriff Sturmsangtal "
L["Assault on Tiragarde Sound"] = "Angriff Tiragardesund "
L["Assault on Val'sharah"] = "Schlacht um Val'sharah "
L["Assault on Vol'dun"] = "Angriff Vol'dun "
L["Assault on Zuldazar"] = "Angriff Zuldazar "
L["Assault: Amathet"] = "Angriff: Vorstoß der Amathet (Amathet) "
L["Assault: Aqir"] = "Angriff: Ausgegrabene Aqir (Aqir) "
L["Assault: Mantid"] = "Angriff: Der unendliche Schwarm (Mantid) "
L["Assault: Mogu"] = "Angriff: Die verfeindeten Klans (Mogu) "
L["Assault: N'Zoth (Uldum)"] = "Angriffe von N'Zoth (Uldum) "
L["Assault: N'Zoth (Vale of Eternal Blossoms)"] = "Angriffe von N'Zoth (Das Tal der ewigen Blüten) "
L["Author"] = "Autor "
L["Azure Span"] = "Das Azurblaue Gebirge "
L["Blizzard"] = "Blizzard "
L["BlizzCon"] = "BlizzCon "
L["Brackenhide Hollow"] = "Brackenfellhöhle "
L["Brawler's Guild"] = "Kampfgilde "
L["Brewfest"] = "Braufest "
L["Build"] = "Version "
L["Buildings"] = "Gebäude "
L["Burning Pandaren Spirit"] = "Brennender Pandarengeist "
L["Bur's Mount Collection"] = "Bur's Reittier Collection "
L["Button"] = "Button "
L["Calendar"] = "Kalender "
L["Calendar Desc"] = [=[Erscheinungsbild des {Kalenders}.

|T:1:8|t- Die Anzahl der Erfolge und Punkte oben sind die verdienten Erfolge und Punkte für den aktuellen sichtbaren Monat und nicht für alle sichtbaren Tage.
|T:1:8|t- Navigieren Sie zum vorherigen und nächsten Monat, indem Sie auf die Schaltflächen oben neben dem Monat klicken oder das Scrollrad verwenden.
|T:1:8|t- Wenn Sie mit der Maus über einen Tag fahren, wird er hervorgehoben (Tag 11) und die an diesem Tag verdienten Erfolge (falls vorhanden) werden im Fenster an der Seite angezeigt. Wenn Sie die Maus von dem hervorgehobenen Tag entfernen, wird das Fenster an der Seite entweder geschlossen oder zeigt die Erfolge des neuen Tages an, über dem sich die Maus befindet.
|T:1:8|t- Wenn Sie auf einen Tag klicken (ihn auswählen), wird er noch deutlicher hervorgehoben (Tag 18) und das Fenster an der Seite bleibt offen (gesperrt). So kannst Du durch die Erfolge blättern, mit der Maus über sie fahren, um den Tooltip zu sehen, oder sie anklicken, um sie im Erfolgsfenster zu finden (der Kalender wird geschlossen). Das Auswählen eines Tages funktioniert nur, wenn an diesem Tag Erfolge erzielt wurden. Wenn Du auf einen ausgewählten Tag klickst, wird er abgewählt und das Fenster an der Seite wird entsperrt, sodass er sich wieder wie ein markierter Tag verhält. Ein Pfeil auf dem Tag zeigt an, dass an diesem Tag mehr als 4 Errungenschaften erworben wurden. 

Optionen (1)
|T:1:8|t- Beim (erneuten) Öffnen des Kalenders kann man wählen, ob immer der zuletzt betrachtete Monat ausgewählt bleiben soll ({lockMonth}) oder nur, wenn man auf eine Errungenschaft klickt ({lockAchievementMonth}).
|T:1:8|t- Der erste Tag der Woche kann geändert werden und ist derzeit auf {firstWeekDay} eingestellt.

(1) Die Optionen befinden sich unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {calendar}.]=]
L["Calendar Events"] = "Kalender Events "
L["Categories"] = "Kategorien "
L["Categories width offset"] = "Kategorien Fenster Abstands-Breite "
L["Categories width offset Desc"] = [=[Die Breite, die zur Standardkategorienbreite addiert oder von ihr subtrahiert wird.

Dieser Wert kann geändert werden, während das Erfolgsfenster geöffnet ist und eine der von {AddonName} hinzugefügten Tabs ausgewählt wurde. Dies kann Auswirkungen (1) auf das Spiel haben.

(1) FPS-Einbrüche und Stottern während der Anpassung des Wertes, NICHT während der normalen Addon-Nutzung.

{reloadRequired}]=]
L["Category shown temporarily"] = "Diese Kategorie wurde durch Klicken auf die {eventName} Event Erinnerung ausgewählt und wird nur vorübergehend angezeigt, da sie keine Erfolge enthält, die den eingestellten Filtern entsprechen. "
L["Caverns Criss-Cross"] = "Kreuz und quer durch die Höhlen "
L["Central Circuit"] = "Zentralrundstrecke "
L["Character / Account wide"] = "Charakter & Account "
L["Character only"] = "Nur Charakter-Erfolge "
L["Chat messages"] = "Chat-Mitteilungen "
L["Checked"] = "Aktivert "
L["Children's Week"] = "Kinderwoche "
L["Class Hall"] = "Ordenshalle "
L["Clear all"] = "Alle löschen "
L["Clear all Desc"] = "Löschen Sie alle Erfolge von der Beobachtungsliste. "
L["Clear search field on Right Click"] = "Lösche das Such-Feld durch Rechts-Klick."
L["Clear search field on Right Click Desc"] = "Aktivieren/deaktiviere das Löschen des Suchfeldes, wenn Du mit der rechten Maustaste darauf klickst. "
L["Click here to view in achievement window"] = "Hier klicken, um im Erfolgs-Fenster anzuzeigen "
L["Click here to view in achievements"] = "Im Erfolgs-Fenster öffnen "
L["Cliffside Circuit"] = "Klippenrundstrecke "
L["Cobalt Assembly"] = "Kobaltkonvent "
L["Coldheart Interstitia"] = "Kaltherzinterstitia "
L["Collapse Chain"] = "Serien-Erfolge Ausblenden "
L["Collecting data"] = "Sammle Daten... "
L["Collector's Edition"] = "Collector's Edition "
L["Comments"] = "Kommentare "
L["Community Feast"] = "Gemeinschaftliches Festmahl "
L["Community Feast: Active"] = "Gemeinschaftliches Festmahl: Aktiv "
L["Community Feast: Cooking"] = "Gemeinschaftliches Festmahl: Kochen "
L["Community Feast: Ready"] = "Gemeinschaftliches Festmahl: Fertig "
L["Community Feast: Soon"] = "Gemeinschaftliches Festmahl: Startet Bald "
L["Community Feast: Starting Soon"] = "Gemeinschaftliches Festmahl: Startet Bald "
L["Compact"] = "Kompakte Erfolge anzeigen "
L["Compact Achievements"] = "Kompakte Erfolgs-Fenster anzeigen "
L["Compact Achievements Desc"] = "Die Anzeige der Erfolge ist auf 2/3 der ursprünglichen Größe verkleinert, ähnlich wie bei der Zusammenfassung der Erfolge. "
L["Compact Achievements T Desc"] = [=[- Erfolge sind 2/3 so groß wie die zusammengefassten Errungenschaften.
- Zeigt entweder die erste Zeile der Beschreibung oder die Belohnung an.

Kompakte Erfolge können in den Optionen ({compactEnabled}) aktiviert werden (1).

(1) Die Optionen befinden sich unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}.]=]
L["Compact Desc"] = [=[Verwende eine kompaktere Version mit nur einer Zeile der Zeitanzeige.

{reloadRequired} ]=]
L["Completion"] = "Komplettierung "
L["Covenant"] = "Pakt "
L["Covenant Assaults"] = "Paktangriffe "
L["Credits"] = "Credits "
L["Criteria"] = "Kriterien "
L["Criteria Behaviour"] = "Erfolgs-Kriterien Darstellung "
L["Criteria Behaviour Desc"] = [=[So verhält sich ein Kriterium mit zu langem Text.

|T:1:8|t- {overflow}: Der Text wird wie üblich angezeigt und läuft einfach über. Dies kann dazu führen, dass sich Texte überschneiden.
|T:1:8|t- {truncate}: Schneidet den Text ab und zeigt '...' am Ende an.
|T:1:8|t- {flexible}: Kriterien mit zu langen Texten werden in eine neue Zeile gesetzt. Andere Kriterien werden in zwei Spalten angezeigt. ]=]
L["Criteria is Completed"] = "Kriterien erfüllt sind "
L["Criteria is Completed Desc"] = "Erfolgs-Kriterien anzeigen, auch wenn die Erfolgs-Kriterien bereits erfüllt sind. "
L["Criteria of"] = "Kriterien "
L["Cross-Expansion"] = "Addon-Übergreifend "
L["Ctrl"] = "Ctrl "
L["Current Zone"] = "Aktuelle Zone "
L["CurseForge"] = "CurseForge "
L["CurseForge Desc"] = "Öffnet ein Popup-Fenster mit einem Link zur Seite {addonName} {curseForge}. "
L["Custom"] = "Benutzerdefiniert "
L["Darkmoon Faire"] = "Dunkelmond-Jahrmarkt "
L["Data Manager"] = "Charakterübersicht "
L["Date and Time format"] = "Datum und Zeit (Format) "
L["Date and Time formatting guide"] = "Formatierungsanleitung für Datum und Uhrzeit "
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
L["Day of the Dead"] = "Tag der Toten "
L["Debug"] = "Debug "
L["Debug Desc"] = "Jede der unten aufgeführten Optionen ist für Debugging- und Testzwecke verfügbar. Verwendung auf eigene Gefahr! "
L["Default value"] = "Vorgabewert (Standard) "
L["Deselect All"] = "Alle abwählen "
L["DF - Community Feast"] = "DF - Gemeinschaftliches Festmahl "
L["DF - Dreamsurge"] = "DF - Traumsprünge"
L["DF - Firestorms"] = "DF - Feuerstürme "
L["DF - Fyrakk Assault"] = "DF - Angriffe von Fyrakk "
L["DF - Grand Hunts"] = "DF - Große Jagd "
L["DF - Researchers Under Fire"] = "DF - Forscher unter Feuer "
L["DF - Sandstorms"] = "DF - Sandstürme "
L["DF - Siege on Dragonbane Keep"] = "DF - Belagerung der Drachenfluchfestung "
L["DF - Snowstorms"] = "DF - Schneestürme "
L["DF - Thunderstorms"] = "DF - Gewitterstürme "
L["Diablo III"] = "Diablo 3"
L["Diablo IV"] = "Diablo 4"
L["Discord"] = "Discord "
L["Discord Desc"] = "Öffnet ein Popup-Fenster mit einem Link zum {serverName} Discord-Server. Hier können Sie Kommentare, Berichte, Bemerkungen, Ideen und alles andere posten. "
L["Donations"] = "Spenden "
L["Dos-Ryga"] = "Dos-Ryga "
L["Down"] = "Runter "
L["Dragon Glyphs"] = "Drachenglyphen "
L["Dragon Racing"] = "Drachenrennen "
L["Dragonbane Keep"] = "Drachenfluchfestung "
L["Dragonflight"] = "Dragonflight "
L["Dragonflight Pre-patch"] = "Dragonflight Pre-patch "
L["Dragonflight pre-patch - Firestorms"] = "Dragonflight Pre-patch: Feuerstürme "
L["Dragonflight pre-patch - Sandstorms"] = "Dragonflight Pre-patch: Sandstürme "
L["Dragonflight pre-patch - Snowstorms"] = "Dragonflight Pre-patch: Schneestürme "
L["Dragonflight pre-patch - Thunderstorms"] = "Dragonflight Pre-patch: Gewitterstürme "
L["Dragonriding"] = "Drachenreiten "
L["Drops"] = "Beute "
L["Dueler's Guild"] = "Duellantengilde "
L["during"] = "während "
L["Earned By"] = "Erzielt durch "
L["Earned By Desc"] = [=[Header
|T:1:8|t- {achievementPointsEarnedBy}: Zeigt {achievementPointsEarnedBy_wc} Ihren aktuellen Charakter und/oder {achievementPointsEarnedBy_wc} Ihren Account an ({achievementPointsEarnedByFormat}) (1).
|T:1:8|t- {tooltip}: Übersicht darüber, welcher Charakter wie viele Erfolgspunkte verdient hat. Jeder Charakter muss mindestens einmal eingeloggt sein, um in diese Liste aufgenommen zu werden. Zeigt den Realm des Charakters an, wenn er unterschiedlich ist. Kann in den Optionen (1) so eingestellt werden, dass er immer angezeigt wird: Erfolge werden berücksichtigt, wenn sie mit einem beliebigen Charakter Ihres Kontos erzielt wurden (Standard).
|T:1:8|t- {Charakter}: Erfolge werden gesättigt, wenn sie mit dem aktuellen Charakter erzielt wurden, und teilweise gesättigt, wenn sie mit einem anderen Charakter auf dem Konto, aber nicht mit dem aktuellen Charakter erzielt wurden.

Tooltip
|T:1:8|t- {earnedBy}: Zeigt {earnedByNumber} Charaktere an, die den Erfolg verdient haben (2). Fraktions-exklusive Errungenschaften mit einem verknüpften Gegenstück werden berücksichtigt. D.h. Allianz-Charaktere können für Horden-Erfolge auftauchen. Zeigt den Realm des Charakters an, wenn er unterschiedlich ist. Kann über die Optionen (2) erzwungen werden, immer anzuzeigen: Zeigt {notEarnedByNumber} Charaktere an, die diese Errungenschaft noch nicht verdient haben (2). Fraktions-exklusive Errungenschaften mit einem verknüpften Gegenstück werden berücksichtigt. D.h. Allianz-Charaktere können für Horden-Errungenschaften auftauchen.  Zeigt den Realm des Charakters an, wenn er sich unterscheidet. Die Anzeige kann in den Optionen (2) erzwungen werden.(1) Die Optionen befinden sich unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {header}
(2) Optionen finden Sie unter {gameMenu} {Pfeil} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements} ]=]
L["Eastern Kingdoms Cup"] = "Östliche Königreiche Pokal"
L["Emberflow Flight"] = "Glutstrom-Flug "
L["Emerald Garden Ascent"] = "Smaragdgartenaufstieg "
L["Enable"] = "Aktivieren "
L["Enable debug info"] = "Debug-Informationen einschalten "
L["Enable debug info Desc"] = "Debug-Informationen einschalten/ausschalten "
L["Enable Desc"] = "Aktivieren / Deaktivieren Sie das Plugin. Wenn das Plugin hier deaktiviert ist ABER das Addon aktiv ist, können unvorhersehbare Dinge passieren. "
L["Enable trace info"] = "Trace-Informationen einschalten "
L["Enable trace info Desc"] = "Trace-Informationen einschalten/ausschalten "
L["End Time"] = "Ende (Zeit) "
L["Enhanced filtering and sorting"] = "Erweitertes Filtern und Sortieren "
L["Enhanced filtering and sorting Desc"] = [=[Das Filtern und Sortieren von Leistungen wurde um folgende Funktionen erweitert.

Kategorien:
|T:1:8|t- {mergeSmallCategories}: Kategorien zusammenführen, wenn dies bei weniger als {mergeSmallCategoriesNumber} Erfolgen (1) möglich ist.

Filterung (mehrere Filter können gleichzeitig ausgewählt werden):
|T:1:8|t- {completed}: Erreichte Erfolge anzeigen.
|T:1:8|t- {notCompleted}: Nicht abgeschlossene Erfolge anzeigen.
|T:1:8|t- {erreichbar}: Erreichbare Erfolge anzeigen.
|T:1:8|t- {notObtainable}: Nicht erreichbare Erfolge anzeigen.
|T:1:8|t- {faction} ({resetFactionFilters} {resetFactionFiltersEnabled}) (2)
|T:1:8|t- {neutral}: Zeigt Erfolge an, die von {alliance_wc} wie auch von {horde_wc} erworben werden können.
|T:1:8|t|T:1:8|t- {alliance}: Zeigt Leistungen an, die nur von {alliance_wc} erworben werden können.
|T:1:8|t|T:1:8|t- {horde}: Zeige Erfolge, die nur von {horde_wc} verdient werden können.
|T:1:8|t- {excluded}: Ausgeschlossene Erfolge anzeigen.
|T:1:8|t- {collapseChain}: Nur den letzten abgeschlossenen und den ersten nicht abgeschlossenen Erfolg in einer Serie anzeigen.

Sorting:
|T:1:8|t- {noSorting}: Keine Sortierung angewandt.
|T:1:8|t- {sortByName}: Sortieren von Erfolgen basierend auf ihren Namen.
|T:1:8|t- {sortByCompletion}: Sortiert Erfolge danach, ob sie abgeschlossen sind oder nicht.
|T:1:8|t- {sortByID}: Sortiert die Erfolge nach ihrer ID.
|T:1:8|t- {reverseSort}: Wenn dies ausgewählt ist, wird die Reihenfolge der sortierten Leistungen umgekehrt.

{Registerkarten}:
|T:1:8|t- Diese haben alle oben genannten Filter- und Sortierfunktionen, können aber unabhängig von den anderen geändert werden.
|T:1:8|t- Wenn Sie einen der oben genannten Filter ändern, werden die Filter- und Sortierfunktionen der einzelnen Registerkarten überschrieben. 

{specialCategories}:
|T:1:8|t- Diese haben alle oben erwähnten Filter- und Sortierfunktionen, können aber unabhängig von den anderen geändert werden.

{earnedBy} (siehe {earnedByTutorial} für weitere Details)
|T:1:8|t- {account}: Erfolge werden berücksichtigt, wenn sie mit einem beliebigen Charakter Ihres Kontos erzielt wurden: Erfolge werden gewertet, wenn sie mit dem aktuellen Charakter erzielt wurden, und teilweise gewertet, wenn sie mit einem anderen Charakter auf dem Konto erzielt wurden, aber nicht mit dem aktuellen Charakter.

Sonstiges:
|T:1:8|t- {help}: Startet das Tutorial von Anfang an und setzt das Gesehene zurück.
|T:1:8|t- Zeigt die spezielle Tutorial-Seite an, ohne das Gesehene zurückzusetzen.
|T:1:8|t- {Optionen}: Öffnet die Optionen des Addons (2).

Mehr Filter und Sortieroptionen können auf {discord} oder {curseForge} (Links in den Optionen) abgerufen werden.

(1) Die Optionen befinden sich unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {Layout} {arrow} {Kategorien}
(2) Optionen finden Sie unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName}.]=]
L["Enhanced tooltip"] = "Erweiteter Tooltip "
L["Enhanced tooltip Achievements Desc"] = [=[Jeder Tooltip enthält zusätzliche Informationen darüber, wie Erfolge miteinander in Beziehung stehen (falls sie es tun). Es wurden mehrere neue Bereiche hinzugefügt.

Features:
|T:1:8|t- {notObtainable}: Zeigt den Text '{noLongerObtainable}' an, wenn der Erfolg nicht mehr erreichbar ist.
|T:1:8|t- {earnedBy}: Siehe {earnedBy} für weitere Informationen.
|T:1:8|t- {partOfAChain}: Zeigt die Liste der Erfolge an, zu denen der Serien-Erfolg gehört (1) ({partOfAChainEnabled}) (2).
|T:1:8|t- {requiredFor}: Zeigt eine Liste der Errungenschaften an, für die der Serien-Erfolg abgeschlossen werden muss, um ihn zu erhalten (1) ({requiredForEnabled}) (2).
|T:1:8|t- {otherFaction}: Zeigt den zugehörigen Erfolg der anderen Fraktion ({otherFactionEnabled}) (2).
|T:1:8|t- {objectivesProgress}: Zeigt die Liste der Ziele mit Fortschritt an ({objectivesProgressEnabled}) (2).
|T:1:8|t- Benutzerdefinierte Ziele: Einige Errungenschaften haben benutzerdefinierte Ziele, wie z.B. die Transmog-Errungenschaften, die den Fortschritt bei den entsprechenden Transmog-Sets anzeigen.

Icons:
|T:1:8|t- {ready}: Der Erfolg ist abgeschlossen.
|T:1:8|t- {waiting}: Der Erfolg ist noch nicht abgeschlossen.
|T:1:8|t- {notready}: Der Erfolg kann nicht mehr erreicht werden.

Farben:
|T:1:8|t- {green}: Der Erfolg/das Ziel ist abgeschlossen.
|T:1:8|t- {gray}: Der Erfolg/das Ziel ist nicht abgeschlossen.
|T:1:8|t- {rot}: Der Erfolg kann nicht mehr erreicht werden.
|T:1:8|t- Hell {lightGreen}, {lightGrey} oder {lightRed}: Der Erfolg ist in ein Serien-Erfolg.

Weitere benutzerdefinierte  Informationen können auf {discord} oder {curseForge} (Links in den Optionen) angefordert werden.

(1) Optional können zwei Icons pro Zeile angezeigt werden. Das erste Icon ist das Standard-Icon, das zweite ist für den aktuellen Charakter ({currentCharacterIconEnabled}) (2).
(2) Die Optionen finden sich unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}.]=]
L["Enhanced tooltip Categories Desc"] = [=[Jeder Tooltip enthält zusätzliche Informationen darüber, wie viele Erfolge (nicht) erreichbar und (nicht) abgeschlossen sind.

Die Zahlen im Fortschrittsbalken haben das folgende Format:
|T:1:8|tOC (+NONC) / T
|T:1:8|t|T:1:8|t- {oc}: Die (nicht) erreichbaren abgeschlossenen Erfolge.
|T:1:8|t|T:1:8|t- {nonc}: Die nicht erhältlichen, nicht abgeschlossenen Erfolge (1).
|T:1:8|t|T:1:8|t- T: Gesamtanzahl der Erfolge.

Colors:
|T:1:8|t- {green}: Die (nicht) erreichbaren abgeschlossenen Erfolge.
|T:1:8|t- {rot}: Die nicht erhältlichen, nicht abgeschlossenen Erfolge (1).
|T:1:8|t- Empty: Die erreichbaren nicht abgeschlossenen Erfolge.

Der {rote} Teil des Fortschrittsbalkens und die Zahl in Klammern können entweder in den Optionen deaktiviert werden ({showNotObtainable}) (1) oder durch Deaktivieren des Filters {notObtainable}.

(1) Die Optionen findest Du unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}.]=]
L["Error Tabs Order"] = "{blizzard} Tab {statistics} kann nicht vor {guild} stehen. "
L["Event Reminder"] = "Event Erinnerung "
L["Event Reminder Desc"] = [=[{events} werden zum neuen Tab {events} hinzugefügt und eine Erinnerung erscheint (max. {numPopUps} zur gleichen Zeit), wenn eines der Ereignisse aktiv ist ({popUpEnabled}) (1).

Die Ereigniserinnerung hat den Namen des Ereignisses und bis zu 2 Zeilen Zeitanzeige (Endzeit des Ereignisses) (1).
Das Format der Zeitanzeige kann aus Voreinstellungen oder benutzerdefiniert ausgewählt werden (1).
 Eine kompakte Version mit einer einzigen Zeile für die Zeitanzeige (compactEnabled) ist vorhanden (1). 

Ein Klick darauf öffnet die Kategorie mit den erreichbaren Erfolgen, während das Ereignis aktiv ist.
Es verschwindet, wenn mit der rechten Maustaste geklickt wird oder nach {eventAlertFadeDelay} Sekunden, wenn es ignoriert wird (1). 

Die Erinnerung ist auch auf der rechten Seite des Erfolg-Fensters zu sehen.

Ereignistypen:
|T:1:8|t- KalenderEreignisse (z.B.: Feiertage).
|T:1:8|t- WidgetEreignisse (z.B.: Torghast).
|T:1:8|t- Weltereignisse (z.B.: Angriffe).

(1) Optionen findest Du unter {gameMenu} {arrow} {Interface} {arrow} {addOns} {arrow} {addonName} {arrow} {eventReminders}.]=]
L["Event Reminders"] = "Event Erinnerung "
L["Events"] = "Events "
L["Exclude"] = "Ausblenden "
L["Exclude Excluded achievements"] = "Ausgeschlossene Erfolge Suchen "
L["Exclude Excluded achievements Desc"] = "Ausgeschlossene Erfolge von den Suchergebnissen ausschließen bzw. in die Suchergebnisse aufnehmen. "
L["Excluded"] = "Filter: Erfolg Ausgeblendet "
L["Expansions"] = "Addons "
L["Expansions tab"] = "Addon Tab "
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
L["Export Criteria"] = "Erfolgs-Kriterien Export "
L["Export Criteria Desc"] = "Exportiert Erfolgs-Kriterien in die Gespeicherten Variablen. Dies wird verwendet, um neue Inhalte hinzuzufügen. "
L["Faction Assaults"] = "Fraktionsübergriffe "
L["Fade delay"] = "Ausblendeverzögerung "
L["Fade delay Desc"] = "Zeit in Sekunden, die das Ereignis Popup-Fenster braucht, um zu verschwinden, wenn es ignoriert wird. Mit einem Rechtsklick wird es sofort geschlossen. "
L["Fated Raids"] = "Schicksalhafte Raids "
L["Fated Raids: Castle Nathria"] = "Schicksalhafte Raids: Schloss Nathria "
L["Fated Raids: Castle Nathria (CN)"] = "Schicksalhafte Raids: Schloss Nathria (CN) "
L["Fated Raids: Castle Nathria (EU)"] = "Schicksalhafte Raids: Schloss Nathria (EU) "
L["Fated Raids: Castle Nathria (US)"] = "Schicksalhafte Raids: Schloss Nathria (US) "
L["Fated Raids: Sanctum of Domination"] = "Schicksalhafte Raids: Sanktum der Herrschaft "
L["Fated Raids: Sanctum of Domination (CN)"] = "Schicksalhafte Raids: Sanktum der Herrschaft (CN) "
L["Fated Raids: Sanctum of Domination (EU)"] = "Schicksalhafte Raids: Sanktum der Herrschaft (EU) "
L["Fated Raids: Sanctum of Domination (US)"] = "Schicksalhafte Raids: Sanktum der Herrschaft (US) "
L["Fated Raids: Sepulcher of the First Ones"] = "Schicksalhafte Raids: Mausoleum der Ersten "
L["Fated Raids: Sepulcher of the First Ones (CN)"] = "Schicksalhafte Raids: Mausoleum der Ersten (CN) "
L["Fated Raids: Sepulcher of the First Ones (EU)"] = "Schicksalhafte Raids: Mausoleum der Ersten (EU) "
L["Fated Raids: Sepulcher of the First Ones (US)"] = "Schicksalhafte Raids: Mausoleum der Ersten (US) "
L["Feast of Winter Veil"] = "Winterhauch "
L["Fen Flythrough"] = "Moor-Durchflug "
L["Filters"] = "Filter "
L["First day of the week"] = "Erster Tag der Woche "
L["First day of the week Desc"] = "Der erste Tag der Woche, den der Kalender verwenden soll. "
L["FixTabs"] = [=[Es werden einmalig wieder alle Tabs angezeigt. Dies war notwendig, um die neue Funktion zur Sortierung der Registerkarten einzuführen.
Entschuldige bitte die Unannehmlichkeiten. ]=]
L["Flashfrost Flyover"] = "Blitzfrost-Überflug "
L["Flexible"] = "Flexibel "
L["Flowing Pandaren Spirit"] = "Fließender Pandarengeist "
L["for achievement"] = "für {achievement} "
L["Force two columns"] = "Zwei Spalten erzwingen "
L["Force two columns Desc"] = "Aktiviere/deaktiviere den Algorithmus zur Erzwingung von zwei Spalten für die Erfolgs-Ziele. Wenn diese Option aktiviert ist und nur eine Spalte mit Zielen angezeigt wird, weil der Text eines oder mehrerer Ziele zu lang ist, wird auf der Grundlage der anderen Einstellungen eine zweite Spalte erzwungen. "
L["Force two columns threshold"] = "Schwelle für zwei Spalten erzwingen "
L["Force two columns threshold Desc"] = "Die Anzahl der Kriterien, die der Erfolg haben muss, damit eine zweite Spalte angezeigt wird, wenn normalerweise nur eine angezeigt würde. "
L["Format"] = "Format "
L["Fracture Chambers"] = "Frakturkammern "
L["from"] = "von "
L["from the start of"] = "ab dem Beginn der "
L["Full Search"] = "Vollständige Suche "
L["Full Search Desc"] = "Durch die Auswahl von \"{showAllResults}\" kannst Du alle Suchergebnisse anzeigen lassen. Weitere Einzelheiten findest Du im {quickSearchTutorial}-Tutorial. "
L["Fyrakk Assault"] = "Angriffe von Fyrakk "
L["Garden Gallivant"] = "Gartenpromenade "
L["Gifts"] = "Geschenke "
L["Gladiator's Sanctum"] = "Heiligtum des Gladiators "
L["Glory"] = "Standard "
L["Go to"] = "Gehe zu "
L["Going away with"] = "Nicht mehr erzielbar ab "
L["Gorespine"] = "Blutstachel "
L["Grand Hunts: Ohn'ahran Plains"] = "Große Jagd: Ebenen von Ohn'ahra "
L["Grand Hunts: Thaldraszus"] = "Große Jagd: Thaldraszus "
L["Grand Hunts: The Azure Span"] = "Große Jagd: Das Azurblaue Gebirge "
L["Grand Hunts: The Waking Shore"] = "Große Jagd: Die Küste des Erwachens "
L["Green"] = "Grün "
L["Grey"] = "Grau "
L["Greyhoof"] = "Grauhuf "
L["Grow direction"] = "Richtung "
L["Grow direction Desc"] = "Die Richtung, in der neue Benachrichtigungs-Fenster hinzugefügt werden sollen. "
L["Guides"] = "Leitfaden "
L["Hallow's End"] = "Schlotternächte "
L["Header"] = "Header "
L["Header tooltip"] = "Überschrift "
L["Hearthstone"] = "Hearthstone "
L["Heroes of the Storm"] = "Heroes of the Storm "
L["Hide Date Completed"] = "Erfolgs Abschluss-Datum verbergen "
L["Hide Date Completed Desc"] = "Verbirgt das Datum, an dem der Erfolg abgeschlossen wurde. "
L["Hide Not Earned By if current character earned the achievement"] = "{notEarnedBy} ausblenden, wenn der aktuelle Charakter den Erfolg schon erlangt hat "
L["Hide Not Earned By if current character earned the achievement Desc"] = "Blendet den Abschnitt {notEarnedBy} aus, wenn der aktuelle Charakter den Erfolg erworben hat. Der Abschnitt {earnedBy} wird ansonsten weiterhin wie gewohnt angezeigt. "
L["Holidays"] = "Feiertage "
L["Icon Left click"] = "um das \"Erfolge\" Fenster zu öffnen. "
L["Icon Right click"] = "für die Optionen. "
L["ID"] = "ID "
L["Ignore"] = "Ignorieren "
L["Ignore Filters"] = "Filter Ingorieren "
L["Ignore Filters Desc"] = "Ignoriere jegliche Filter und zeige alle Erfolge in dieser {category}. "
L["Imbu"] = "Imbu "
L["in"] = "in "
L["In instances"] = "In einer Instanz "
L["Include"] = "Hinzufügen "
L["Include all"] = "\"Filter: Erfolge ausgeblendet\" einbeziehen "
L["Include all Desc"] = "Schließen Sie alle ausgeschlossenen Erfolge mit ein. "
L["Indentation"] = "Unterkategorien einrücken "
L["Indentation Desc"] = "Die Größe der Einrückung von Unterkategorien. "
L["Invasions"] = "Invasionen "
L["is"] = "ist "
L["Iskaara Flyover"] = "Iskaara-Überflug "
L["Kafi"] = "Kafi "
L["Kalimdor Cup"] = "Der Kalimdorpokal "
L["Ka'wi the Gorger"] = "Ka'wi der Schlinger "
L["Keep current character"] = "Aktuellen Charakter beibehalten "
L["Keep current character Desc"] = "Behalte den aktuellen Charakter im Tooltip der Charaktere, unabhängig davon, ob der Charakter von der Liste durch die {maxNumChar} abgeschnitten werden würde oder nicht. "
L["Keybindings Desc"] = "Um die Tastaturbelegung für {addonName} zu ändern, wählen Sie den Tab \"Spiel\" oben links in diesem Fenster. Wählen Sie dann die Kategorie {keybindings} auf der linken Seite. Wählen Sie schließlich AddOns in der rechten Ansicht. "
L["Kyrian Assault"] = "Kyrian Paktangriff "
L["Layout"] = "Layout "
L["Left"] = "Links "
L["Left Alt"] = "Links Alt "
L["Left click"] = "Links-Klick "
L["Left Ctrl"] = "Links Ctrl "
L["Left Shift"] = "Links Shift "
L["Legion Assaults"] = "Angriffe der Legion "
L["Level 80"] = "Level 80 "
L["Level 85"] = "Level 85 "
L["Level 90"] = "Level 90 "
L["Leveling"] = "Level "
L["Line"] = "Zeile "
L["Load Tracking Achievements"] = "Aktivere die Erfassung von Erfolgen "
L["Load Tracking Achievements Desc"] = "Aktivere die Erfassung von Erfolgen Beschreibung "
L["Loaded"] = "Geladen "
L["Loaded Desc"] = "Zeigt an, ob das mit dem Plugin verbundene Addon geladen ist oder nicht. "
L["Localizations"] = "Sprach-Lokalisierungen "
L["Location"] = "Ort "
L["Lock month"] = "Gewählten Monat behalten immer behalten. "
L["Lock month Desc"] = "Behalte den zuletzt angezeigten immer Monat bei, wenn du den Kalender wieder öffnest, nachdem er geschlossen wurde. "
L["Lock month when closed by achievement"] = "Gewählten Monat behalten beim Anklicken eines Erfolgs. "
L["Lock month when closed by achievement Desc"] = "Behalte den zuletzt angezeigten Monat bei, wenn du den Kalender wieder öffnest, nachdem er durch Anklicken eines Erfolgs geschlossen wurde. "
L["Login Delay"] = "Login Verzögerung "
L["Love is in the Air"] = "Liebe liegt in der Luft "
L["Lucky Yi"] = "Glückspilz Yi "
L["Lunar Festival"] = "Mondfest "
L["M+ Season"] = "Mythic+ Saison "
L["Make windows movable"] = "Fenster verschiebbar machen "
L["Make windows movable Desc"] = [=[Macht das Erfolgsfenster, die Kalenderansicht und die Charakterübersicht beweglich/nicht beweglich.

Wenn diese Option aktiviert ist, wird das jeweilige Fenster bei gedrückter linker Maustaste verschoben. Dies gilt für die Kopfzeile und die Ränder. ]=]
L["Mantid"] = "Mantis "
L["Maruukai Dash"] = "Maruukaispurt "
L["Max number of alerts"] = "Maximale Anzahl der Ereignis Popup-Fenster "
L["Max number of alerts Desc"] = "Die maximale Anzahl der gleichzeitig angezeigten Ereignis Popup-Fenster. "
L["Maximum number of characters"] = "Maximale Anzahl von Charakteren "
L["Maximum number of characters Desc"] = "Die maximale Anzahl der Charaktere, die im Tooltip angezeigt werden sollen. "
L["Merge Small Categories"] = "Kleine Kategorien zusammenführen "
L["Merge small categories threshold"] = "Schwelle für kleine Kategorien zusammenführen "
L["Merge small categories threshold Desc"] = [=[Kategorien mit einer Anzahl von Erfolgen, die unter dieser Zahl liegt, werden mit der übergeordneten Kategorie verschmolzen.

Nur voreingestellte Kategorien können verschmolzen werden (meist untergeordnete Kategorien aus Zonen). Dies kann Auswirkungen (1) auf das Spiel haben.

(1) FPS-Einbrüche und Stottern beim Anpassen des Wertes, NICHT bei normaler Addon-Nutzung.]=]
L["Micro Button"] = "Micro Button "
L["Midsummer Fire Festival"] = "Sonnenwende "
L["Minimum characters to search"] = "Mindestanzahl der zu suchenden Charaktere "
L["Minimum characters to search Desc"] = [=[Die Anzahl der Charaktere, die benötigt werden, um die Suche nach Erfolgen, die der Abfrage entsprechen, zu starten. Je kleiner die Zahl, desto größer die Auswirkung (1) auf das Spiel.

(1) FPS-Einbrüche und Stottern bei der Suche.]=]
L["Mirror of the Sky Dash"] = "Spurt zum Spiegel des Himmels "
L["Modifiers"] = "Modifikatoren "
L["Mogu"] = "Mogu "
L["More"] = "Mehr... "
L["Mort'regar"] = "Mort'regar "
L["Most progress"] = "Fortschritt "
L["Mouse Wheel Scroll Speed"] = "Maus Rad Scroll-Geschwindigkeit "
L["Mouse Wheel Scroll Speed Desc"] = "Die Anzahl der {items}, die beim Klicken auf die Buttons nach oben/unten in der Scroll-Leiste oder beim Drehen des Mausrads neu angezeigt werden. "
L["Movable"] = "Bewegliche Fenster "
L["Necrolord Assault"] = "Nekrolord Paktangriff "
L["Necrolords Assault"] = "Nekrolord Paktangriff "
L["Needs /love for achievement"] = "Benötigt deine /liebe {forAchievement} "
L["Needs to be completed for achievement"] = "Muss noch {forAchievement} abgeschlossen werden "
L["Needs to be cooked for achievement"] = "Muss noch {forAchievement} gekocht werden "
L["Needs to be defeated for achievement"] = "Muss noch {forAchievement} besiegt werden "
L["Needs to be drunk for achievement"] = "Muss noch {forAchievement} getrunken werden "
L["Needs to be eaten for achievement"] = "Muss noch {forAchievement} gegessen werden "
L["Needs to be killed for achievement"] = "Muss noch {forAchievement} getötet werden "
L["Needs to be petted for achievement"] = "Muss noch {forAchievement} gestreichelt werden "
L["never obtainable"] = "nicht erzielbar "
L["New Achievement Colors"] = "Neue Erfolgs-Farben "
L["New Achievement Colors Desc"] = [=[- Das Standard-Gold eines erhaltenen Erfolgs. Der Rahmen wird von Rot auf Gold geändert.
- Das neue Rot eines erhaltenen, nicht erhältlichen Erfolgs mit rotem Standardrahmen.
- Das neue Rot eines nicht erhaltenen, nicht erhältlichen Erfolgs mit grauem Standardrahmen.
- Das Standardblau eines erhaltenen, accountweiten Erfolgs mit blauem Standardrahmen. ]=]
L["New achievement window tabs"] = "Neue Tabs für das Erfolgs-Fenster "
L["New achievement window tabs Desc"] = [=[Dem Erfolg-Fenster werden neue Registerkarten hinzugefügt.
Dies bietet eine neue Möglichkeit, Erfolge auf vertraute Weise anzuzeigen, ohne die Standard-Tabs zu beeinträchtigen.

Tabs:
|T:1:8|t- {Errungenschaften}: Eine Kopie der Standard-Registerkarte {achievements}, aber mit allen neuen Funktionen, die von {AddonName_y} hinzugefügt wurden.
|T:1:8|t- {expansions}: Erfolge sind in Kategorien pro Erweiterung mit einer logischeren Hierarchie gruppiert. Siehe das {expansionsTabTutorial}-Tutorial für weitere Details.
|T:1:8|t- {events}: Erfolge sind in Kategorien pro Ereignis gruppiert. Dies reicht von Feiertagen bis hin zu Weltereignissen wie Angriffen.
|T:1:8|t- {pvp}: Erfolge sind in Kategorien pro Schlachtfeld gruppiert.
|T:1:8|t- {specials}: Diese Kategorien sind Sammlungen von Erfolgen, die Reittiere, Titel, Transmog und andere verleihen, die nirgendwo anders richtig hinpassen.

Bei den Optionen können sowohl die Standardreiter als auch die von {addonName_y} hinzugefügten Reiter ausgeblendet werden (1).
{pluginText}
(1) Die Optionen findest du unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {tabs}.]=]
L["News"] = "Neuigkeiten "
L["Night Fae Assault"] = "Night Fae Paktangriff "
L["Nitun"] = "Nitun "
L["No achievements are available with the current set of filters"] = "Es können keine Erfolge mit den von dir gesetzten Filtern angezeigt werden. "
L["No time data available"] = "Keine Zeitdaten verfügbar "
L["Noblegarden"] = "Nobelgarten "
L["Nokhudon Hold"] = "Festung Nokhudon "
L["NONC"] = "NONC "
L["None"] = "Keine "
L["No-No"] = "No-No "
L["Not Earned By"] = "Nicht erzielt durch "
L["Not earned by:"] = "Nicht erzielt durch: "
L["Not loaded"] = "Nicht Geladen "
L["Not Obtainable"] = "Nicht Verfügbar "
L["Not part of set"] = "Nicht Teil des Transmog-Sets "
L["Number of Earned By characters"] = "Anzahl der {earnedBy} Charaktere "
L["Number of Earned By characters Desc"] = [=[Die Anzahl der Charaktere, die angezeigt werden, die den Erfolg erlangt haben.

 Wenn Du hier 0 einstellst, wird diese Funktion deaktiviert. ]=]
L["Number of Most progress characters"] = "Anzahl der Charaktere mit den größten Erfolgs-Fortschritten "
L["Number of Most progress characters Desc"] = [=[Die Anzahl der Charaktere, die angezeigt werden, die schon einen Erfolgs-Fortschritt gemacht haben.

Wenn Sie den Wert 0 einstellen, wird diese Funktion deaktiviert. ]=]
L["Number of Not Earned By characters"] = "Anzahl der {notEarnedBy} Charaktere "
L["Number of Not Earned By characters Desc"] = [=[Die Anzahl der Charaktere, die angezeigt werden, die den Erfolg nicht erlangt haben.

 Wenn Du hier 0 einstellst, wird diese Funktion deaktiviert. ]=]
L["Number of search previews"] = "Anzahl der Such-Vorschauen "
L["Number of search previews Desc"] = "Die Anzahl der Erfolge, die als Vorschau in der gesamten Liste der gefundenen Erfolge angezeigt werden. "
L["Number of summary achievements"] = "Anzahl aller Erfolge "
L["Number of summary achievements Desc"] = "Die Anzahl der Erfolge, die in der Zusammenfassung der einzelnen Registerkarten angezeigt werden. "
L["N'Zoth Assaults"] = "Angriffe von N'Zoth "
L["Objectives"] = "Ziele "
L["Objectives progress"] = "Erfolgs-Fortschritt "
L["Obtainable"] = "Verfügbar "
L["OC"] = "OC "
L["Offsets"] = "Fenster Abstände "
L["Ohn'ahran Plains"] = "Ebenen von Ohn'ahra "
L["Ohn'iri Springs"] = "Quellen von Ohn'iri "
L["On Event Start"] = "Bei Ereignisbeginn "
L["On Login"] = "Beim Login "
L["On Reload"] = "Nach einem Reload "
L["only obtainable by one player"] = "nur von einem Spieler zu erzielen "
L["Only search filtered achievements"] = "Nur nach gefilterten Erfolgen suchen "
L["Only search filtered achievements Desc"] = "Nur Erfolge suchen, die mit den eingestellten Filtern sichtbar sind. "
L["Only when time data is available"] = "Nur wenn Zeit-Daten verfügbar sind "
L["Open"] = "Öffnen "
L["Order"] = "Tab Reihenfolge "
L["Other"] = "Andere "
L["Other faction"] = "Andere Fraktion "
L["Other locations"] = "Weitere... "
L["Other wings"] = "Weitere Flügel "
L["Overflow"] = "Überlauf "
L["Overwatch"] = "Overwatch "
L["Pandaren"] = "Pandaren "
L["Part of a chain"] = "Teil einer Folgequest "
L["Passage Pathway"] = "Weg durch die Passage "
L["Paste to Chat"] = "Kopiere in das Chat Fenster "
L["Patch"] = "Patch "
L["Pilgrim's Bounty"] = "Die Pilgerfreuden "
L["Pirates' Day"] = "Piratentag "
L["Placeholder"] = "Platzhalter "
L["Plugins"] = "Plugins "
L["Points"] = "Punkte "
L["Pop ups"] = "Popup-Fenster "
L["Presets"] = "Voreinstellungen "
L["Primal Storms"] = "Urstürme "
L["Primalist Tomorrow"] = "Urzeitliche Primalisten "
L["PvP"] = "PvP "
L["PvP Season"] = "PvP Saison "
L["Quick Search"] = "Schnell-Suche "
L["Quick Search Desc"] = [=[Sucht nach Erfolgen in den von {addonName} hinzugefügten Tabs. Die Standard-Tabs werden nicht durchsucht.

Features:
|T:1:8|t- Suche nach dem Titel und der Beschreibung der Leistung, alphabetisch sortiert nach dem Titel.
|T:1:8|t- Suche nach der ID des Erfolgs, indem die Suchanfrage mit '#' begonnen wird, geordnet nach aufsteigender ID. 

Optionen (1): 
|T:1:8|t- {clearOnRightClick} ({clearOnRightClickEnabled})
|T:1:8|t- {excludeExcludedAchievements} ({excludeExcludedAchievementsEnabled} schließt Erfolge {excludeExcludedAchievementsFrom} aus den Suchergebnissen aus)
|T:1:8|t- {searchFilteredAchievements} ({searchFilteredAchievementsEnabled})
|T:1:8|t- {minCharToSearch} ({minCharToSearchNumber})
|T:1:8|t- {numSearchPreviews} ({numSearchPreviewsNumber})

(1) Die Optionen findest du unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {AddonName}.]=]
L["Rated"] = "Gewertet "
L["Ravine River Run"] = "Schluchtflusslauf "
L["Realm"] = "Realm "
L["Realm First!"] = "Realm First! "
L["Rebind Micro Button"] = "Micro Button ändern "
L["Rebind Micro Button Desc"] = "Binden Sie die Micro-Button \"Erfolge\" neu, um einen anderen Tab als den Standard-Tab zu öffnen. "
L["Recruit-a-Friend"] = "Werbt einen Freund "
L["Red"] = "Rot "
L["Refresh Events"] = "Events aktualisieren "
L["Refresh interval"] = "Aktualisierungsintervall "
L["Refresh interval Desc"] = "Die Zeit in Sekunden zwischen den Aktualisierungen der Ereignis-Daten. Eine längere Zeitspanne kann die Erstellung neuer Popup-Fenster bzw. das Bereinigen vorhandener Popup-Fenster verzögern. "
L["Related Tab"] = "Zugehöriger Tab "
L["Related Tab Desc"] = "Öffnet eine neue, andere Registerkarte im Browser als die Standardregisterkarte wenn dies ausgewählt wird. "
L["Remember frame position"] = "{frame} Position merken "
L["Remember frame position Desc"] = "Die Position des {frame} wird gespeichert. Dadurch bleibt der {frame} bei der nächsten Anmeldung an seiner letzten bekannten Position. "
L["Remove from Watch List"] = "Von {watchList} löschen "
L["Required for"] = "Wird benötigt für... "
L["Researchers Under Fire"] = "Forscher unter Feuer "
L["Reset Faction Filters"] = "Fraktions Filter zurücksetzen "
L["Reset Faction Filters Desc"] = "Die Fraktions-Filter zurücksetzen / beibehalten. Das bedeutet, dass, wenn du dich z.B. mit einem {Allianz}-Charakter anmeldest und einer der {neutralen}, {Allianz}- oder {Horden} Fraktions-Filter aktiviert/deaktiviert ist, werden nur die {neutral} und {alliance} Fraktions-Filter aktiviert. Diese Option wird bevorzugt, wenn viel zwischen {Allianz} und {Horde} gewechselt wird. "
L["Reset filters"] = "Filter zurücksetzen "
L["Reset position"] = "Position zurücksetzen "
L["Reset position Desc"] = "Setzt das {frame} auf seine Standardposition zurück. "
L["Reset view"] = "Ansicht zurücksetzen "
L["Reset view on open"] = "Zurücksetzen der Ansicht beim Öffnen "
L["Reset view on open Desc"] = "Alle geöffneten Kategorien schliessen und die erste Kategorie auswählen. "
L["Reverse Sort"] = "Umgekehrte Sortierung "
L["Right"] = "Rechts "
L["Right Alt"] = "Rechts Alt "
L["Right click"] = "Rechts-Klick "
L["Right Click Menu"] = "Rechts-Klick Menü "
L["Right Click Menu Desc"] = [=[Jeder Erfolg in den neuen Tabs hat ein {rightClickMenu}.

Features:
|T:1:8|t- Link zu {wowhead}.
|T:1:8|t- {goTo}-Verknüpfung zu Erfolgen, die {partOfAChain} sind, die {require} diesen Erfolg erfordern, um abgeschlossen zu werden oder die auch in anderen Kategorien zu finden sind. Erfolge in der Kategorie {currentZone} haben eine Verknüpfung zu ihrer richtigen Position im Kategorienbaum.
|T:1:8|t- Link zu {xuFuPetGuides}, wenn der Erfolg mit {petBattles} zusammenhängt und {xuFuPetGuides} relevante Informationen dazu enthält.
|T:1:8|t- Link zu Transmog-Sets, wenn es das Ziel des Erfolgs ist, eines zu sammeln.
{pluginText}
|T:1:8|t- {more}: Gruppiert verschiedene Gegenstände, um das Hauptmenü nicht zu überladen.
|T:1:8|t- {addToWatch}: Fügt den Erfolg zur Kategorie {watchList} hinzu. (Nur bei Erfolgen verfügbar die noch nicht auf der Beobachtungsliste sind).
|T:1:8|t|T:1:8|t- {removeFromWatch}: Entfernt den Erfolg aus der Kategorie {watchList}. (Nur bei fokussierten Erfolgen verfügbar).
|T:1:8|t|T:1:8|t- {include}: Nimmt den Erfolg wieder in die normale Ansicht auf. (Nur bei ausgeschlossenen Erfolgen verfügbar).
|T:1:8|t|T:1:8|t- {exclude}: Schließt den Erfolg aus der normalen Ansicht aus. (Nur bei eingeschlossenen Erfolgen verfügbar).

Optionen:
|T:1:8|t- Bei jedem Erfolg kann eine Schaltfläche angezeigt werden, die das {rightClickMenu} öffnet. ({aktiviert}) (1)

(1) Die Optionen befinden sich unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {rightClickMenu}.]=]
L["Right Ctrl"] = "Rechts Ctrl "
L["Right Shift"] = "Rechts Shift "
L["River Rapids Route"] = "Stromschnellenstrecke "
L["Ruby Lifeshrine Loop"] = "Rubinlebensschrein-Schleife "
L["Rydyr"] = "Rydyr "
L["Scalecracker Keep"] = "Schuppenknackergipfel "
L["Screenshot Mode"] = "Bildschirmfoto-Modus "
L["Screenshot Mode Desc"] = [=[Fügt einen schwarzen Rahmen über allem hinzu. Nur neu geöffnete Fenster sind sichtbar. Dies wird zum Erstellen von Screenshots verwendet.

Ein Neuladen ist erforderlich, um den schwarzen Rahmen zu entfernen! ]=]
L["Screenshots"] = "Bildschirmfoto "
L["Search"] = "Suche "
L["Search field"] = "Such-Feld "
L["Search preview"] = "Such-Vorschau "
L["Search Results"] = "Suchergebnisse "
L["Season"] = "Saison "
L["Second column threshold"] = "Zweite Spalte: Schwellenwert "
L["Second column threshold Desc"] = "Erfolge mit mehr Teilaufgaben als dieser Zahl werden in zwei Spalten statt in einer angezeigt. "
L["Secrets of Azeroth"] = "Geheimnisse von Azeroth "
L["Secrets of Azeroth (EU)"] = "Geheimnisse von Azeroth (EU) "
L["Secrets of Azeroth (KR)"] = "Geheimnisse von Azeroth (KR) "
L["Secrets of Azeroth (US)"] = "Geheimnisse von Azeroth (US) "
L["Select All"] = "Alle auswählen "
L["Selected Zone"] = "Ausgewählte Zone "
L["Set Keybind"] = "Tastaturbelegung ändern "
L["Set Keybind Desc"] = "Setzen Sie die Tastaturbelegung für den ausgewählten Tab auf \"Y\". Dies hebt die Bindung aller anderen an 'Y' gebundenen Aktionen auf. Andere Tastaturbelegungen können in den regulären {keyBindings} festgelegt werden. "
L["Shift"] = "Shift "
L["Shipyard"] = "Werft "
L["Show"] = "Zeige "
L["Show alertSystem on event start Desc"] = "Ein-/Ausblenden des {alertSystem} für ein Ereignis, sobald es beginnt. "
L["Show alertSystem on event start in instances Desc"] = "Ein-/Ausblenden des {alertSystem} für ein Ereignis, sobald es beginnt, während man sich in einer Instanz befindet. "
L["Show alertSystem on event start only when time data is available Desc"] = "Das Ereignis {alertSystem} für ein Ereignis das gerade beginnt nur anzeigen/ausblenden, wenn noch eine Restzeit für das Ereignis verfügbar ist."
L["Show alertSystem on login Desc"] = "Ereignis {alertSystem} beim Neuladen oder Betreten des Spiels anzeigen/ausblenden. "
L["Show alertSystem on login in instances Desc"] = "Ein-/Ausblenden von Ereignis {alertSystem} beim Neu-laden oder Betreten des Spiels innerhalb einer Instanz. "
L["Show alertSystem on login only when time data is available Desc"] = "Das Ereignis {alertSystem} beim Beitritt zum Spiel nur anzeigen/ausblenden, wenn noch eine Restzeit für das Ereignis vorhanden ist. "
L["Show alertSystem on reload Desc"] = "Ereignis {alertSystem} anzeigen/ausblenden, wenn das Spiel neu geladen wird. "
L["Show alertSystem on reload in instances Desc"] = "Ereignis {alertSystem} anzeigen/ausblenden, wenn das Spiel innerhalb einer Instanz neu geladen wird. "
L["Show alertSystem on reload only when time data is available Desc"] = "Das Ereignis {alertSystem} beim Neuladen des Spiels nur anzeigen/ausblenden, wenn noch Restzeit für das Ereignis vorhanden ist. "
L["Show All Results in Category"] = "Zeige alle Suchergebnisse in einer Kategorie an "
L["Show All Results in Category Desc"] = "Alle Suchergebnisse in einer Kategorie anzeigen, die während dieser Sitzung bestehen bleibt. "
L["Show Criteria"] = "Zeige Kriterien "
L["Show Criteria Desc"] = "Zeige Kriterien im Einheiten Tooltip die für das Erlangen eines Erfolgs notwendig sind. "
L["Show Criteria If"] = "Zeige Kriterien wenn "
L["Show current character icons"] = "Zeige aktuelle Charakter Icons "
L["Show current character icons Desc"] = [=[Zeigt / Verbirgt aktuelle Charaktersymbole.

Wenn diese Option aktiviert ist, erscheint ein zweites Symbol vor {partOfAChain} und {requiredFor} Erfolgen, das den Fortschritt des aktuellen Charakters anzeigt. ]=]
L["Show Date Completed Time"] = "Datum anzeigen inklusive Zeitpunkt"
L["Show Date Completed Time Desc"] = "Zeigt den Zeitpunkt (Stunden, Minuten und Sekunden) an, zu der der Erfolg erreicht wurde. Hinweis: Blizzard speichert diese Informationen nicht, so dass nur neu erworbene Erfolge diese Daten enthalten. Das Löschen der Dateien und/oder des Ordners \"Gespeicherte Variablen\" oder des WTF-Ordners setzt diese Informationen auf die Standardzeit von 12:00:00 Uhr zurück."
L["Show Excluded Category"] = "Kategorie \"Erfolge ausgeblendet\" anzeigen "
L["Show Excluded Category Desc"] = [=[Zeige / verstecke {excluded} Kategorie.

Wenn das Häkchen gesetzt ist, wird diese Kategorie nur angezeigt, wenn es tatsächlich ausgeschlossene Erfolge gibt und die eingestellten Filter es erlauben, diese anzuzeigen.

Wenn das Häkchen nicht gesetzt ist, ist die Kategorie immer versteckt und die Filter sind ebenfalls versteckt. ]=]
L["Show Faction Faction Icon"] = "Zeige {faction} Fraktions Symbol "
L["Show Faction Faction Icon Desc"] = "Zeigt das {faction} Fraktionssymbol auf den Erfolgen an, wenn nur {faction} Spieler diese verdienen können. "
L["Show faction icon"] = "Fraktions-Symbol anzeigen "
L["Show faction icon Desc"] = "Ein Fraktionssymbol vor dem Namen des Charakters anzeigen. "
L["Show For Achievement"] = "Zeige Kriterien für Erfolg "
L["Show For Achievement Desc"] = "Zeige den Erfolg für den die Erfolgs-Kriterien benötigt werden. "
L["Show minimap icon"] = "Zeige Minimap Icon "
L["Show minimap icon Desc"] = "Zeige / Verstecke das Minimap Icon. "
L["Show Not Obtainable"] = "Zeige {notObtainable} "
L["Show Not Obtainable Desc"] = "Zeigt / versteckt {notObtainable} Erfolge in Rot auf dem Fortschrittsbalken. "
L["Show Objectives progress"] = "Zeige {objectivesProgress} "
L["Show Objectives progress Desc"] = [=[{objectivesProgress} ein-/ausblenden.

Wenn diese Option aktiviert ist, werden die {objectivesProgress} der Erfolge im Tooltip angezeigt. ]=]
L["Show Other faction"] = "Zeige weitere Fraktionen "
L["Show Other faction Desc"] = [=[Zeige / verstecke {otherFaction}.

Wenn diese Option aktiviert ist, wird der Erfolg der anderen Fraktion im Tooltip angezeigt, sofern verfügbar. Dadurch wird es vielleicht klarer, warum euer neuer Horde-Charakter bestimmte Errungenschaften hat, wenn ihr vorher nur Allianz gespielt habt. ]=]
L["Show Part of a Chain"] = "Zeige {partOfAChain} "
L["Show Part of a Chain Desc"] = [=[Zeige / Verstecke {partOfAChain}.

Wenn diese Option aktiviert ist, wird der Serien-Erfolg, zu dem er gehört, im Tooltip angezeigt. ]=]
L["Show placeholders"] = "Zeige Platzhalter "
L["Show placeholders Desc"] = "Zeigt eine Reihe von Platzhalter-Ereignissen an, um eine visuelle Anzeige der Wirkung der oben genannten Einstellungen zu ermöglichen. Sie können wieder geschlossen werden, indem Sie die Maus über sie bewegen oder mit der rechten Maustaste darauf klicken. "
L["Show placeholders filter"] = "Filter \"Platzhalter\" anzeigen "
L["Show placeholders filter Desc"] = [=[Zeigt / Versteckt den Platzhalterfilter in den Filtern. Dieser wird verwendet, um Erfolge anzuzeigen, die noch nicht im Spiel sind.

Kann Spoiler enthalten, wenn aktiviert! ]=]
L["Show pop ups on login delay Desc"] = "Verzögern Sie das Einblenden der ersten Ereignis-Popups beim Einloggen. "
L["Show Required for"] = "Zeige {requiredFor} "
L["Show Required for Desc"] = [=[{requiredFor} ein-/ausblenden.

Wenn diese Option aktiviert ist, wird der Erfolg, für den der ausgewählte Erfolg abgeschlossen werden muss, in der QuickInfo angezeigt. ]=]
L["Show Rewards"] = "Zeige Belohnungen "
L["Show Rewards Desc"] = [=[{rewards} anzeigen/ausblenden,

Wenn diese Option aktiviert ist, werden die {rewards}, die diese Erfolge gewähren, im Tooltip angezeigt, sofern verfügbar. ]=]
L["Show Right Click Menu"] = "{rightClickMenu} Button anzeigen "
L["Show Right Click Menu Desc"] = [=[Zeigt / Versteckt den {rightClickMenu} Button auf jedem Erfolg.

Dies dient als Alternative für einen Rechtsklick auf den Erfolg. ]=]
L["Show Sub Categories"] = "Unterkategorien anzeigen "
L["Show Sub Categories Desc"] = [=[Unterkategorien anzeigen/ausblenden.

Wenn diese Option aktiviert ist, werden die Erfolge unter ihren ursprünglichen Unterkategorien platziert, anstatt alle zusammen unter der einzigen Kategorie {Kategorie}. ]=]
L["Show world map icon"] = "Zeige Welt-Map Icon"
L["Show world map icon Desc"] = "Zeige / Verstecke das Welt-Map Icon. "
L["Side Button Anchor"] = "Seitlicher Button-Anker "
L["Side Button Anchor Desc"] = "Das Fenster, an dem die seitlichen Buttons auf der rechten Seite angebracht werden. "
L["Side Window"] = "Scroll-Leiste "
L["Siege on Dragonbane Keep"] = "Belagerung der Drachenfluchfestung "
L["Siege on Dragonbane Keep: Active"] = "Belagerung der Drachenfluchfestung: Aktiv "
L["Siege on Dragonbane Keep: Gathering"] = "Belagerung der Drachenfluchfestung: Sammeln "
L["Skitterer Xi'a"] = "Huscher Xi'a "
L["Skoldus Hall"] = "Skoldushalle "
L["Slagmire"] = "Schlackensumpf "
L["Sort priority"] = "Priorität sortieren "
L["Soulforges"] = "Die Seelenschmieden "
L["Sources"] = "Quellen "
L["Southshore vs. Tarren Mill"] = "Süderstade vs. Tarrens Mühle "
L["Spacing"] = "Abstand "
L["Spacing Desc"] = "Der Abstand, der zum Standardabstand zwischen den Registerkarten addiert bzw. von diesem subtrahiert wird. "
L["Special Categories"] = "Spezial Kategorie "
L["Special thanks"] = "Besonderer Dank "
L["Specials"] = "Spezial "
L["Stables"] = "Ställe "
L["StarCraft II"] = "StarCraft 2"
L["Start Time"] = "Beginn (Zeit) "
L["Strand of the Ancients"] = "Strand der Uralten "
L["Style"] = "Style Erfolgs-Fenster "
L["Summary Desc"] = [=[{achievementsHeader}:
|T:1:8|t- Zeigt die letzten {numAchievements} für Account- und Charaktererfolge (1).

{categoriesHeader}:
|T:1:8|t- Zeigt den Fortschritt für jede Kategorie im Tab. Dies ist derselbe Fortschritt, den du sehen würdest, wenn du mit der Maus über eine Kategorie auf der Seite fährst.

(1) Optionen findest du unter {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {categories} {arrow} {summary}.]=]
L["Sundapple Copse Circuit"] = "Sonnentüpfelheinstrecke "
L["Tab"] = "Tab "
L["tab"] = "Tab "
L["Tabs"] = "Tabs "
L["Ta's Pet Collection"] = "Ta's Haustier Collection "
L["temporary obtainable"] = "zeitlich begrenzt erzielbar "
L["Temporary Obtainable Text"] = "{thisAchievement}{isWillBeWas}{neverOnceTempObt}{startText}{startDetail}{endText}{endDetail} "
L["Thaldraszus"] = true
L["The Azure Span Slalom"] = "Slalom des Azurblauen Gebirges "
L["The Azure Span Sprint"] = "Sprint des Azurblauen Gebirges "
L["The Entitled"] = "Hochverehrter "
L["The Flowing Forest Flight"] = "Flug des Wallenden Walds "
L["The Vakthros Ascent"] = "Vakthrosaufstieg "
L["This achievement"] = "Dieser Erfolg "
L["This achievement can't be earned by this character."] = "Der Erfolg kann nicht von diesem Charakter erzielt werden. "
L["This achievement is no longer obtainable"] = "Dieser Erfolg kann nicht länger erzielt werden. "
L["This character's class has no transmog set that meet the requirements."] = "Die Klasse deines Charakters erfüllt nicht die Anforderungen für dieses Transmog-Set. "
L["Thundering Pandaren Spirit"] = "Bebender Pandarengeist "
L["Time display"] = "Zeit Anzeige "
L["Time Left"] = "Zeit übrig "
L["Time Rift: Active"] = "Zeitrisse: Aktiv "
L["Time Rift: Starting Soon"] = "Zeitrisse: Starten Bald "
L["Time Rifts"] = "Zeitrisse "
L["Titan Lockdown"] = "Titanenabriegelung "
L["Titan Lockdown: Active"] = "Titanenabriegelung: Aktiv "
L["Titan Lockdown: Soon"] = "Titanenabriegelung: Bald "
L["Ti'un the Wanderer"] = "Ti'un der Wanderer "
L["Toggle"] = "Auswählen "
L["Toggle Tracking"] = "Erfolgs-Verfolgung umschalten "
L["Toggle window once opened"] = "Fenster nach dem Öffnen umschalten "
L["Toggle window once opened Desc"] = "Wenn das Erfolgsfenster das erste Mal geöffnet wird, öffnet sich ein Tab und wählt die Zusammenfassung. Ab dem zweiten Mal, unabhängig von der verwendeten Tastenkombination, öffnet sich die letzte Ansicht. "
L["Tooltip"] = "Tooltip "
L["Torghast"] = "Torghast "
L["Tracking Achievements"] = "Erfassung von Erfolgen "
L["Transmog Sets"] = "Transmog-Sets "
L["Truncate"] = "Abschneiden "
L["Turbulent Timeways"] = "Turbulente Zeitwege"
L["Tutorial"] = "Tutorial "
L["Tutorial Desc"] = "Öffne das Tutorial beim Start. "
L["Tyrhold"] = "Tyrhold "
L["Uktulut Coaster"] = "Uktuluter Küstenachter "
L["Uncategorized"] = "Nicht kategorisiert "
L["Unchecked"] = "Nicht aktiviert "
L["until the end of"] = "bis zum Ende von "
L["Up"] = "Hoch "
L["up until the start of"] = "bis zum Ende von "
L["Upper Reaches"] = "Die Oberen Ebenen "
L["Vendor"] = "Verkäufer "
L["Venthyr Assault"] = "Venthyr Paktangriff "
L["View Tutorial"] = "Tutorial anzeigen "
L["Wago"] = "Wago "
L["Wago Desc"] = "Öffnet ein Popup-Fenster mit einem Link zur Seite {addonName} {wago}. "
L["Waking Shores"] = "Küste des Erwachens"
L["Warcraft III: Reforged"] = "Warcraft III: Reforged "
L["was"] = "war "
L["Watch List"] = "Beobachtungsliste "
L["When achievement completed"] = "Wenn Erfolg abgeschlossen "
L["When achievement completed Desc"] = [=[Zeigt / verbirgt {objectivesProgress}, wenn die Erfolge abgeschlossen sind.

Wenn diese Option aktiviert ist, werden die {objectivesProgress} der Erfolge im Tooltip angezeigt, unabhängig davon, ob der Erfolg abgeschlossen ist oder nicht. ]=]
L["Whispering Pandaren Spirit"] = "Flüsternder Pandarengeist "
L["Widget Events"] = "Widget Events "
L["Wild Preserve Circuit"] = "Wildreservat-Parcours "
L["Wild Preserve Slalom"] = "Wildreservat-Slalom "
L["will be"] = "wird "
L["Window"] = "Fenster "
L["Wingrest Roundabout"] = "Schwingenrastkreisel "
L["World Events"] = "Welt Events "
L["World Map"] = "Welt Karte "
L["World Map Button"] = "World Map Button "
L["World Map Button Desc"] = [=[Hover:
|T:1:8|t- Zeigt an, wie viele Achievements wie die {enhancedTooltipCategories} basierend auf den für die {selectedZone} eingestellten Filtern (nicht) erhältlich und (nicht) abgeschlossen sind.
|T:1:8|t- Weitere Informationen findest du unter {enhancedTooltipCategories} und {enhancedFilteringAndSorting}.

Click:
|T:1:8|t- Öffnet das Achievement-Fenster für die Kategorie {selectedZone}. ]=]
L["Wowhead"] = "Wowhead "
L["Wowhead Link"] = "Wowhead Link "
L["WoWInterface"] = "WoWInterface "
L["WoWInterface Desc"] = "Öffnet ein Popup-Fenster mit einem Link zur Seite {addonName} {woWInterface}. "
L["WoW's 10th Anniversary"] = "10-jähriges Jubiläum von WoW "
L["WoW's 18th Anniversary"] = "WoW's 18. Geburtstag "
L["WoW's 19th Anniversary"] = "WoW's 19. Geburtstag"
L["WoW's Anniversary"] = "WoW's Geburtstag "
L["X offset Desc"] = "Der horizontale Versatz von der Startposition. "
L["Xu-Fu's Pet Guides"] = "Xu-Fu's Pet Guides "
L["XYZ offset"] = "{xyz} offset "
L["Y offset Desc"] = "Der vertikale Versatz von der Startposition. "
L["Zaqali Ruin Investigation"] = "Zaqaliruinen "
L["Zaqali Ruin Investigation: Active"] = "Zaqaliruinen: Aktiv "
L["Zaqali Ruin Investigation: Soon"] = "Zaqaliruinen: Bald "
L["Zones"] = "Zonen "