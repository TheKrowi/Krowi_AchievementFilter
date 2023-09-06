local addonName, addon = ...;
local L = LibStub(addon.Libs.AceLocale):NewLocale(addonName, "frFR");
if not L then return end
addon.L = L;

addon.Plugins:LoadLocalization(L);

-- [[ https://legacy.curseforge.com/wow/addons/krowi-achievement-filter/localization ]] --
-- [[ Everything after this line is automatically generated from CurseForge and is not meant for manual edit - SOURCETOKEN - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-09-06 16-56-17 ]] --
L["%c"] = true
L["%d/%m/%Y %I:%M %p"] = true
L["%m/%d/%Y %I:%M %p"] = true
L["%m/%d/%Y %R"] = true
L["%Y/%m/%d %I:%M %p"] = true
L["%Y/%m/%d %R"] = true
L["450 skill"] = "Compétence de 450"
L["525 skill"] = "Compétence de 525"
L["600 skill"] = "Compétence de 600"
L["Academy Ascent"] = "Ascension de l’académie"
L["Account"] = "Compte"
L["Account wide (default)"] = "Compte (standard)"
L["Achievement Calendar"] = "Calendrier des Hauts-faits"
L["Achievement is Completed"] = "Le Haut-fait est terminée"
L["Achievement is Completed Desc"] = "Afficher les critères de réalisation même si le Haut-fait est déjà terminée"
L["Achievement is excluded"] = "La réalisation est masqué"
L["Achievement is watched"] = "La réalisation est suivie"
L["Achievement points earned by"] = "Points de Hauts faits obtenus par"
L["Achievement shown temporarily"] = "Cette réalisation est affichée temporairement car elle ne correspond à aucun des filtres définis."
L["Achievement was Not Earned by Me"] = "La réalisation n'a pas été obtenue par moi"
L["Achievement was Not Earned by Me Desc"] = "Afficher les critères de réalisation si la réalisation n'a pas encore été obtenue par le personnage actuel. Cela permet d'avoir un meilleur contrôle si vous jouez avec plusieurs personnages."
L["Achievement Window"] = "Fenêtre des Hauts-faits"
L["Achievement window height offset"] = "Décalage de la hauteur de la fenêtre de Haut-fait"
L["Achievement window height offset Desc"] = [=[Ajoute ou soustrait de la hauteur à la hauteur par défaut de la fenêtre de Haut-fait.

Cette valeur peut être modifiée pendant que la fenêtre de succès est ouverte et que l'un des onglets ajoutés par {AddonName} est sélectionné. Cela peut avoir un impact sur le jeu.

Les FPS chute pendant l'ajustement de la valeur non PAS pendant l'utilisation normale de l'addon

{reloadRequired}]=]
L["Achievements"] = "Hauts faits"
L["Active events"] = "Évènement en cours"
L["Add Locale"] = "Ajouter des paramètres local"
L["Add Locale Desc"] = "Ajoutez les paramètres de localisation du jeu au {wowheadLink}."
L["Add to / Remove from Watch List"] = "Ajouter ou supprimer de la liste de suivi"
L["Add to Watch List"] = "Ajouter à {watchList}"
L["Adjustable Categories"] = "Catégories ajustables"
L["Aki the Chosen"] = "Aki l'Elue"
L["Already /loved for achievement"] = "Déjà /love pour obtenir le Haut-fait"
L["Already completed for achievement"] = "Déjà terminé(e) {forAchievement}"
L["Already cooked for achievement"] = "Déjà cuisiné pour obtenir le haut fait"
L["Already defeated for achievement"] = "Déjà vaincu pour obtenir le haut fait"
L["Already drank for achievement"] = "Déjà bu pour obtenir le haut fait"
L["Already eaten for achievement"] = "Déjà mangé pour obtenir le haut fait"
L["Already killed for achievement"] = "Déjà tué(e) {forAchievement}"
L["Already petted for achievement"] = "Déjà caressé pour obtenir le haut fait"
L["Alt"] = true
L["Always Show Completed"] = "Toujours montrer les Hauts-faits terminés"
L["Always show realm"] = "Toujours afficher le royaume"
L["Always show realm Desc"] = "Affiche toujours le royaume de votre personnage, que le personnage soit ou non sur le même royaume que ce personnage."
L["Andurs"] = true
L["Apex Canopy River Run"] = "Descente de rapides de la canopée de l'Apogée"
L["Archive Ambit"] = "Domaine des Archives"
L["Are you sure you want to delete character?"] = "Êtes-vous sûr de vouloir supprimer le personnage ?"
L["Assault on Azsuna"] = "L'assaut d'Azsuna"
L["Assault on Drustvar"] = "Assaut de Drustvar"
L["Assault on Highmountain"] = "L'assaut de Haut-roc"
L["Assault on Nazmir"] = "Assaut de Nazmir"
L["Assault on Stormheim"] = "L'assaut de Tornheim"
L["Assault on Stormsong Valley"] = "Assaut de Chantorage"
L["Assault on Tiragarde Sound"] = "Assaut de la Rade de Tiragarde"
L["Assault on Val'sharah"] = "L'assaut de Val'sharah"
L["Assault on Vol'dun"] = "Assaut de Vol'dun"
L["Assault on Zuldazar"] = "Assaut de Zuldazar"
L["Assault: Amathet"] = "Assaut : Avancée amathet"
L["Assault: Aqir"] = "Assaut : Aqir exhumés"
L["Assault: Mantid"] = "Assaut : L'essaim infini"
L["Assault: Mogu"] = "Assaut : La guerre des clans"
L["Assault: N'Zoth (Uldum)"] = "Assaut : L'Empire noir (Uldum)"
L["Assault: N'Zoth (Vale of Eternal Blossoms)"] = "Assaut : L'Empire noir (Val de l'Éternel printemps)"
L["Author"] = "Auteur"
L["Azure Span"] = "Assaut de Fyrakka : Travée d'Azur"
L["Blizzard"] = true
L["BlizzCon"] = true
L["Brackenhide Hollow"] = "Tempête élémentaire : Creux des Fougerobes"
L["Brawler's Guild"] = "Les bastonneur"
L["Brewfest"] = "Fête des Brasseurs"
L["Build"] = "Version"
L["Buildings"] = "Fief"
L["Burning Pandaren Spirit"] = "Esprit pandaren ardent"
L["Bur's Mount Collection"] = "Collection de montures"
L["Button"] = "Bouton"
L["Calendar"] = "Calendrier"
L["Calendar Desc"] = [=[Aspect identique au {calendar} intégré au jeu.

|T:1:8|t- Le nombre de Hauts-faits et de points en haut représente les Hauts-faits et les points gagnés pour le mois actuellement consulté.
|T:1:8|t- Naviguez vers les mois précédents et suivants en cliquant sur les boutons en haut, à côté du mois, ou en utilisant la molette de défilement.
|T:1:8|t- Lorsque vous survolez un jour (par ex. Jour 11), il sera mis en évidence. Les Hauts-faits obtenues ce jour-là s'afficheront dans une nouvelle fenêtre sur le côté. Lorsque vous retirez la souris du jour mis en évidence, la fenêtre sur le côté se fermera ou affichera les réalisations obtenues pour le nouveau jour survolé par la souris.
|T:1:8|t- En cliquant sur un jour, il sera mis en évidence encore plus intensément (par ex. jour 18) et la fenêtre sur le côté restera toujours ouverte. Cela vous permet de cliquer sur un des Hauts-faits accompli précédemment depuis cette nouvelle fenêtre. La sélection d'un jour ne fonctionne que si des Hauts-faits ont été obtenues ce jour-là.
|T:1:8|t- En cliquant sur un jour déjà sélectionné, il sera désélectionné et la fenêtre sur le côté sera déverrouillée, ce qui permettra au jour de se comporter à nouveau comme un jour mis en évidence. Fermer la fenêtre sur le côté en cliquant sur son bouton de fermeture fera la même chose.
|T:1:8|t- Une flèche sur le jour indique que plus de 4 Hauts-faits ont été obtenues ce jour-là.

Options (1)
|T:1:8|t- Lors de l'ouverture ou de la réouverture du calendrier, vous pouvez choisir de toujours sélectionner le dernier mois consulté (actuellement : {lockMonth}) ou seulement lorsque vous cliquez sur une réalisation (actuellement : {lockAchievementMonth}).
|T:1:8|t- Le premier jour de la semaine peut être modifié et est actuellement réglé sur {firstWeekDay}.

(1) Les options se trouvent sous {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {calendar}.]=]
L["Calendar Events"] = "Événements du calendrier"
L["Categories"] = "Catégories"
L["Categories width offset"] = "Largeur des catégories"
L["Categories width offset Desc"] = [=[Ajoute ou soustrait de la largeur à la largeur de catégorie par défaut.

Cette valeur peut être modifiée pendant que la fenêtre de succès est ouverte et que l'un des onglets ajoutés par {AddonName} est sélectionné. Cela peut avoir un impact sur le jeu.

Les FPS chute pendant l'ajustement de la valeur non PAS pendant l'utilisation normale de l'addon

{reloadRequired}]=]
L["Category shown temporarily"] = "Cette catégorie a été sélectionnée en cliquant sur le rappel d'événement {eventName} et est affichée temporairement car elle ne contient aucune réalisation correspondant aux filtres définis."
L["Caverns Criss-Cross"] = "Réseau des grottes"
L["Character / Account wide"] = "Personnage et compte"
L["Character only"] = "Personnage uniquement"
L["Chat messages"] = "Message écrit"
L["Checked"] = "Coché"
L["Children's Week"] = "Semaine des enfants"
L["Class Hall"] = "Dommaine de classe"
L["Clear all"] = "Tout effacer"
L["Clear all Desc"] = "Efface tous les Hauts-faits de la liste de surveillance."
L["Clear search field on Right Click"] = "Effacer le champ de recherche avec le clic droit"
L["Clear search field on Right Click Desc"] = "Activer ou désactiver l'effacement de la zone de recherche lors d'un clic droit dessus."
L["Click here to view in achievement window"] = "Cliquez ici pour afficher dans la fenêtre des Hauts-faits"
L["Click here to view in achievements"] = "Cliquez ici pour afficher dans les Hauts-faits"
L["Cliffside Circuit"] = "Circuit des falaises"
L["Cobalt Assembly"] = "Tempête élémentaire : L'assemblé du Cobalt"
L["Coldheart Interstitia"] = "Interstice Cœur-Algide"
L["Collapse Chain"] = "Masquer les suites de Hauts-faits"
L["Collecting data"] = "Collecte des données..."
L["Collector's Edition"] = "Édition collector"
L["Comments"] = "Commentaire"
L["Community Feast"] = "Festin tribal"
L["Community Feast: Active"] = "Festin tribal : En cours"
L["Community Feast: Cooking"] = "Festin tribal : En cours"
L["Community Feast: Ready"] = "Festin tribal : Prêt"
L["Community Feast: Soon"] = "Festin tribal : Bientôt"
L["Community Feast: Starting Soon"] = "Festin tribal : Bientôt"
L["Compact"] = "Afficher les pop-ups d'évènements compactes"
L["Compact Achievements"] = "Hauts-faits compact"
L["Compact Achievements Desc"] = "L'affichage des Hauts-faits est réduit aux 2/3 de sa taille d'origine, à l'identique des résumé de Hauts-faits."
L["Compact Achievements T Desc"] = [=[- Les Hauts-faits font 2/3 de la taille normal. Ils s'affichent de la même manière que les Hauts-faits récapitulatifs.
- Il est possible d'afficher soit la première ligne de la description, soit la récompense.

Les Hauts-faits compacts peuvent être activées à partir des options (actuellement : {compactEnabled}) (1). 

(1) Les options peuvent être trouvées sous {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}]=]
L["Compact Desc"] = [=[Utiliser une version plus compacte avec une seule ligne d'affichage de l'heure.

{reloadRequired}]=]
L["Completion"] = "Terminé"
L["Covenant"] = "Congrégation"
L["Covenant Assaults"] = "Assauts de congrégations"
L["Credits"] = "Crédits"
L["Criteria"] = "Critères"
L["Criteria Behaviour"] = "Comportement des critères."
L["Criteria Behaviour Desc"] = [=[Définit la façon dont un critère avec un texte trop long sera géré.

|T:1:8|t- {overflow} : Le texte sera affiché normalement, mais risque de déborder. Cela peut entraîner un chevauchement des textes.
|T:1:8|t- {truncate} : Le texte sera tronqué et affichera '...' à la fin.
|T:1:8|t- {flexible} : Les critères avec un texte trop long seront placés sur une nouvelle ligne. Les autres critères seront affichés en deux colonnes.]=]
L["Criteria is Completed"] = "Le critère est terminé"
L["Criteria is Completed Desc"] = "Afficher les critères de réalisation même si le critère de réalisation est déjà terminé"
L["Criteria of"] = "Critère de"
L["Cross-Expansion"] = "Cross-Extention"
L["Ctrl"] = true
L["Current Zone"] = "Zone Actuelle"
L["CurseForge"] = true
L["CurseForge Desc"] = "Ouvre une fenêtre avec un lien vers la page {addonName} {curseForge}."
L["Custom"] = "Personnalisation"
L["Darkmoon Faire"] = "Foire de Sombrelune"
L["Data Manager"] = "Gestionnaire de données"
L["Date and Time format"] = "Format de date et d'heure"
L["Date and Time formatting guide"] = "Guide de formatage de la date et de l'heure"
L["Date and Time formatting guide Desc"] = [=[{a} - Nom abrégé du jour de la semaine (ex. Mer)
{A} - Nom complet du jour de la semaine (ex. Mercredi)
{b} - Nom abrégé du mois (ex. Sep)
{B} - Nom complet du mois ( par exemple, septembre)
{c} - Représentation de la date et de l'heure appropriée pour les paramètres régionaux (par exemple, 23/04/07 10:20:41)
{C} - Le numéro du siècle (année/100) (par exemple, 20) 
{d} - Jour du mois sous forme de nombre décimal (01 - 31)
{D} - Équivalent à %m/%d/%y (par ex. 23/04/07)
{e} - Jour du mois sous forme de nombre décimal (1 - 31)
{H} - Heure au format 24 heures (00 - 23)
{I} - Heure au format 12 heures (01 - 12)
{j} - Jour de l'année sous forme de nombre décimal (001 - 366)
{k} - Heure au format 24 heures (0 - 23)
{l} - Heure au format 12 heures (1 - 12)
{m} - Mois sous forme de nombre décimal (01 - 12)
{M} - Minute sous forme de nombre décimal (00-59)
{p} - A.M./P.M. indicateur pour l'horloge de 12 heures (par ex. AM/PM)
{P} - A.M./P.M. des paramètres régionaux actuels. indicateur pour l'horloge de 12 heures (par exemple, am/pm)
{R} - Équivalent à %H :%M (par exemple, 10:20)
{s} - Nombre de secondes depuis Epoch, c'est-à-dire depuis 1970- 01-01 00:00:00 UTC (1177323641)
{S} - Seconde sous forme de nombre décimal (00 - 59)
{u} - Jour de la semaine sous forme de nombre décimal (1 - 7 ; le lundi est 1)
{U } - Semaine de l'année sous forme de nombre décimal, avec dimanche comme premier jour de la semaine 1 (00 - 53)
{w} - Jour de la semaine sous forme de nombre décimal (0 - 6 ; le dimanche est 0)
{W} - Semaine de l'année sous forme de nombre décimal, avec lundi comme premier jour de la semaine 1 (00 - 53)
{x} - Représentation de la date pour les paramètres régionaux actuels (chaîne de date standard)
{X} - Représentation de l'heure pour les paramètres régionaux actuels (chaîne d'heure standard)
{y} - Année sans siècle, sous forme de nombre décimal (00 - 99) (par exemple, 07)
{Y} - Année avec siècle, sous forme de nombre décimal (par exemple, 2007)
{z} - Fuseau horaire sous forme de décalage horaire par rapport à GMT (par exemple +0200)
{Z} - Nom ou abréviation du fuseau horaire ; aucun caractère si le fuseau horaire est inconnu]=]
L["Day of the Dead"] = "Jour des morts"
L["Debug"] = "Débug"
L["Debug Desc"] = "Chacune des options répertoriées ci-dessous est disponible à des fins de débogage et de test. À utiliser à vos risques et périls !"
L["Default value"] = "Valeur par défaut"
L["Deselect All"] = "Désélectionner tout"
L["DF - Community Feast"] = "Festin tribal"
L["DF - Firestorms"] = "Tempête élémentaire de feu"
L["DF - Fyrakk Assault"] = "Assaut de Fyrakka"
L["DF - Grand Hunts"] = "Grandes chasses"
L["DF - Researchers Under Fire"] = "Des chercheurs sous le feu"
L["DF - Sandstorms"] = "Tempête élémentaire de sable"
L["DF - Siege on Dragonbane Keep"] = "Siège du donjon du Fléau-des-Dragons"
L["DF - Snowstorms"] = "Tempête élémentaire de neige"
L["DF - Thunderstorms"] = "Tempête élémentaire de foudre"
L["Diablo III"] = true
L["Diablo IV"] = true
L["Discord"] = true
L["Discord Desc"] = "Ouvre une fenêtre avec un lien vers le serveur Discord {serverName}. Sur ce serveur vous pourrez poster des commentaires, des rapports, des remarques, des idées et toute autre chose."
L["Donations"] = "Donation"
L["Dos-Ryga"] = true
L["Down"] = "Bas"
L["Dragon Glyphs"] = "Dracoglyphes"
L["Dragon Racing"] = "Course à dos de dragon"
L["Dragonbane Keep"] = "Tempête élémentaire : Fléau-des-Dragons"
L["Dragonflight"] = true
L["Dragonflight Pre-patch"] = "Prépatch"
L["Dragonflight pre-patch - Firestorms"] = "Évenement avant Dragonflight : Tempête de feu"
L["Dragonflight pre-patch - Sandstorms"] = "Évenement avant Dragonflight : Tempête de sable"
L["Dragonflight pre-patch - Snowstorms"] = "Évenement avant Dragonflight : Tempête de neige"
L["Dragonflight pre-patch - Thunderstorms"] = "Évenement avant Dragonflight : Tempête de foudre"
L["Dragonriding"] = "Vol à dos de dragon"
L["Drops"] = "Butin"
L["Dueler's Guild"] = "La Guilde des dueliste"
L["during"] = "pendant"
L["Earned By"] = "Obtenu par"
L["Earned By Desc"] = [=[Nombre de point de Hauts-faits total (En-tête de la fenêtre)
|T:1:8|t- {achievementPointsEarnedBy} : Affiche les {achievementPointsEarnedBy_wc} votre personnage actuel et/ou les {achievementPointsEarnedBy_wc} de votre compte (actuellement : {achievementPointsEarnedByFormat}) (1).
|T:1:8|t- {tooltip} : Affiche les points de Haut-faits gagné par vos personnage. Chaque personnage doit être connecté au moins une fois pour être ajouté à cette liste. Il est possible d'afficher le royaume du personnage s'il est différent. Il est possible de forcer pour toujours afficher le royaume (1).

Filtres
|T:1:8|t- {account} : les Hauts-faits sont en vert s'ils sont obtenus sur n'importe quel personnage de votre compte.
|T:1:8|t- {character} : Les Hauts-faits sont en vert s'ils sont gagnés par votre personnage actuel et en blanc s'ils sont gagnés sur un autre personnage de votre compte.

Info-bulle
|T:1:8|t- {earnedBy} : affiche {earnedByNumber} personnages qui ont gagné ce Haut-fait (2). Les Hauts-faits exclusif à la faction avec un Haut-fait similaire pour la Horde sont prises en compte. C'est à dire que si un personnage de l'Alliance avance sur un Haut-fait que la Horde ne peux pas faire mais où il existe un Haut-fait similaire pour la Horde alors celui-ci respectera les même règles de validation. Les personnages de l'alliance peuvent apparaître pour les Hauts-faits de la horde. le royaume du personnage sera affiché s'il est différent. Il est possible de forcer pour toujours afficher le royaume (2).
|T:1:8|t- {notEarnedBy} : affiche les personnages {notEarnedByNumber} qui n'ont pas encore obtenu ce Haut-fait (2). Les Hauts-faits exclusif à la faction avec un Haut-fait similaire sont prises en compte. C'est à dire que si un personnage de l'Alliance avance sur un Haut-fait que la Horde ne peux pas faire mais où il existe un Haut-fait similaire pour la Horde alors celui-ci respectera les même règles de validation. Les personnages de l'alliance peuvent apparaître pour les Hauts-faits de la horde. le royaume du personnage sera affiché s'il est différent. Il est possible de forcer pour toujours afficher le royaume (2).

(1) Les options peuvent être trouvées sous {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {header}
(2) Les options se trouvent sous {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}]=]
L["Emberflow Flight"] = "Vol de Ruisse-Braise"
L["Emerald Garden Ascent"] = "Ascension des jardins d’Émeraude"
L["Enable"] = "Activé"
L["Enable debug info"] = "Activer les informations de débogage"
L["Enable debug info Desc"] = "Activer ou désactiver les informations de débogage"
L["Enable Desc"] = "Active ou désactive le plugin. Si le plugin est désactivé ici MAIS que l'addon est actif, des choses imprévisibles peuvent se produire."
L["Enable trace info"] = "Activer les informations de suivi"
L["Enable trace info Desc"] = "Activer ou désactiver les informations de suivi"
L["End Time"] = "Heure de fin"
L["Enhanced filtering and sorting"] = "Filtre et tri avancés"
L["Enhanced filtering and sorting Desc"] = [=[Les fonctions suivantes ont été ajoutées au filtrage et au tri des Hauts-faits.

Catégories :
|T:1:8|t- {mergeSmallCategories} : fusionne les catégories si cela est possible avec moins de {mergeSmallCategoriesNumber} Hauts-faits (1).

Filtrage (plusieurs filtres peuvent être sélectionnés en même temps) :
|T:1:8|t- {completed} : affiche les Hauts-faits terminés.
|T:1:8|t- {notCompleted} : affiche les Hauts-faits non terminés.
|T:1:8|t- {obtainable} : affiche les Hauts-faits accessibles. 
|T:1:8|t- {notObtainable} : Afficher les Hauts-faits impossibles à obtenir.
|T:1:8|t- {faction} ({resetFactionFilters} {resetFactionFiltersEnabled}) (2)
|T:1:8|t- {neutral} : Affiche les Hauts-faits qui peuvent être achevé par {alliance_wc} et par la {horde_wc}.
|T:1:8|t|T:1:8|t- {alliance} : affiche les Hauts-faits qui ne peuvent être achevés qu'auprès de l'{alliance_wc}.
|T:1:8|t|T:1:8|t- {horde} : affiche les Hauts-faits qui ne peuvent être achevés qu'auprès de la {horde_wc}.
|T:1:8|t- {excluded} : affiche les succès exclus.
|T:1:8|t- {collapseChain} : affiche uniquement le dernier succès terminé et le premier succès inachevé d'une série.

Tri :
|T:1:8|t- {noSorting} : aucun tri appliqué.
|T:1:8|t- {sortByName} : tri les Hauts-faits en fonction de leur nom.
|T:1:8|t- {sortByCompletion} : tri les Hauts-faits en fonction de si ils sont terminées ou non.
|T:1:8|t - {sortByID} : trie les Hauts-faits par leur ID.
|T:1:8|t- {reverseSort} : Si sélectionné, l'ordre de trie des Hauts-faits sera inversé.

{tabs} :
|T:1:8|t- Il est possible d'appliquer l'un des système de tries et de filtre indépendamment de chaque onglet et ce de la même manière que défini précédemment.
|T:1:8|t- La modification de l'un des filtres ou trie généraux annulera les fonctionnalités de filtrage et de tri de chaque onglet. 

{specialCategories} :
|T:1:8|t- ces catégories ont toutes les fonctionnalités de filtrage et de tri mentionnées ci-dessus et peuvent être modifiées indépendamment des autres.

{earnedBy} (voir {earnedByTutorial} pour plus de détails)
|T:1:8|t- {account} : la réalisation des Hauts-faits est comptées lorsqu'ils sont réalisées sur n'importe quel personnage de votre compte : les Hauts-faits sont comptées lorsqu'ils sont réalisées sur le personnage actuel et ils sont partiellement comptées lorsqu'ils sont réalisées sur un autre personnage du compte, mais pas avec le personnage actuel.

Autre :
|T:1:8|t- {help} : lance le didacticiel depuis le début et réinitialise ce qui à déjà été consulté.
|T:1:8|t|T:1:8|t- affiche la page spéciale du didacticiel, sans ce qui à déjà été consulté 
|T:1:8|t- {options} : ouvre les options de l'addon (2).

Plus d'options de filtrage et de tri peuvent être réclamé sur {discord} ou {curseForge} (liens dans les options).

(1) Vous pouvez trouver les options sous {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}
(2) les option peuvent être trouvé sous {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName}]=]
L["Enhanced tooltip"] = "Info-bulle améliorée"
L["Enhanced tooltip Achievements Desc"] = [=[Chaque info-bulle sur les Hauts-faits contiennent des informations supplémentaires sur la façon dont les réalisations sont liées les unes aux autres. Plusieurs nouvelles sections y sont ajoutées.

Fonctionnalités :
|T:1:8|t- {notObtainable} : affiche le texte '{noLongerObtainable}' si le succès n'est plus disponible.
|T:1:8|t- {earnedBy} : voir {earnedBy} pour plus d'informations.
|T:1:8|t- {partOfAChain} : affiche la liste des Hauts-faits dont le Haut-fait survolée fait partie (1) ({partOfAChainEnabled}) (2).
|T:1:8|t- {requiredFor} : affiche la liste des Hauts-faits qui sont nécéssaire pour que le Haut-fait survolée soit complétée (1) (actuellement : {requiredForEnabled}) (2).
|T:1:8|t- {otherFaction} : affiche le Haut-fait associée de l'autre faction (actuellement : {otherFactionEnabled}) (2 ).
|T:1:8|t- {objectivesProgress} : affiche la liste des objectifs avec progression (actuellement : {objectivesProgressEnabled}) (2).
|T:1:8|t|T:1:8|t- Objectifs personnalisés : certains Haut-faits ont des objectifs personnalisés, comme les succès de transmogrification indiquant votre progression vers les ensembles de transmogrification associés.

Icônes :
|T:1:8|t- {ready} : le Haut-fait est terminé.
|T:1:8|t- {waiting} : le Haut-fait n'est pas terminé.
|T:1:8|t- {notready} : le Haut-fait n'est plus disponible.

Couleurs :
|T:1:8|t- {vert} : la Haut-fait/l'objectif est terminé.
|T:1:8|t- {gris} : le Haut-fait/l'objectif n'est pas terminé.
|T:1:8|t- {red} : le Haut-fait n'est plus disponible.
|T:1:8|t- les couleurs pâles {lightGreen}, {lightGrey} ou {lightRed} : le Haut-fait est ignoré.

D'autres objectifs personnalisés peuvent être demandés sur {discord} ou {curseForge} (liens dans les options).

(1) Il est possible d'afficher deux icônes par ligne. La première icône est celle par défaut, la seconde est pour le personnage actuel (actuellement : {currentCharacterIconEnabled}) (2).
(2) Les options peuvent être trouvées sous {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}]=]
L["Enhanced tooltip Categories Desc"] = [=[Chaque info-bulle sur les catégories contienent des informations supplémentaires sur le nombre de succès réalisable & non réalisable ainsi que les Haut-faits terminés & non-terminés.

Les nombres dans la barre de progression sont au format suivant :
|T:1:8|tOC (+NONC) / T
|T:1:8|t|T:1:8|t- {oc} : les Hauts-faits terminées réalisable & non réalisable.
|T:1:8|t|T:1:8|t- {nonc} : les Hauts-faits non terminées et non réalisable (1).
|T:1:8|t|T:1:8|t- T : le nombre total de Hauts-faits dans cette catégorie.

Couleurs :
|T:1:8|t- {green} : les Hauts-faits terminées réalisable & non réalisable.
|T:1:8|t- {red} : les Hauts-faits non réalisables et non terminées (1).
|T:1:8|t- Vide : les Hauts-faits réalisables qui n'ont pas été terminées.

La partie {red} de la barre de progression et le nombre entre parenthèses peuvent être désactivés dans les options (actuellement : {showNotObtainable}) (1) ou en décochant le filtre {notObtainable}.

(1) Options peut être trouvé sous {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}]=]
L["Error Tabs Order"] = "Erreur dans l'ordre des onglets."
L["Event Reminder"] = "Rappel d'événement"
L["Event Reminder Desc"] = [=[Les {events} sont ajoutés au nouvel onglet {events} et un rappel apparaît (max. {numPopUps} en même temps) lorsqu'un des événements est actif (actuellement : {popUpEnabled}) (1).

Le rappel d'événement affiche le nom de l'événement ainsi que l'heure (heure de fin de l'événement) (1).
Le format d'affichage de l'heure peut être sélectionné parmi des préréglages ou peut-être défini par l'utilisateur (1).
 Une version compacte avec une seule ligne pour l'affichage de l'heure {compactEnabled} est disponible (1). 

Cliquer sur l'alerte ouvre la catégorie avec les Haut-faits disponibles pendant que l'événement est actif.
Il disparaît lors d'un clic droit ou après {eventAlertFadeDelay} secondes s'il est ignoré (1). 

Le rappel peut également être vu sur le côté droit de la fenêtre des Hauts-faits.

Types d'événements :
|T:1:8|t- Événements du calendrier (par exemple : Les fête saisonnières).
|T:1:8|t- Événements d'activités ponctuelle (par exemple : La grande chasse).
|T:1:8|t- Événements mondiaux (par exemple, les Assauts).

(1) Voir {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {eventReminders} pour les options.]=]
L["Event Reminders"] = "Rappels d'événements"
L["Events"] = "Évènements"
L["Exclude"] = "Masquer"
L["Exclude Excluded achievements"] = "Exclure les Hauts-faits masqué"
L["Exclude Excluded achievements Desc"] = "Excluez les Hauts-faits masqué des résultats de la recherche ou incluez-les dans les résultats de la recherche."
L["Excluded"] = "Masqué"
L["Expansions"] = "Extensions"
L["Expansions tab"] = "Onglet extention"
L["Expansions tab Desc"] = [=[Les succès sont regroupés par extension avec une hiérarchie plus logique.

La hiérarchie est la suivante : 
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

Catégories spéciales : 
|T:1:8|t- {currentZone} : affiche les Hauts-faits associés à la zone actuelle dans laquelle vous vous trouvez 
|T:1:8|t - {selectedZone} : Affiche les réalisations associées à la zone sélectionnée sur la carte du monde.
|T:1:8|t- {watchListCategory} : Affiche les réalisations qui sont sur votre liste de surveillance. Les Hauts-faits peuvent être affichées avec ou sans leurs sous-catégories (1).
|T:1:8|t- {excludedCategory} : affiche les Haut-faits exclues. Les Hauts-faits peuvent être affichées avec ou sans leurs sous-catégories (1). Peut être masqué de manière permanente dans les options (1).

(1) Vous pouvez trouver les options sous {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}]=]
L["Export Criteria"] = "Exporter les critères"
L["Export Criteria Desc"] = "Exporte les critères du Haut-fait vers les variables enregistrées. Cela est utilisé pour ajouter du nouveau contenu."
L["Faction Assaults"] = "Assauts de faction"
L["Fade delay"] = "Délai de fondu"
L["Fade delay Desc"] = "Temps en secondes pour que la pop-ups d'évènements disparaisse. Un clic droit dessus la fermera immédiatement."
L["Fated Raids"] = "Raids fatidiques"
L["Fated Raids: Castle Nathria"] = "Raids fatidique : Château Nathria"
L["Fated Raids: Castle Nathria (CN)"] = "Raids fatidiques : Château Nathria (CN)"
L["Fated Raids: Castle Nathria (EU)"] = "Raids fatidiques : Château Nathria (EU)"
L["Fated Raids: Castle Nathria (US)"] = "Raids fatidiques : Château Nathria (US)"
L["Fated Raids: Sanctum of Domination"] = "Raids fatidique : Sanctum de la Domination"
L["Fated Raids: Sanctum of Domination (CN)"] = "Raids fatidiques : Sanctum de la Domination (CN)"
L["Fated Raids: Sanctum of Domination (EU)"] = "Raids fatidiques : Sanctum de la Domination (EU)"
L["Fated Raids: Sanctum of Domination (US)"] = "Raids fatidiques : Sanctum de la Domination (US)"
L["Fated Raids: Sepulcher of the First Ones"] = "Raids fatidique : Sépulcre des Fondateurs"
L["Fated Raids: Sepulcher of the First Ones (CN)"] = "Raids fatidiques : Sépulcre des Fondateurs(CN)"
L["Fated Raids: Sepulcher of the First Ones (EU)"] = "Raids fatidiques : Sépulcre des Fondateurs (EU)"
L["Fated Raids: Sepulcher of the First Ones (US)"] = "Raids fatidiques : Sépulcre des Fondateurs (US)"
L["Feast of Winter Veil"] = "Voile d'hiver"
L["Fen Flythrough"] = "Traversée des marais"
L["Filters"] = "Filtre"
L["First day of the week"] = "Premier jour de la semaine"
L["First day of the week Desc"] = "Le premier jour de la semaine que le calendrier doit utiliser."
L["FixTabs"] = [=[Tous les onglets s'affichent à nouveau. Cela était nécessaire pour mettre en œuvre la nouvelle fonctionnalité de tri par onglets.
Désolé pour le désagrément.]=]
L["Flashfrost Flyover"] = "Survol de givréclair"
L["Flexible"] = true
L["Flowing Pandaren Spirit"] = "Esprit pandaren fluide"
L["for achievement"] = "pour le haut fait"
L["Force two columns"] = "Forcer deux colonnes."
L["Force two columns Desc"] = "Activer ou désactiver l'algorithme pour forcer l'affichage en deux colonnes des objectifs des réalisations. Lorsque cette option est activée, si seulement une colonne d'objectifs devait être affichée en raison de la longueur du texte d'un ou plusieurs objectifs, une deuxième colonne sera forcée en fonction des autres paramètres."
L["Force two columns threshold"] = "Limite pour forcer deux colonnes."
L["Force two columns threshold Desc"] = "Le nombre de critères que la réalisation doit avoir avant de forcer l'affichage en deux colonnes si normalement un seul serait affiché."
L["Format"] = true
L["Fracture Chambers"] = "hambres aux Fractures"
L["from"] = "de"
L["from the start of"] = "depuis le début de"
L["Full Search"] = "Recherche complète"
L["Full Search Desc"] = "En sélectionnant \"{showAllResults}\", vous pouvez afficher tous les résultats de la recherche. Voir le tutoriel {quickSearchTutorial} pour plus de détails."
L["Fyrakk Assault"] = "Assaut de Fyrakka"
L["Garden Gallivant"] = "Promenade des jardins"
L["Gifts"] = "Cadeaux"
L["Gladiator's Sanctum"] = "Sanctum du Gladiateur"
L["Glory"] = "Gloire"
L["Go to"] = "Aller à"
L["Going away with"] = "Temporaires"
L["Gorespine"] = "Tripépine"
L["Grand Hunts: Ohn'ahran Plains"] = "Grandes chasses : Ohn'ahra"
L["Grand Hunts: Thaldraszus"] = "Grandes chasses : Thaldraszus"
L["Grand Hunts: The Azure Span"] = "Grandes chasses : Travée d'Azur"
L["Grand Hunts: The Waking Shore"] = "Grandes chasses : Rivage de l'éveil"
L["Green"] = "Vert"
L["Grey"] = "Gris"
L["Greyhoof"] = "Sabot-Gris"
L["Grow direction"] = "Sens de l'annimation des rappel"
L["Grow direction Desc"] = "La direction dans laquelle les nouveaux rappels seront ajoutés"
L["Guides"] = "Guide"
L["Hallow's End"] = "Sansaint"
L["Header"] = "En-tête"
L["Header tooltip"] = "En-tête de l'infobulle"
L["Hearthstone"] = true
L["Heroes of the Storm"] = true
L["Hide Date Completed"] = "Masquer la date de réalisation"
L["Hide Date Completed Desc"] = "Masquer la date à laquelle le Haut-fait a été terminé"
L["Hide Not Earned By if current character earned the achievement"] = "Masquer \"Non obtenu par\" si le personnage actuel a obtenu le Haut-fait"
L["Hide Not Earned By if current character earned the achievement Desc"] = "Masquer la section {notEarnedBy} si le personnage actuel a obtenu le Haut-fait. La section {earnedBy} sera toujours affichée normalement."
L["Holidays"] = "Fêtes saisonnières"
L["Icon Left click"] = "pour ouvrir la fenêtre \"Hauts-faits\"."
L["Icon Right click"] = "pour les options."
L["ID"] = true
L["Ignore"] = "Ignorer"
L["Ignore Filters"] = "Ignorer le filtre"
L["Ignore Filters Desc"] = "Ignorer tous les filtres et afficher toutes les Hauts-faits dans la catégorie {category}"
L["Imbu"] = "Tempête élémentaire : Imbou"
L["in"] = "dans"
L["In instances"] = "Dans les instances"
L["Include"] = "Afficher"
L["Include all"] = "Tout inclure"
L["Include all Desc"] = "Inclure tous les Hauts-faits exclues."
L["Indentation"] = "Indentation."
L["Indentation Desc"] = "La taille de l'indentation des sous-catégories."
L["Invasions"] = "Invasion de la Légion"
L["is"] = "est"
L["Iskaara Flyover"] = "Tour d’Iskaara, avancé"
L["Kafi"] = true
L["Kalimdor Cup"] = "Course de Kalimdor"
L["Ka'wi the Gorger"] = "Ka'wi le Goinfre"
L["Keep current character"] = "Garder le personnage actuel."
L["Keep current character Desc"] = "Garder le personnage actuel dans la liste des personnages de l'infobulle, indépendamment de la possibilité que le personnage soit tronqué de la liste par le {maxNumChar} ou non."
L["Keybindings Desc"] = "Pour modifier les raccourcis clavier pour {addonName}, sélectionnez l'onglet Jeu en haut à gauche de cette fenêtre. Ensuite, sélectionnez la catégorie {keybindings} dans le volet de gauche. Enfin, sélectionnez AddOns dans la vue de droite."
L["Kyrian Assault"] = "L'assaut des Kyrians"
L["Layout"] = "Calque"
L["Left"] = "Gauche"
L["Left Alt"] = "Alt gauche"
L["Left click"] = "Clic gauche"
L["Left Ctrl"] = "Ctrl gauche"
L["Left Shift"] = "Shitft gauche"
L["Legion Assaults"] = "Assauts de la Légion"
L["Level 80"] = "Niveau 80"
L["Level 85"] = "Niveau 85"
L["Level 90"] = "NIveau 90"
L["Leveling"] = "Monté de niveau"
L["Line"] = "Doubler"
L["Load Tracking Achievements"] = "Charger les Hauts-faits suivies"
L["Load Tracking Achievements Desc"] = "Charger les réalisations suivies (Description)."
L["Loaded"] = "Chargé"
L["Loaded Desc"] = "Indique si l'addon associé au plugin est chargé ou non."
L["Localizations"] = "Traductions"
L["Location"] = "Lieu"
L["Lock month"] = "Verrouiller le mois"
L["Lock month Desc"] = "Garder le dernier mois affiché comme mois à afficher lorsque le calendrier est rouvert après avoir été fermé."
L["Lock month when closed by achievement"] = "Verrouiller le mois lorsqu'il est fermé par un Haut-fait"
L["Lock month when closed by achievement Desc"] = "Garder le dernier mois affiché comme mois à afficher lorsque le calendrier est rouvert après avoir été fermé en cliquant sur une réalisation sur le côté."
L["Login Delay"] = "Délais"
L["Love is in the Air"] = "De l'amour dans l'air"
L["Lucky Yi"] = "Yi la Chance"
L["Lunar Festival"] = "Fête lunaire"
L["M+ Season"] = "Saison des donjons mythiques+ (M+)"
L["Make windows movable"] = "Rendre la fenêtre déplaçable"
L["Make windows movable Desc"] = [=[Rend la fenêtre des Hauts-faits, la vue du calendrier et la fiche personnages mobiles ou immobiles.

Si cette option est activée, la fenêtre correspondante sera déplacée lorsque le bouton gauche de la souris sera enfoncé. Ceci s'applique à l'en-tête et aux marges.]=]
L["Mantid"] = "Mantide"
L["Maruukai Dash"] = "Marathon de Maruukaï"
L["Max number of alerts"] = "Nombre maximal de pop-ups d'événement"
L["Max number of alerts Desc"] = "Nombre maximum de pop-ups d'événement affichées en même temps."
L["Maximum number of characters"] = "Nombre maximum de personnages"
L["Maximum number of characters Desc"] = "Le nombre maximum de personnages à afficher dans l'infobulle"
L["Merge Small Categories"] = "Fusionner les catégories mineures"
L["Merge small categories threshold"] = "Limite à laquelle les sous catégiories vont se fusionner."
L["Merge small categories threshold Desc"] = [=[Les catégories avec un nombre de Haut-fait inférieur à ce nombre seront fusionnées avec la catégorie parent.

Seules les catégories prédéfinies peuvent être fusionnées (principalement les catégories dépendant des zones). Cela peut avoir un impact sur le jeu.

Les FPS chute pendant l'ajustement de la valeur non PAS pendant l'utilisation normale de l'addon

{reloadRequired}]=]
L["Micro Button"] = "Micro bouton"
L["Midsummer Fire Festival"] = "Fête du Feu du solstice d'été"
L["Minimum characters to search"] = "Nombre minimum de caractères à rechercher"
L["Minimum characters to search Desc"] = [=[Le nombre de caractères nécessaires pour lancer la recherche des Hauts-faits qui correspondent à la requête. Plus le nombre est petit (1), plus l'impact sur le jeu est important.

(1) Chutes de FPS lors de la recherche]=]
L["Mirror of the Sky Dash"] = "Marathon du miroir céleste"
L["Modifiers"] = "Modificateurs"
L["Mogu"] = true
L["More"] = "Plus"
L["Mort'regar"] = true
L["Most progress"] = "Le plus de progression"
L["Mouse Wheel Scroll Speed"] = "Vitesse de défilement de la souris avec la molette."
L["Mouse Wheel Scroll Speed Desc"] = "Définit le nombre d'{items} qui seront défilés lorsque vous cliquez sur les boutons haut et bas de la barre de défilement ou lors de l'utilisation de la molette de la souris"
L["Movable"] = "Déplaçable"
L["Necrolord Assault"] = "L'assaut des Nécro-seigneurs"
L["Necrolords Assault"] = "L'assaut des Nécro-seigneurs"
L["Needs /love for achievement"] = "Requiert /love pour obtenir le Haut-fait"
L["Needs to be completed for achievement"] = "Doit être terminé {forAchievement}"
L["Needs to be cooked for achievement"] = "Doit être cuisiné pour obtenir le Haut-fait"
L["Needs to be defeated for achievement"] = "Doit être vaincu pour obtenir le haut fait"
L["Needs to be drunk for achievement"] = "Doit être bu pour obtenir le haut fait"
L["Needs to be eaten for achievement"] = "Doit être mangé pour obtenir le haut fait"
L["Needs to be killed for achievement"] = "Doit être tué pour obtenir le Haut-fait"
L["Needs to be petted for achievement"] = "Doit être caressé pour obtenir le haut fait"
L["never obtainable"] = "jamais obtenable"
L["New Achievement Colors"] = "Nouvelles couleurs de Hauts-faits"
L["New Achievement Colors Desc"] = [=[La couleur de bordure d'un Haut-fait accompli est à présent doré.
- La couleur d'un Haut-fait obtenu alors qu'il n'est plus obtenante est à présent rouge.
- La couleur d'un Haut-fait non obtenu et non obtenable est à présent grise.
- La couleur d'un Haut-fait obtenu à l'échelle du compte est à présent bleu.]=]
L["New achievement window tabs"] = "Nouveaux onglets pour la fenêtre des Hauts-faits"
L["New achievement window tabs Desc"] = [=[De nouveaux onglets sont ajoutés à la fenêtre des Hauts-faits.
Cela offre une nouvelle façon d'afficher les Hauts-faits d'une manière plus familière sans affecter les onglets par défaut.

Onglets :
|T:1:8|t- {achievements} : Une copie de l'onglet par défaut {achievements} mais avec toutes les nouvelles fonctionnalités ajoutées par {addonName_y}.
|T:1:8|t- {expansions} : Les Hauts-faits sont regroupés en catégories par extension avec une hiérarchie plus logique. Consultez le tutoriel {expansionsTabTutorial} pour plus de détails.
|T:1:8|t- {events} : Les Hauts-faits sont regroupés en catégories par événement. Cela va des événements saisonniers aux événements mondiaux comme les assauts.
|T:1:8|t- {pvp} : Les Hauts-faits sont regroupés en catégories par champ de bataille.
|T:1:8|t- {specials} : Ces catégories sont des collections de succès qui incluent des montures, des titres, des transmogrifications et d'autres qui ne se placent pas vraiment ailleurs.

Dans les options, les onglets par défaut et les onglets ajoutés par {addonName_y} peuvent être masqués (1).
{pluginText}
(1) Vous pouvez trouver l'options sous {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {tabs}]=]
L["News"] = "Nouveaux"
L["Night Fae Assault"] = "L'assaut des Faë nocturnes"
L["Nitun"] = true
L["No achievements are available with the current set of filters"] = "Aucune Haut-fait n'est disponible avec l'ensemble de filtres actuel"
L["No time data available"] = "Aucune donnée de temp disponible"
L["Noblegarden"] = "Jardin noble"
L["Nokhudon Hold"] = "Tempête élémentaire : Bastion Nokhudon"
L["NONC"] = true
L["None"] = "Aucun"
L["No-No"] = true
L["Not Earned By"] = "Non réalisé par"
L["Not earned by:"] = "Non obtenu par:"
L["Not loaded"] = "Non chargé"
L["Not Obtainable"] = "Non obtenable"
L["Not part of set"] = "Ne fait pas parti de l'ensemble d'armure"
L["Number of Earned By characters"] = "Nombre de personnage ayant accompli le Haut-fait"
L["Number of Earned By characters Desc"] = [=[Le nombre de personnages ayant obtenu le Haut-fait sera affiché.

 Si vous définissez ce paramètre sur 0, cette fonctionnalité sera désactivée.]=]
L["Number of Most progress characters"] = "Nombre de personnages ayant le plus de progression"
L["Number of Most progress characters Desc"] = [=[Le nombre de personnages qui seront affichés et qui ont une progression sur le Haut-fait

Le paramétrer à 0 désactivera cette fonctionnalité.]=]
L["Number of Not Earned By characters"] = "Nombre de personnage n'ayant pas accompli le Haut-fait"
L["Number of Not Earned By characters Desc"] = [=[Le nombre de personnages n'ayant pas obtenu le Haut-fait sera affiché.

 Si vous définissez ce paramètre sur 0, cette fonctionnalité sera désactivée.]=]
L["Number of search previews"] = "Nombre d'aperçus de recherche"
L["Number of search previews Desc"] = "Le nombre de Haut-fait qui seront prévisualisées dans la liste pendant la recherche"
L["Number of summary achievements"] = "Résumé du nombre de Hauts-faits"
L["Number of summary achievements Desc"] = "Nombre de Hauts-faits qui seront affichées dans la vue récapitulative de chaque onglet."
L["N'Zoth Assaults"] = "Assauts de N'Zoth"
L["Objectives"] = "Objectifs."
L["Objectives progress"] = "Progression"
L["Obtainable"] = "Obtenable"
L["OC"] = true
L["Offsets"] = "Décalages"
L["Ohn'ahran Plains"] = "Assaut de Fyrakka : Ohn'ahran"
L["Ohn'iri Springs"] = "Tempête élémentaire : Sources des Ohn'irs"
L["On Event Start"] = "Au démarrage de l'événement"
L["On Login"] = "À la connection"
L["On Reload"] = "À la recharge de l'interface"
L["only obtainable by one player"] = "seulement obtenable par un joueur"
L["Only search filtered achievements"] = "Rechercher uniquement Les Haut-faits filtrées"
L["Only search filtered achievements Desc"] = "Ne recherchez que Les Hauts-faits visibles avec les filtres définis."
L["Only when time data is available"] = "Uniquement lorsque les données de temps sont disponibles"
L["Open"] = "Ouvert"
L["Order"] = "Ordre des onglets"
L["Other"] = "Autre"
L["Other faction"] = "Faction adverse"
L["Other locations"] = "Autres emplacement"
L["Other wings"] = "Autres ailles"
L["Overflow"] = "Débordement"
L["Overwatch"] = true
L["Pandaren"] = true
L["Part of a chain"] = "Fait parti d'une suite"
L["Paste to Chat"] = "Coller dans le chat"
L["Patch"] = true
L["Pilgrim's Bounty"] = "Les Bienfaits du pèlerin"
L["Pirates' Day"] = "Jour des pirates"
L["Placeholder"] = "Élément fictif"
L["Plugins"] = "Plugin"
L["Points"] = true
L["Pop ups"] = "Pop-ups"
L["Presets"] = "Préconfigurations"
L["Primal Storms"] = "Tempêtes primordiales"
L["Primalist Tomorrow"] = "L’avenir des Primalistes"
L["PvP"] = "Joueur contre Joueur"
L["PvP Season"] = "Saison PvP"
L["Quick Search"] = "Recherche rapide"
L["Quick Search Desc"] = [=[Recherche parmi tout les Hauts-faits dans les onglets ajoutés par {addonName}. Les Haut-faits dans les onglets par défaut ne sont pas recherchés.

Fonctionnalités :
|T:1:8|t- Recherche par titre et description du Haut-fait, triés par ordre alphabétique du titre.
|T:1:8|t- Recherche par ID du Haut-fait, pour ce faire vous devez commencer votre recherche par un # suivi du numéro de l'ID, la recherche est trié par nombre croissant. 

Options (1) : 
|T:1:8|t- {clearOnRightClick} ({clearOnRightClickEnabled})
|T:1:8|t- {excludeExcludedAchievements} ({excludeExcludedAchievementsEnabled} exclut les réalisations {excludeExcludedAchievementsFrom} des résultats de la recherche)
|T:1:8|t- {searchFilteredAchievements} ({searchFilteredAchievementsEnabled})
|T:1:8|t- {minCharToSearch} ({minCharToSearchNumber})
|T:1:8|t- {numSearchPreviews} ({numSearchPreviewsNumber})

(1) Vous pouvez trouver les options sous {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName}]=]
L["Rated"] = "Classé"
L["Ravine River Run"] = "Descente des gorges"
L["Realm"] = "Royaume"
L["Realm First!"] = "« Prem's » du royaume"
L["Rebind Micro Button"] = "Changer le raccourci clavier du micro-bouton"
L["Rebind Micro Button Desc"] = "Changer le raccouci clavier de la fenêtre Hauts-fait pour choisir un onglet different que celui par défaut"
L["Recruit-a-Friend"] = "Parrainez un ami"
L["Red"] = "Rouge"
L["Refresh Events"] = "Actualiser les événements"
L["Refresh interval"] = "Intervalle de rafraîchissement"
L["Refresh interval Desc"] = "Temps en secondes entre chaque rafraîchissement des données de l'événement. Un temps plus long peut retarder la création de nouvelles fenêtres contextuelles et le mascage des anciennes."
L["Related Tab"] = "Onglet associé"
L["Related Tab Desc"] = "Ouvre un nouvel onglet dans le navigateur, différent de l'onglet par défaut lorsqu'il est sélectionné."
L["Remember frame position"] = "Se souvenir de la position de la fenêtre"
L["Remember frame position Desc"] = "Se souvenir de la position de la {frame}. Cela permettra à la {frame} de conserver sa dernière position connue lors de la prochaine connexion."
L["Remove from Watch List"] = "Supprimer de {watchList}"
L["Required for"] = "Requis pour"
L["Researchers Under Fire"] = "Des chercheurs sous le feu"
L["Reset Faction Filters"] = "Réinitialiser les filtres de faction"
L["Reset Faction Filters Desc"] = "Réinitialiser ou conserver les filtres de faction. Cela signifie que si vous vous connectez avec un personnage {Alliance} et que l'un des filtres de faction {Neutre}, {Alliance} ou {Horden} est activé, seuls les filtres de faction {neutre} et {alliance} seront visible. Cette option est à prioriser lorsque vous basculez souvent entre {Alliance} et {Horde}."
L["Reset filters"] = "Réinitialiser les filtres"
L["Reset position"] = "Réinitialiser la position"
L["Reset position Desc"] = "Réinitialiser la {frame} à sa position par défaut."
L["Reset view"] = "Réinitialiser la vue"
L["Reset view on open"] = "Réinitialiser la vue à l'ouverture"
L["Reset view on open Desc"] = "à l'ouverture, ferme toutes les catégories ouvertes et sélectionnez la première catégorie."
L["Reverse Sort"] = "Inverser le trie"
L["Right"] = "Droite"
L["Right Alt"] = "Alt droit"
L["Right click"] = "Clic droit"
L["Right Click Menu"] = "Menu clic droit"
L["Right Click Menu Desc"] = [=[Chaque Hauts-faits dans les nouveaux onglets a un {rightClickMenu}.

Caractéristiques :
|T:1:8|t- Lien vers {wowhead}.
|T:1:8|t- Le menu {goTo} est un raccourci vers les réalisations qui font {partOfAChain}, qui sont {require} ou qui se retrouvent également dans d'autres catégories. Les Haut-faits de la catégorie {currentZone} ont un raccourci vers leur emplacement approprié dans l'arborescence des catégories.
|T:1:8|t- Le menu {xuFuPetGuides} est disponible si le Haut-faits est liée aux {petBattles} et si le {xuFuPetGuides} contient des informations pertinentes à ce sujet.
|T:1:8|t- Lien vers les ensembles de transmogrification si l'objectif du succès est d'en collecter un.
{pluginText}
|T:1:8|t- {add} : groupes divers éléments pour ne pas encombrer le menu principal.
|T:1:8|t|T:1:8|t- {addToWatch} : ajoutez le Haut-fait à la catégorie {watchList}. (Uniquement disponible sur les Haut-fait non suivis).
|T:1:8|t|T:1:8|t- {removeFromWatch} : Supprimez le Haut-fait de la catégorie {watchList}. (Uniquement disponible sur les Hauts-fait suivies).
|T:1:8|t|T:1:8|t- {include} : Le Haut-fait n'est plus masqué. (Uniquement disponible sur les Hauts-faits masqué).
|T:1:8|t|T:1:8|t- {exclude} : Masque le Haut-fait. (Uniquement disponible sur les Hauts-faits non masqué).

Options :
|T:1:8|t- Un bouton peut être affiché sur chaque réalisation qui ouvre le {rightClickMenu}. (actuellement : {enabled}) (1)

(1) Les options peuvent être trouvées sous {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {rightClickMenu}]=]
L["Right Ctrl"] = "Ctrl droit"
L["Right Shift"] = "Shitf droit"
L["River Rapids Route"] = "Descente des rapides"
L["Ruby Lifeshrine Loop"] = "Boucle du sanctuaire de l’Essence rubis"
L["Rydyr"] = true
L["Scalecracker Keep"] = "Donjon Craquécaille"
L["Screenshot Mode"] = "Mode capture d'écran"
L["Screenshot Mode Desc"] = [=[Ajoute un fond noir sur tout l'écran de jeu. Seules les fenêtres nouvellement ouvertes seront visibles. Utile si vous voulez prendre des captures d'écran de vos haut-fait.

Vous devez faire un /reload pour supprimer le fond noir !]=]
L["Screenshots"] = "Captures d'écran"
L["Search"] = "Rechercher"
L["Search field"] = "Champ de recherche"
L["Search preview"] = "Aperçu de la recherche"
L["Search Results"] = "Résultats de la recherche"
L["Season"] = "Saison"
L["Second column threshold"] = "Affichage des sous-tache en deux colonnes"
L["Second column threshold Desc"] = "Les Haut-fait avec plus de sous-tâches que ce nombre seront affichées dans deux colonnes au lieu d'une seule."
L["Secrets of Azeroth"] = "Les secrets d'Azeroth"
L["Secrets of Azeroth (EU)"] = "Les secrets d'Azeroth (EU)"
L["Secrets of Azeroth (KR)"] = "Les secrets d'Azeroth (KR)"
L["Secrets of Azeroth (US)"] = "Les secrets d'Azeroth (US)"
L["Select All"] = "Sélectionner tout"
L["Selected Zone"] = "Zone Sélectionnée"
L["Set Keybind"] = "Définir le raccourci clavier"
L["Set Keybind Desc"] = "Définissez le raccourci clavier pour l'onglet sélectionné sur \"Y\". Cela dissocie toutes les autres actions liées à 'Y'. D'autres raccourcis clavier peuvent être spécifiés dans les {keyBindings} normaux."
L["Shift"] = true
L["Shipyard"] = "Chantier naval"
L["Show"] = "Afficher les pop-ups d'évènements"
L["Show alertSystem on event start Desc"] = "Afficher ou masquer l'événement {alertSystem} au démarage."
L["Show alertSystem on event start in instances Desc"] = "Afficher ou masquer l'événement {alertSystem} lorsqu'il démarre alors que vous êtes à l'intérieur d'une instance."
L["Show alertSystem on event start only when time data is available Desc"] = "Afficher ou masquer l'événement {alertSystem} au démarrage d'un événement uniquement lorsque le temps restant de l'événement est disponible."
L["Show alertSystem on login Desc"] = "Affiche ou masque l'événement {alertSystem} lors du /reload ou de la connection."
L["Show alertSystem on login in instances Desc"] = "Afficher ou masquer l'événement {alertSystem} lors de la connexion au jeu alors que vous êtes à l'intérieur d'une instance."
L["Show alertSystem on login only when time data is available Desc"] = "Afficher ou masquer l'événement {alertSystem} à la connexion au jeu uniquement lorsque le temps restant de l'événement est disponible."
L["Show alertSystem on reload Desc"] = "Afficher ou masquer l'événement {alertSystem} lors du rechargement du jeu."
L["Show alertSystem on reload in instances Desc"] = "Afficher ou masquer l'événement {alertSystem} lors du rechargement du jeu alors que vous êtes à l'intérieur d'une instance."
L["Show alertSystem on reload only when time data is available Desc"] = "Afficher ou masquer l'événement {alertSystem} lors du rechargement du jeu uniquement lorsque le temps restant de l'événement est disponible"
L["Show All Results in Category"] = "Afficher tous les résultats de la catégorie"
L["Show All Results in Category Desc"] = "Afficher tous les résultats de recherche dans une catégorie qui persistera pendant cette session."
L["Show Criteria"] = "Afficher les critères"
L["Show Criteria Desc"] = "Afficher les critères de réalisation sur les unités requises pour une réalisation (par exemple, /love {critère} pour {réalisation})."
L["Show Criteria If"] = "Afficher les critères si..."
L["Show current character icons"] = "Afficher les icônes des personnages actuels"
L["Show current character icons Desc"] = [=[Affiche ou masque les icônes du personnage actuel.

Si cette option est activée, une deuxième icône apparaîtra devant les réalisations {partOfACain} et {requiredFor}, indiquant la progression du personnage actuel.]=]
L["Show Excluded Category"] = "Afficher la catégorie masqué"
L["Show Excluded Category Desc"] = [=[Afficher ou masquer la catégorie {exclus}.

Si la case est cochée, cette catégorie ne s'affichera que s'il y a effectivement des Hauts-faits exclues et que les filtres définis permettent de les afficher.

Si la coche n'est pas cochée , c'est que la catégorie est toujours masquée et que les filtres sont également masqués.]=]
L["Show Faction Faction Icon"] = "Afficher l'icône de la faction"
L["Show Faction Faction Icon Desc"] = "Afficher l'icône de la faction {faction} sur le Haut-fait si seuls les joueurs de la faction {faction} peuvent l'obtenir."
L["Show faction icon"] = "Afficher les icones de faction"
L["Show faction icon Desc"] = "Afficher une icône de faction devant le nom du personnage"
L["Show For Achievement"] = "Afficher pour le haut fait"
L["Show For Achievement Desc"] = "Afficher le haut fait pour lequel le critère est nécessaire"
L["Show minimap icon"] = "Afficher l'icone sur la mini-map"
L["Show minimap icon Desc"] = "Afficher ou masquer l'icône sur la mini-map."
L["Show Not Obtainable"] = "afficher {non disponible}"
L["Show Not Obtainable Desc"] = "Affiche ou masque les réalisations {notObtainable} en rouge sur la barre de progression."
L["Show Objectives progress"] = "Afficher {objectivesProgress}"
L["Show Objectives progress Desc"] = [=[Affiche ou masque {objectivesProgress}.

Si cette option est activée, les {objectivesProgress} des Hauts-faits seront affichées dans l'info-bulle.]=]
L["Show Other faction"] = "Afficher les autres factions"
L["Show Other faction Desc"] = [=[Affiche ou masque {otherFaction}.

Si cette option est activée, le Haut-fait de l'autre faction sera affiché dans l'info-bulle si disponible. Cela peut expliquer plus clairement pourquoi votre nouveau personnage de la Horde a certaines réalisations si vous n'avez joué que l'Alliance auparavant.]=]
L["Show Part of a Chain"] = "Afficher {partOfACain}"
L["Show Part of a Chain Desc"] = [=[Affiche ou masque {partOfAChain}.

Si cette option est activée, la suite de Hauts-faits à laquelle elle appartient sera affichée dans l'info-bulle.]=]
L["Show placeholders"] = "Afficher un Haut-fait générique"
L["Show placeholders Desc"] = "Afficher un lot d'alerte d'évènement fictifs pour visualiser l'effet des paramètres ci-dessus. Les alertes peuvent être refermés en passant la souris dessus et en effectuant un clic droit"
L["Show placeholders filter"] = "Afficher le filtre des Hauts-faits générique"
L["Show placeholders filter Desc"] = [=[Afficher ou masquer le filtre des Hauts-faits générique. Ceci est utilisé pour montrer les réalisations qui ne sont pas encore dans le jeu.

Peut contenir des spoilers si activé !]=]
L["Show pop ups on login delay Desc"] = "Retarder l'apparition initiale des fenêtres alerte d'événement lors de la connexion"
L["Show Required for"] = "Afficher {requiredFor}"
L["Show Required for Desc"] = [=[Affiche ou masque {requiredFor}.

Lorsque cette option est activée, la réalisation qui nécessite l'accomplissement du Haut-fait sélectionnée sera affichée dans l'info-bulle.]=]
L["Show Rewards"] = "Afficher les récompenses"
L["Show Rewards Desc"] = [=[Afficher ou masquer les {rewards},

Lorsque cette option est cochée et si disponibles, les {rewards} attribuées par cette réalisation seront visibles dans l'infobulle.]=]
L["Show Right Click Menu"] = "Afficher le bouton {rightClickMenu}"
L["Show Right Click Menu Desc"] = [=[Affiche ou masque le bouton {rightClickMenu} sur chaque Haut-fait.

Cela sert d'alternative au clic droit sur le Haut-fait.]=]
L["Show Sub Categories"] = "Afficher les sous-catégories"
L["Show Sub Categories Desc"] = [=[Afficher ou masquer les sous-catégories.

Si cette option est activée, Les Hauts-faits seront placées dans leurs sous-catégories d'origine au lieu d'être regroupées dans la seule catégorie {Catégorie}.]=]
L["Show world map icon"] = "Afficher l'icône de la carte du monde"
L["Show world map icon Desc"] = "Afficher ou Masquer l'icône de la carte du monde"
L["Side Button Anchor"] = "Ancre d'affichage des alertes d'évènements"
L["Side Button Anchor Desc"] = "Définit sur quelle fenêtre vous voulez voir les alertes dévènements"
L["Side Window"] = "Fenêtre latérale"
L["Siege on Dragonbane Keep"] = "Fléau-des-Dragons"
L["Siege on Dragonbane Keep: Active"] = "Fléau-des-Dragons : En cours"
L["Siege on Dragonbane Keep: Gathering"] = "Fléau-des-Dragons : Bientôt"
L["Skitterer Xi'a"] = "Glisseur Xi'a"
L["Skoldus Hall"] = "Salle de Skoldus"
L["Slagmire"] = true
L["Sort priority"] = "Priorité de tri."
L["Soulforges"] = "Forge des Âmes"
L["Sources"] = true
L["Southshore vs. Tarren Mill"] = "Austrivage contre Moulin-de-Tarren"
L["Spacing"] = "Espace"
L["Spacing Desc"] = "Ajoute ou retire des espace à l'espace de base entre les onglets"
L["Special Categories"] = "Catégorie Spéciale"
L["Special thanks"] = "Remerciement spécial"
L["Specials"] = "Spécifique"
L["Stables"] = "Écuries"
L["StarCraft II"] = true
L["Start Time"] = "Heure de début"
L["Strand of the Ancients"] = "Rivage des Anciens"
L["Style"] = "Style de la fenêtre des Hauts-faits"
L["Summary Desc"] = [=[{achievementsHeader}:
|T:1:8|t- Affiche les {numAchievements} derniers Hauts-faits obtenues au niveau du compte et des personnages (1).

{categoriesHeader}:
|T:1:8|t- Affiche la progression de chaque catégorie dans l'onglet. Il s'agit de la même progression que celle que vous verriez en survolant une catégorie sur le côté.

(1) Les options se trouvent sous {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {categories} {arrow} {summary}.]=]
L["Sundapple Copse Circuit"] = "Parcours du taillis Soltavel"
L["Tab"] = "Onglet"
L["tab"] = "onglet"
L["Tabs"] = "Onglets"
L["Ta's Pet Collection"] = "Collection de mascottes"
L["temporary obtainable"] = "temporairement réalisable"
L["Temporary Obtainable Text"] = "{thisAchievement}{isWillBeWas}{neverOnceTempObt}{startText}{startDetail}{endText}{endDetail}"
L["The Azure Span Slalom"] = "Slalom de la travée d’Azur"
L["The Azure Span Sprint"] = "Sprint de la travée d’Azur"
L["The Entitled"] = "Titres pour"
L["The Flowing Forest Flight"] = "Vol de la forêt Ondoyante"
L["The Vakthros Ascent"] = "Ascension du Vakthros"
L["This achievement"] = "Ce Haut-fait"
L["This achievement can't be earned by this character."] = "Ce Haut-fait ne peux pas être réalisé par ce personnage"
L["This achievement is no longer obtainable"] = "Cet Haut-fait n'est plus réalisable"
L["This character's class has no transmog set that meet the requirements."] = "La classe de ce personnage n'a pas d'ensemble de transmogrification qui réponde aux exigences."
L["Thundering Pandaren Spirit"] = "Esprit pandaren fulminant"
L["Time display"] = "affichage de l'heure"
L["Time Left"] = "Temps restant"
L["Time Rift: Active"] = "Faille temporelle : En cours"
L["Time Rift: Starting Soon"] = "Faille temporelle : Bientôt"
L["Time Rifts"] = "Faille temporelle"
L["Titan Lockdown"] = "Confinement des Titans"
L["Titan Lockdown: Active"] = "Confinement des Titans : En cours"
L["Titan Lockdown: Soon"] = "Confinement des Titans : Bientôt"
L["Ti'un the Wanderer"] = "Ti'un l'Explorateur"
L["Toggle"] = "Basculer"
L["Toggle Tracking"] = "Activer ou désactiver le suivi"
L["Toggle window once opened"] = "Basculer la fenêtre une fois ouverte"
L["Toggle window once opened Desc"] = "Lorsque la fenêtre des hauts faits est ouverte pour la première fois, ouvrez la fenêtre sur l'onglet correct et sélectionnez le résumé. À partir de la deuxième ouverture, indépendamment de la combinaison de touches utilisée, ouvrez la dernière vue consultée."
L["Tooltip"] = "Info-bulle"
L["Torghast"] = "Tourment"
L["Tracking Achievements"] = "Suivi des Hauts-faits"
L["Transmog Sets"] = "Transmogrification"
L["Truncate"] = "Tronquer"
L["Tutorial"] = "Tutoriel"
L["Tutorial Desc"] = "Ouvrir le tutoriel à l'ouverture"
L["Tyrhold"] = "Tempête élémentaire : Bastion de Tyr"
L["Uktulut Coaster"] = "Circuit d'Uktulut"
L["Uncategorized"] = "Sans catégorie"
L["Unchecked"] = "Non coché"
L["until the end of"] = "Jusqu'à la fin de"
L["Up"] = "Haut"
L["up until the start of"] = "jusqu'au début de"
L["Upper Reaches"] = "Étages supérieurs"
L["Vendor"] = "Marchands"
L["Venthyr Assault"] = "L'assaut des Venthyrs"
L["View Tutorial"] = "Voir le tutoriel"
L["Wago"] = true
L["Wago Desc"] = "Ouvre une fenêtre avec un lien vers la page {addonName} {wago}."
L["Warcraft III: Reforged"] = true
L["was"] = "était"
L["Watch List"] = "Liste de suivis"
L["When achievement completed"] = "Lorsque le Haut-fait est terminée"
L["When achievement completed Desc"] = [=[Affiche ou masque {objectivesProgress} lorsque les Haut-fait sont réalisé.

Si cette option est activée, les {objectivesProgress} des Hauts-faits seront affichés dans l'info-bulle, que la réalisation soit terminée ou non.]=]
L["Whispering Pandaren Spirit"] = "Esprit pandaren murmurant"
L["Widget Events"] = "Événements du widgets"
L["Wild Preserve Circuit"] = "Circuit du domaine Sauvage"
L["Wild Preserve Slalom"] = "Slalom du domaine Sauvage"
L["will be"] = "sera"
L["Window"] = "Fenêtre"
L["Wingrest Roundabout"] = "Tour de Trêve-Ailée"
L["World Events"] = "Événements mondiaux"
L["World Map"] = "Carte du monde"
L["World Map Button"] = "Bouton de la carte du monde"
L["World Map Button Desc"] = [=[Survol :
|T:1:8|t- Affiche le nombre de Hauts-faits réalisable & non réalisable ainsi que les Hauts-faits terminées & non terminé comme les {enhancedTooltipCategories} en fonction des filtres définis pour la {selectedZone}.
|T:1:8|t- Voir {enhancedTooltipCategories} et {enhancedFilteringAndSorting} pour plus d'informations.

Clic-gauche :
|T:1:8|t- Ouvre la fenêtre des réalisations de la catégorie {selectedZone}.]=]
L["Wowhead"] = true
L["Wowhead Link"] = "Lien Wowhead"
L["WoWInterface"] = true
L["WoWInterface Desc"] = "Ouvre une fenêtre avec un lien vers la page {addonName} {woWInterface}."
L["WoW's 10th Anniversary"] = "10e anniversaire de WoW"
L["WoW's 18th Anniversary"] = "18e anniversaire de WoW"
L["WoW's Anniversary"] = "Anniversaire de WoW"
L["X offset Desc"] = "Décalage horizontal à partir de la position de départ"
L["Xu-Fu's Pet Guides"] = "Guide de mascotte Xu-Fu"
L["XYZ offset"] = "Décalage XYZ"
L["Y offset Desc"] = "Décalage vertical à partir de la position de départ"
L["Zaqali Ruin Investigation"] = "Investigations dans les ruines Zaqalis"
L["Zaqali Ruin Investigation: Active"] = "Investigations dans les ruines Zaqalis : En cours"
L["Zaqali Ruin Investigation: Soon"] = "Investigations dans les ruines Zaqalis : Bientôt"
L["Zones"] = true