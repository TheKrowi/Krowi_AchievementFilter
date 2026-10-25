# The feature-based layout of the options mockup (iteration 2). Paths name nodes of the real options tree.
$tabsShow = 'Layout > Tabs > Show > Show'
$tip = 'Layout > Achievements > Tooltip > Tooltip'
$style = 'Layout > Achievements > Style > Style'
$adj = 'Layout > Adjustable Categories'
$popAct = 'Event Reminders > Pop ups > Active Events'
$popUp = 'Event Reminders > Pop ups > Upcoming Calendar Events'
$chatAct = 'Event Reminders > Chat messages > Active Events'
$chatUp = 'Event Reminders > Chat messages > Upcoming Calendar Events'
$tabCols = @('Achieve­ments', 'Expan­sions', 'Events', 'PvP', 'Specials')
$profileNames = @(@('Default', 'Default'), @('Krowi - Frostmane', 'Krowi - Frostmane'), @('Frostmane', 'Frostmane'), @('Warrior', 'Warrior'))

function Profile-Group([string] $header, [string] $page) {
    @{ header = $header; items = @(
        @{ p = "Profiles > $page > Existing Profiles"; label = 'Current profile'; values = $profileNames; def = 'Default' },
        @{ p = "Profiles > $page > New"; label = 'New profile' },
        @{ p = "Profiles > $page > Copy From"; values = $profileNames; placeholder = 'Choose a profile' },
        @{ p = "Profiles > $page > Delete a Profile"; values = $profileNames; placeholder = 'Choose a profile' },
        @{ p = "Profiles > $page > Reset Profile"; btn = 'Reset' }
    ) }
}

$spec = @{
    img = @{
        TipAchievement = '/_blob/3f211ed413f8bfdc1820c90fd77da9d7'; TipCategory = '/_blob/73c1e8d90f63a34d1ea00b3b3ae2de84'
        TipPoints = '/_blob/1c4cf29401663505db4e69666afcc4d1'; TipEarnedBy = '/_blob/834fcde28cd484cecca69c2f0393f929'
        MenuMain = '/_blob/ed5a87e207d298a307d8720994c1d967'; MenuGoTo = '/_blob/84dce966b9249f5b1ffd4bdc8535db51'
        FilterMenu = '/_blob/2d60aa007447cedf75227b6127196ace'; CategoryTree = '/_blob/e4e9b48b99137727ca8f3f90477c7912'
        SummaryBars = '/_blob/6dee59ca9a573ab0b35dd52fc5edca2c'; CalendarDays = '/_blob/46fe5649c203b00fdbd6a07d39cbe279'
        CompactList = '/_blob/4a35a0aa745c3e7e34390dccc92462d1'; Colors = '/_blob/c78b4cbae19e02f930ba0bad58727861'
        SearchBox = '/_blob/20fbd41ff8d458f4b934e7027ff7b2bb'; MapButton = '/_blob/f11cf13b04b7e331dc386e5d618c62de'
        NewTabs = '/_blob/b84b80d6c653aaba89b5b99170e888b8'; Reminders = '/_blob/ac60288bd1d842ada148682e2dbf5f2a'
    }
    intro = "Krowi's Achievement Filter adds its own tabs to the achievement window: achievements per expansion, per event and per battleground, with better filters, search and event reminders. Each section explains one feature and holds its settings."
    changelog = @{ version = '104.0'; groups = @(
        @{ name = 'Added'; lines = @(
            'Achievement guides for the other eleven Legendary Research achievements, one per class hall',
            "Curse Surge event reminders, wherever you are, with the surge's name and time left; each surge can be turned off under Event Reminders > World Events > Midnight",
            'Tracking an achievement while 10 are tracked now first stops tracking the ones you already completed, and names them in chat') },
        @{ name = 'Changed'; lines = @(
            "Achievement guides now name the people to talk to in your game's language",
            'The Legendary Research of the Ebon Blade guide now starts with where to go, with Death Gate under it',
            'Legion Assaults are now one reminder with one toggle, instead of one per zone',
            'Covenant assault reminders now only show for characters who finished chapter 2 of Chains of Domination') },
        @{ name = 'Fixed'; lines = @(
            'Let Her Solo Me shows as obtainable again, since it can still be earned',
            'The Track check in the achievement window and in popped-out achievements now updates when an achievement is tracked or untracked elsewhere, such as from the objective tracker',
            'Community Feast reminders now show wherever you are, not only in the Azure Span',
            'Time Rift, Superbloom and Azerothian Archives reminders now show wherever you are, not only in their zones',
            'Dreamsurge reminders show in their zones again') }
    ) }
    tabOrder = @('k1', 'b2', 'b3', 'b1', 'k2', 'k3', 'k4', 'k5')
    nav = @(
        @{ name = 'Achievement window'; tiles = $true; ids = @('tabs', 'window', 'categories', 'summary', 'achievements', 'filters', 'search', 'tooltips', 'rightclick', 'popout', 'rewards', 'guides', 'calendar') },
        @{ name = 'Around the game'; tiles = $true; ids = @('maps', 'criteria', 'events', 'eventlist') },
        @{ name = 'This addon'; tiles = $false; ids = @('keys', 'plugins', 'profiles', 'advanced', 'about') }
    )
    sections = @(
        @{ id = 'overview'; name = 'Overview'; groups = @()
           explain = @{ title = 'Using these options'; blocks = @(
               'p:Hover an option to read what it does.',
               'p:Each section starts with how its feature works. Click a picture to see it larger.',
               'p:A dot before an option means you changed it. Right-click the dot to put it back.',
               'p:Sections marked New have changed since you last looked.') } },

        @{ id = 'tabs'; name = 'Tabs'; tile = 'TabButton'; summary = 'Which tabs show, and in which order.'; showMe = 'opens the achievement window on the Expansions tab'
           explain = @{ title = 'New tabs'; blocks = @(
               'img:NewTabs',
               "p:The addon adds five tabs under the achievement window, next to Blizzard's.",
               "li:Achievements|Blizzard's categories, with this addon's filters, search and tooltips.",
               'li:Expansions|Per expansion: zones, dungeons, raids, pet battles.',
               'li:Events|Per holiday and world event.',
               'li:Player vs. Player|Per battleground.',
               'li:Specials|Mounts, titles, transmog and other rewards.',
               "p:Blizzard's own Achievements tab is hidden by default; the new one replaces it.") }
           explainFull = @{ title = 'New achievement window tabs'; blocks = @(
               'img:TabButton',
               'p:New tabs are added to the achievement window. This offers a new way of displaying achievements in a familiar fashion without interfering with the default tabs.',
               'h:Tabs:',
               "li:Achievements|A copy from the default Achievements tab but with all the new features added by Krowi's Achievement Filter.",
               'li:Expansions|Achievements are grouped in categories per expansion with a more logic hierarchy. See the Categories section for more details.',
               'li:Events|Achievements are grouped in categories per event. This goes from holidays to world events like assaults.',
               'li:Player vs. Player|Achievements are grouped in categories per battleground.',
               'li:Specials|These categories are collections of achievements that award mounts, titles, transmog and others that not realy fit anywhere else.',
               "p:Both default tabs and tabs added by Krowi's Achievement Filter can be hidden below.") }
           alt = @{ TabButton = 'The tab strip under the achievement window with the new tabs'; NewTabs = 'The new tabs' }
           groups = @(
               @{ header = 'Tabs and their order'; kind = 'order'; note = 'Uncheck a tab to hide it. The arrows move it in the tab strip.'; items = @(
                   @{ key = 'b1'; src = 'Blizzard'; p = "$tabsShow > Achievements[1]"; label = 'Achievements'; desc = "Blizzard's own Achievements tab. Hidden by default, because the new Achievements tab replaces it." },
                   @{ key = 'b2'; src = 'Blizzard'; p = "$tabsShow > Guild"; label = 'Guild'; desc = "Blizzard's Guild tab." },
                   @{ key = 'b3'; src = 'Blizzard'; p = "$tabsShow > Statistics"; label = 'Statistics'; desc = "Blizzard's Statistics tab." },
                   @{ key = 'k1'; src = ''; p = "$tabsShow > Achievements[2]"; label = 'Achievements'; desc = "Blizzard's categories with all of this addon's features." },
                   @{ key = 'k2'; src = ''; p = "$tabsShow > Expansions"; label = 'Expansions'; desc = 'Achievements grouped per expansion.' },
                   @{ key = 'k3'; src = ''; p = "$tabsShow > Events"; label = 'Events'; desc = 'Achievements grouped per event.' },
                   @{ key = 'k4'; src = ''; p = "$tabsShow > Player vs. Player"; label = 'Player vs. Player'; desc = 'Achievements grouped per battleground.' },
                   @{ key = 'k5'; src = ''; p = "$tabsShow > Specials"; label = 'Specials'; desc = 'Mounts, titles, transmog and other collections.' }) },
               @{ header = 'Tab strip'; items = @('Layout > Tabs > General > General > Spacing') }) },

        @{ id = 'window'; name = 'Window'; summary = 'Size, position and what opens first.'; showMe = 'opens the achievement window'
           explain = @{ title = 'The achievement window'; blocks = @(
               'img:',
               'p:The achievement window gets wider and taller, and remembers where you put it.',
               'li:Size|Extra width for the category list and the achievement list, extra height for the whole window.',
               'li:Header|Your achievement points, per character on hover, and back and forward arrows through the achievements you looked at.',
               'li:Achievements button|Choose which tab it opens.') }
           groups = @(
               @{ header = 'Size'; items = @(@{ from = 'Layout > Window > Offsets' }) },
               @{ header = 'Position'; items = @(
                   'Layout > Window > Movable > Make windows movable',
                   'Layout > Window > Movable > Remember Achievement Window position',
                   @{ p = 'Layout > Window > Movable > Reset position[1]'; label = 'Reset window position'; btn = 'Reset' },
                   'Layout > Window > Movable > Remember Achievement Calendar position',
                   @{ p = 'Layout > Window > Movable > Reset position[2]'; label = 'Reset calendar position'; btn = 'Reset' },
                   'Layout > Window > Movable > Remember Data Manager position',
                   @{ p = 'Layout > Window > Movable > Reset position[3]'; label = 'Reset Data Manager position'; btn = 'Reset' }) },
               @{ header = 'Opening the window'; items = @(
                   'General > Key Binding > General > Reset view > Reset view on open',
                   'General > Key Binding > General > Reset view > Toggle window once opened',
                   'General > Key Binding > General > Micro Button > Rebind Micro Button',
                   @{ p = 'General > Key Binding > General > Micro Button > Set Keybind'; btn = 'Bind to Y' },
                   'Layout > Achievements > Style > Tab Priority > Enable Tab Priority',
                   @{ p = 'Layout > Achievements > Style > Tab Priority > Tab Priority'; parentP = 'Layout > Achievements > Style > Tab Priority > Enable Tab Priority' }) },
               @{ header = 'Header'; items = @(
                   'Layout > Header > General > Center header',
                   'Layout > Header > General > Achievement Points - Format',
                   'Layout > Header > Achievement browsing history > Track achievement browsing history',
                   @{ p = 'Layout > Header > Calendar button > Horizontal position'; label = 'Calendar button: horizontal position' },
                   @{ p = 'Layout > Header > Calendar button > Vertical position'; label = 'Calendar button: vertical position' }) },
               @{ header = 'Data Manager'; items = @(@{ p = 'Layout > Data Manager > Mouse Wheel Scroll Speed > Mouse Wheel Scroll Speed' }) }) },

        @{ id = 'categories'; name = 'Categories'; tile = 'Categories'; summary = 'Expansions, zones and the special categories.'; showMe = 'opens the Expansions tab at the current expansion'
           explain = @{ title = 'Categories'; blocks = @(
               'img:CategoryTree',
               'p:Each expansion holds its zones, dungeons, raids, pet battles and expansion features; each zone its quests, exploration, PvP and reputation.',
               'h:Special categories',
               'li:Current Zone|The zone you are in.',
               'li:Selected Zone|The zone selected on the world map.',
               'li:Watch List|Achievements you watch (Alt-click).',
               'li:Excluded|Achievements you excluded.',
               "li:Summary|The tab's last earned achievements and progress.",
               'p:Choose below which tabs show each one.') }
           explainFull = @{ title = 'Expansions tab'; blocks = @(
               'img:Categories',
               'p:Achievements are grouped in categories per expansion with a more logic hierarchy.',
               'h:The hierarchy is as follow:',
               'li:|Expansion',
               'li2:|Zones: Quests, Exploration, PvP, Reputation',
               'li2:|Dungeons',
               'li2:|Raids',
               'li2:|Pet Battles',
               'li2:|Expansion Features',
               'h:Special categories:',
               "li:Current Zone|Shows the achievements linked to the current zone you're in.",
               'li:Selected Zone|Shows the achievements linked to the selected zone from the world map.',
               'li:Watch List|Shows the watched achievements. Achievements can be displayed with or without their subcategories.',
               'li:Excluded|Shows the excluded achievements. Achievements can be displayed with or without their subcategories. Can be permanently hidden from the options.') }
           alt = @{ Categories = 'The category list of the Expansions tab'; CategoryTree = 'The category list of the Expansions tab' }
           groups = @(
               @{ header = 'Category list'; items = @(
                   'Layout > Categories > Indentation > Indentation',
                   'Layout > Categories > Merge Small Categories > Merge small categories threshold',
                   'Layout > Categories > Mouse Wheel Scroll Speed > Mouse Wheel Scroll Speed',
                   'Layout > Categories > Tooltip > Show Not Obtainable') },
               @{ header = 'Special categories per tab'; kind = 'matrix'; cols = $tabCols; note = 'Changes need a reload.'; reload = $true; rows = @(
                   @{ label = 'Summary'; from = "$adj > Summary#Tabs"; desc = 'The last earned achievements and the progress of each category.' },
                   @{ label = 'Watch List'; from = "$adj > Watch List#Tabs"; desc = 'The achievements you watch, from the right-click menu or with Alt-click.' },
                   @{ label = 'Current Zone'; from = "$adj > Current Zone#Tabs"; desc = 'The achievements of the zone you are in.' },
                   @{ label = 'Selected Zone'; from = "$adj > Selected Zone#Tabs"; desc = 'The achievements of the zone selected on the world map.' },
                   @{ label = 'Search Results'; from = "$adj > Search Results#Tabs"; desc = 'All results of a search, kept for this session.' },
                   @{ label = 'Tracking Achievements'; from = "$adj > Tracking Achievements#Tabs"; desc = 'Hidden achievements the game uses to track progress.' },
                   @{ label = 'Excluded'; from = "$adj > Excluded#Tabs"; desc = 'The achievements you excluded.' },
                   @{ label = 'Uncategorized'; from = "$adj > Uncategorized#Tabs"; desc = 'Achievements that are in no other category.' }) },
               @{ header = 'Watch List'; items = @(@{ from = "$adj > Watch List#" }) },
               @{ header = 'Excluded'; items = @(@{ from = "$adj > Excluded#" }) },
               @{ header = 'Tracking Achievements'; items = @(@{ from = "$adj > Tracking Achievements#" }) }) },

        @{ id = 'summary'; name = 'Summary'; tile = 'Summary'; summary = 'The last earned achievements and category progress.'; showMe = 'opens the Expansions tab on its summary'
           explain = @{ title = 'Summary'; blocks = @(
               'img:SummaryBars',
               'li:Recent achievements|The last ones you earned, account-wide and on this character.',
               'li:Progress bars|Per category: earned (+ no longer obtainable) / total. Green is earned, red can no longer be earned.') }
           explainFull = @{ title = 'Summary'; blocks = @(
               'img:Summary',
               'h:Achievements:',
               'li:|Shows the last 25 earned account wide and character achievements.',
               'h:Categories:',
               'li:|Shows the progress for each category in the tab. This is the same progress you would see when mousing over a category on the side.') }
           alt = @{ Summary = 'The summary of a tab'; SummaryBars = 'Progress bars of the summary' }
           groups = @(
               @{ header = 'Summary'; items = @(@{ from = 'Layout > Summary > Summary' }, 'Layout > Summary > Mouse Wheel Scroll Speed > Mouse Wheel Scroll Speed') }) },

        @{ id = 'achievements'; name = 'Achievements'; tile = 'CompactAchievements'; summary = 'Compact achievements, icons and colors.'; showMe = 'opens the achievement window on an earned achievement'
           explain = @{ title = 'Achievements'; blocks = @(
               'img:CompactList',
               'p:Compact achievements are 2/3 of the normal size, like the ones in the summary.',
               'h:Colors',
               'img:Colors',
               'li:Gold|Earned. The border is gold instead of red.',
               'li:Red, red border|Earned, but no longer obtainable.',
               'li:Red, grey border|Not earned, and no longer obtainable.',
               'li:Blue|Earned account-wide.',
               'h:Icons',
               'li:Faction|Only Alliance or only Horde can earn it.',
               'li:Temporarily obtainable|Can only be earned for a limited time.',
               'li:Warband|Earned for your whole warband.') }
           explainFull = @{ title = 'Compact Achievements and colors'; blocks = @(
               'img:CompactAchievements',
               'h:Compact Achievements',
               'p:Achievements are 2/3rd the size, similar to the summary achievements.',
               'img:NewAchievementColors',
               'h:New Achievement Colors',
               'li:|The default gold of an obtained achievement. The border is changed from red to gold.',
               'li:|The new red of an obtained not obtainable achievement with default red border.',
               'li:|The new red of a not obtained not obtainable achievement with default grey border.',
               'li:|The default blue of an obtained account-wide achievement with default blue border.') }
           alt = @{ CompactAchievements = 'Compact achievements in the list'; NewAchievementColors = 'The four achievement colors'; CompactList = 'Compact achievements'; Colors = 'The achievement colors' }
           groups = @(
               @{ header = 'Style and icons'; items = @(@{ from = "$style#" }) },
               @{ header = 'Objectives'; items = @(@{ from = "$style#Objectives" }) },
               @{ header = 'Scrolling'; items = @('Layout > Achievements > Style > Mouse Wheel Scroll Speed > Mouse Wheel Scroll Speed') }) },

        @{ id = 'filters'; name = 'Filtering and sorting'; tile = 'FilteringSorting'; summary = 'What each tab shows, and in which order.'; showMe = 'opens the achievement window with its filter menu open'
           explain = @{ title = 'Filtering and sorting'; blocks = @(
               'img:FilterMenu',
               'p:The Filter button above the category list sets what the tabs show. Several filters can be on at once.',
               'li:Completed, Not Completed|Earned or not.',
               'li:Obtainable, Not Obtainable|Can still be earned or not.',
               'li:Faction|Neutral, Alliance or Horde.',
               'li:Collapse Chain|Only the last earned and the first not earned step of a chain.',
               'li:Sort By|Default, name, completion or ID, and Reverse Sort.',
               'li:Earned By|Account: in color when any character earned it. Character: in color when this character did, faded when another did.',
               'p:Each tab and special category has its own filters too; changing the ones on top overwrites them.') }
           explainFull = @{ title = 'Enhanced filtering and sorting'; blocks = @(
               'img:FilteringSorting',
               'p:Filtering and sorting of achievements is enhanced with following features.',
               'h:Categories:',
               'li:Merge Small Categories|Merge categories if allowed with less than 10 achievements.',
               'h:Filtering (multiple filters can be selected at the same time):',
               'li:Completed|Show completed achievements.',
               'li:Not Completed|Show not completed achievements.',
               'li:Obtainable|Show obtainable achievements.',
               'li:Not Obtainable|Show not obtainable achievements.',
               'li:Faction|',
               'li2:Neutral|Show achievements that both Alliance and Horde can earn.',
               'li2:Alliance|Show achievements only Alliance can earn.',
               'li2:Horde|Show achievements only Horde can earn.',
               'li:Excluded|Show excluded achievements.',
               'li:Collapse Chain|Show only the last completed and first not completed achievement in a chain.',
               'h:Sorting:',
               'li:Default|No sorting applied.',
               'li:Name|Sort achievements based on their names.',
               'li:Completion|Sort achievements based on if they are completed or not.',
               'li:ID|Sort achievements based on their ID.',
               'li:Reverse Sort|When this is selected, invert the order of the sorted achievements.',
               'h:Tabs:',
               'li:|These have all the filtering and sorting features mentioned above but can be changed independent from the others.',
               "li:|Changing any of the above filters will overwrite the individial tab's filtering and sorting.",
               'h:Special Categories:',
               'li:|These have all the filtering and sorting features mentioned above but can be changed independent from the others.',
               'h:Earned By:',
               'li:Account|Achevements are saturated if earned on any character on your account.',
               'li:Character|Achievements are saturated if earned by your current character and partially saturated if earned on another character on your account but not the current one.') }
           alt = @{ FilteringSorting = 'The filter menu'; FilterMenu = 'The filter menu' }
           groups = @(
               @{ header = 'Filters'; items = @('General > Filters > Reset filters > Reset Faction Filters') }) },

        @{ id = 'search'; name = 'Search'; tile = 'QuickSearch'; summary = 'Find achievements by name, description or ID.'; showMe = "puts the cursor in the achievement window's search field"
           explain = @{ title = 'Search'; blocks = @(
               'img:SearchBox',
               "p:Searches the achievements of this addon's tabs by name and description, sorted by name.",
               'li:#12345|Start with # to search by ID.',
               'li:Show All Results|Puts every result in a Search Results category.',
               'li:Right-click|Clears the search field.') }
           explainFull = @{ title = 'Quick Search'; blocks = @(
               'img:QuickSearch',
               "p:Searches for achievements in the tabs added by Krowi's Achievement Filter. This does not search the default tabs.",
               'h:Features:',
               'li:|Search by achievement title and description, alphabetically sorted by title.',
               "li:|Search by achievement ID by starting the search query with '#', ordered by ascending ID.",
               'img:FullSearch',
               'h:Full Search',
               "p:By selecting 'Show All X Results' you're able to view all search results.") }
           alt = @{ QuickSearch = 'The search field with its preview'; FullSearch = 'All search results in a category'; SearchBox = 'The search field with its preview' }
           groups = @(
               @{ header = 'Search field'; items = @(@{ from = 'Layout > Search > Search field' }) },
               @{ header = 'Preview'; items = @(@{ from = 'Layout > Search > Search preview' }) },
               @{ header = 'Scrolling'; items = @('Layout > Search > Mouse Wheel Scroll Speed > Mouse Wheel Scroll Speed') }) },

        @{ id = 'tooltips'; name = 'Tooltips'; tile = 'TooltipAchievements'; summary = 'Who earned it, rewards, chains and progress.'; showMe = "shows an achievement's tooltip in the achievement window"
           explain = @{ title = 'Tooltips'; blocks = @(
               'img:TipAchievement',
               'p:An achievement''s tooltip shows how it relates to other achievements and which of your characters have it. Each part can be turned off below.',
               'h:Icons',
               'li:✓|Completed.',
               'li:?|Not completed.',
               'li:✗|Can no longer be earned.',
               'h:Colors',
               'li:Green|Completed.',
               'li:Grey|Not completed.',
               'li:Red|Can no longer be earned.',
               'li:Lighter|The achievement under your mouse.',
               'li:Custom objectives|Some achievements get objectives of their own, like the sets of a transmog achievement.',
               'h:Earned By',
               'img:TipEarnedBy',
               'p:Which of your characters earned it, and which not. Achievements with a counterpart for the other faction count too.',
               'h:Categories',
               'img:TipCategory',
               'p:Earned (+ no longer obtainable) / total, by your filters. Red is the part you can no longer earn.',
               'h:Achievement points',
               'img:TipPoints',
               'p:Hover the points in the header to see them per character.') }
           explainFull = @{ title = 'Enhanced tooltip'; blocks = @(
               'img:TooltipAchievements',
               'p:Each tooltip has additional information on how achievements relate to each other (if they do). Several new sections are added to it.',
               'h:Features:',
               "li:Not Obtainable|Shows the text 'This achievement is no longer obtainable' if the achievement is no longer obtainable.",
               'li:Earned By|See Earned By below for more information.',
               'li:Part of a chain|Shows the list of achievements the hovered achievement is part of.',
               'li:Required for|Shows a list of achievements that require the hovered achievement to be completed in order to earn it.',
               "li:Other faction|Shows the related achievement of the other faction.",
               'li:Objectives progress|Shows the list of objectives with progress.',
               'li2:Custom objectives|Some achievements have custom objectives like the transmog achievements showing your progress towards the related transmog sets.',
               'h:Icons:',
               'li:✓|The achievement is completed.',
               'li:?|The achievement is not completed.',
               'li:✗|The achievement is not possible to obtain anymore.',
               'h:Colors:',
               'li:Green|The achievement/objective is completed.',
               'li:Grey|The achievement/objective is not completed.',
               'li:Red|The achievement is not possible to obtain anymore.',
               'li:Lighter Green, Grey or Red|The hovered achievement.',
               'p:More custom objectives can be requested on Discord or CurseForge (links under About).',
               'p:Optionally, two icons can be displayed per line. The first icon is the default one, the second one is for the current character.',
               'img:TooltipCategories',
               'h:Categories',
               'p:Each tooltip has additional information on how many achievements are (not) obtainable and (not) completed.',
               'p:The numbers in the progress bar are in the following format: OC (+NONC) / T',
               'li:OC|The (not) obtainable completed achievements.',
               'li:NONC|The not obtainable not completed achievements.',
               'li:T|Total number of achievements.',
               'li:Green|The (not) obtainable completed achievements.',
               'li:Red|The not obtainable not completed achievements.',
               'li:Empty|The obtainable not completed achievements.',
               'p:The red part of the progress bar and number in brackets can either be disabled below or by unchecking the Not Obtainable filter.',
               'img:EarnedBy',
               'h:Earned By',
               'li:Achievement points earned by|Display achievement points earned by your current character and/or by your account.',
               "li:Tooltip|Overview of which character has earned how many achievement points. Each character needs to be logged in at least once to be added to this list. Will show the character's realm if it's different.",
               "li:Earned By|Shows the characters that have earned this achievement. Faction exclusive achievements with a linked counterpart are taken into account. I.e. alliance characters might show up for horde achievements. Will show the character's realm if it's different.",
               'li:Not Earned By|Shows the characters that have not yet earned this achievement.') }
           alt = @{ TooltipAchievements = "An achievement's tooltip"; TooltipCategories = "A category's tooltip"; EarnedBy = 'Achievement points per character'; TipAchievement = "An achievement's tooltip"; TipCategory = "A category's tooltip"; TipPoints = 'Achievement points per character'; TipEarnedBy = 'Earned By in a tooltip' }
           groups = @(
               @{ header = 'Earned By'; items = @(@{ from = "$tip#Earned By / Not Earned By" }) },
               @{ header = 'Shown in the tooltip'; items = @(
                   @{ from = "$tip#Added in version" }, @{ from = "$tip#Rewards" }, @{ from = "$tip#Part of a chain" },
                   @{ from = "$tip#Required for" }, @{ from = "$tip#Other faction" }, @{ from = "$tip#Objectives progress" }) },
               @{ header = 'Most progress'; items = @(@{ from = "$tip#Most progress" }) },
               @{ header = 'Temporarily obtainable'; items = @(
                   @{ from = 'Layout > Achievements > Tooltip - Temporarily obtainable > Tooltip - Temporarily obtainable' },
                   @{ from = 'Layout > Achievements > Tooltip - Temporarily obtainable > Start Time & End Time' }) },
               @{ header = 'Achievement points tooltip'; items = @(
                   @{ from = 'Layout > Header > Tooltip' },
                   @{ p = 'Layout > Header > Tooltip > Sort priority > @Priority1'; label = 'Sort 1' },
                   @{ p = 'Layout > Header > Tooltip > Sort priority > @Reverse1'; label = 'Reverse'; indent = 1 },
                   @{ p = 'Layout > Header > Tooltip > Sort priority > @Priority2'; label = 'Sort 2' },
                   @{ p = 'Layout > Header > Tooltip > Sort priority > @Reverse2'; label = 'Reverse'; indent = 1 },
                   @{ p = 'Layout > Header > Tooltip > Sort priority > @Priority3'; label = 'Sort 3' },
                   @{ p = 'Layout > Header > Tooltip > Sort priority > @Reverse3'; label = 'Reverse'; indent = 1 }) }) },

        @{ id = 'rightclick'; name = 'Right-click menu'; tile = 'RightClickMenu'; summary = 'Wowhead links, Go To and the Watch List.'; showMe = 'opens the right-click menu of an achievement'
           explain = @{ title = 'Right-click menu'; blocks = @(
               'img:MenuMain',
               'li:Wowhead|A link to the achievement.',
               'li:Go To|The achievements in its chain, the ones it needs, and the other categories it is in.',
               'img:MenuGoTo',
               "li:Xu-Fu's Pet Guides|For pet battle achievements.",
               'li:Transmog sets|When it asks for a set.',
               'li:Guide|Waypoints for an achievement with a guide.',
               'li:More|Watch, unwatch, exclude or include it.') }
           explainFull = @{ title = 'Right Click Menu'; blocks = @(
               'img:RightClickMenu',
               'p:Each achievement in the new tabs have a Right Click Menu.',
               'h:Features:',
               'li:|Link to Wowhead.',
               'li:Go To|Shortcut to achievements that are part of a chain, that are required for this achievement to be completed or are also found under other categories. Achievements in the Current Zone category have a shortcut to their proper location in the categories tree.',
               "li:|Link to Xu-Fu's Pet Guides if the achievement is related to Pet Battles and Xu-Fu's Pet Guides has relevant information about it.",
               "li:|Link to transmog sets if the achievement's objective is to collect one.",
               'li:More|Groups misc. items to not clutter the main menu.',
               'li2:Add to Watch List|Add the achievement to the Watch List category. (Only available on not watched achievements).',
               'li2:Remove from Watch List|Remove the achievement from the Watch List category. (Only available on watched achievements).',
               'li2:Include|Includes the achievement back into the normal view. (Only available on excluded achievements).',
               'li2:Exclude|Excludes the achievement from the normal view. (Only available on included achievements).',
               'p:A button can be shown on each achievement that opens the Right Click Menu.') }
           alt = @{ RightClickMenu = 'The right-click menu of an achievement'; MenuMain = 'The right-click menu'; MenuGoTo = 'The Go To submenu' }
           groups = @(
               @{ header = 'Button'; items = @(@{ from = 'Layout > Right Click Menu > Button' }) },
               @{ header = 'Wowhead link'; items = @(@{ from = 'Layout > Right Click Menu > Wowhead Link' }) }) },

        @{ id = 'popout'; name = 'Pop Out'; summary = 'Achievements in a small window of their own.'; showMe = 'pops out an achievement you are working on'
           explain = @{ title = 'Pop Out'; blocks = @(
               'img:',
               'p:Ctrl-click an achievement to pop it out into a small window that stays on screen. Drag one Pop Out onto another to stack them.',
               'li:Close On Earn|A Pop Out closes by itself once you earn its achievement.') }
           groups = @(
               @{ header = 'Pop Outs'; items = @(@{ from = 'Layout > Pop Out > General' }) },
               @{ header = 'Buttons'; items = @(@{ from = 'Layout > Pop Out > Button' }) },
               @{ header = 'Appearance'; items = @(@{ from = 'Layout > Pop Out > Appearance' }) }) },

        @{ id = 'rewards'; name = 'Reward preview'; summary = 'See a reward before you earn it.'; showMe = 'opens the reward preview of a mount achievement'
           explain = @{ title = 'Reward preview'; blocks = @(
               'img:',
               'p:An icon on an achievement opens a preview of its reward. Drag the model to turn it, drag the corner to resize the window.') }
           groups = @(
               @{ header = 'Reward preview'; items = @(@{ from = "$style#Reward Preview" }) }) },

        @{ id = 'guides'; name = 'Achievement guides'; isNew = $true; summary = 'Step-by-step help with map pins.'; showMe = 'opens the guide of Legendary Research of the Ebon Blade'
           explain = @{ title = 'Achievement guides'; blocks = @(
               'img:',
               'p:Some achievements come with a guide: numbered steps with where to go, whom to talk to and what it costs. It shows in the tooltip, in the right-click menu and in a panel next to the achievement window.',
               'li:Map pin icon|Hover it to see the guide, click it to keep the panel open.',
               'li:Waypoints|A place in a guide gets a map pin or a TomTom waypoint in one click.') }
           groups = @(
               @{ header = 'Where guides show'; items = @(@{ from = "$style#Guide" }) }) },

        @{ id = 'calendar'; name = 'Calendar'; tile = 'Calendar'; summary = 'The achievements you earned, per day.'; showMe = 'opens the achievement calendar'
           explain = @{ title = 'Calendar'; blocks = @(
               'img:CalendarDays',
               'p:The achievements you earned, per day. The numbers on top count the month you see.',
               "li:Hover a day|Its achievements show in the window on the side.",
               'li:Click a day|Keeps the side window open, to scroll and click through.',
               'li:Arrow on a day|More than 4 that day.',
               'li:Scroll wheel|Previous or next month.') }
           explainFull = @{ title = 'Calendar'; blocks = @(
               'img:Calendar',
               'p:Identical look and feel to the calendar.',
               'li:|The number of achievements and points on top are the earned achievements and points for the current visible month, not all visible days.',
               'li:|Navigate to previous and next months by clicking the buttons on the top next to the month or by using the scroll wheel.',
               'li:|Mousing over a day will highlight it (day 11) and show the achievements (if any) earned on that day in the window on the side. When removing the mouse from the highlighted day, the window on the side will either close or show the achievements earned for the new day the mouse is over.',
               'li:|Clicking (selecting) a day will highlight it even brighter (day 18) and keep the window on the side open (lock). This allows for the user to scroll through the achievements, mouse over them to see the tooltip or click them to find them in the achievement window (will close the calendar). Selecting a day only works if achievements are earned on that day.',
               'li:|Clicking a selected day will deselect it and unlock the window on the side allowing it to act like a highlighted day again. Closing the window on the side by clicking on its close button will do the same.',
               'li:|An arrow on the day indicates more than 4 achievements were earned on that day.',
               'h:Options',
               'li:|When (re)opening the calendar, you can choose to always keep the last viewed month selected or only when clicking an achievement.',
               'li:|The first day of the week can be changed.') }
           alt = @{ Calendar = 'The achievement calendar with its side window'; CalendarDays = 'Days in the achievement calendar' }
           groups = @(
               @{ header = 'Calendar'; items = @(@{ from = 'Layout > Calendar > General' }, @{ from = 'Layout > Calendar > Weekdays' }, @{ from = 'Layout > Calendar > Side Window Mouse Wheel Scroll Speed' }) }) },

        @{ id = 'maps'; name = 'World map and minimap'; tile = 'WorldMapButton'; summary = 'Zone achievements from the world map.'; showMe = 'opens your world map'
           showMeNote = 'Opening the map from here can give blocked-action errors until your next /reload.'
           explain = @{ title = 'World map button'; blocks = @(
               'img:MapButton',
               "li:Hover|Counts the selected zone's achievements by your filters, like a category tooltip.",
               'li:Click|Opens the achievement window at that zone.',
               'p:The minimap icon opens the achievement window too.') }
           explainFull = @{ title = 'World Map Button'; blocks = @(
               'img:WorldMapButton',
               'h:Hover:',
               'li:|Shows how many achievements are (not) obtainable and (not) completed like the category tooltip, based on the filters set for the Selected Zone.',
               'li:|See Tooltips and Filtering and sorting for more information.',
               'h:Click:',
               'li:|Opens the achievements window to the Selected Zone category.') }
           alt = @{ WorldMapButton = 'The world map button with its tooltip'; MapButton = 'The world map button with its tooltip' }
           groups = @(
               @{ header = 'World map'; items = @(@{ from = 'General > Icon > World Map' }) },
               @{ header = 'Minimap'; items = @(@{ from = 'General > Icon > Minimap' }) }) },

        @{ id = 'criteria'; name = 'Criteria on units'; summary = 'Criteria on the tooltips of units.'; showMe = 'shows a sample unit tooltip with its criteria line'
           explain = @{ title = 'Criteria on units'; blocks = @(
               'img:',
               "p:A unit's tooltip names the achievement criteria it counts for, like a critter you still have to /love.") }
           groups = @(
               @{ header = 'Unit tooltips'; items = @(@{ from = 'Layout > Criteria > Tooltip#' }) },
               @{ header = 'Show criteria if'; items = @(@{ from = 'Layout > Criteria > Tooltip#Show Criteria If'; parentP = 'Layout > Criteria > Tooltip > Show Criteria' }) }) },

        @{ id = 'events'; name = 'Event reminders'; tile = 'EventReminder'; summary = 'Pop ups for holidays and world events.'; showMe = 'shows placeholder reminders where yours appear'
           explain = @{ title = 'Event reminders'; blocks = @(
               'img:Reminders',
               'p:Holidays and world events get a reminder that pops up while they are on, and a button on the side of the achievement window.',
               "li:Click|Opens the event's achievements you can earn now.",
               'li:Right-click|Hides it. It also fades out by itself.',
               'li:Time|One or two lines with the end time or the time left; Compact shows one.') }
           explainFull = @{ title = 'Event Reminder'; blocks = @(
               'img:EventReminder',
               'p:Events are added to the new Events tab and a reminder will pop up (max 5 at the same time) when one of the events is active.',
               'p:The event reminder has the name of the event and up to 2 lines of time display (end time of the event).',
               'p:The format of the time display can be chosen from presets or custom made.',
               'p:A compact version exists with a single line for time display.',
               'p:Clicking it will open the category with the obtainable achievements while the event is active.',
               "p:It will disappear when right clicked or after 10 seconds when ignored.",
               'p:The reminder is also present on the right side of the achievement window.',
               'h:Event types:',
               'li:Calendar events|(e.g.: Holidays).',
               'li:Widget events|(e.g.: Torghast).',
               'li:World events|(e.g.: Assaults).') }
           alt = @{ EventReminder = 'Event reminders on screen'; Reminders = 'Event reminders on screen' }
           groups = @(
               @{ header = 'Reminders'; items = @(@{ from = 'Event Reminders > General > Style' }) },
               @{ header = 'Time display'; items = @(@{ from = 'Event Reminders > General > Time display' }) },
               @{ header = 'Pop ups for active events'; kind = 'matrix'; chain = $true; cols = @('Show', 'In instances', 'Only with a time'); rows = @(
                   @{ label = 'On login'; from = "$popAct > On Login"; desc = 'When you log in.' },
                   @{ label = 'On reload'; from = "$popAct > On Reload"; desc = 'After a /reload.' },
                   @{ label = 'When an event starts'; from = "$popAct > On Event Start"; desc = 'When an event starts while you play.' }) },
               @{ header = 'Pop ups for upcoming calendar events'; kind = 'matrix'; chain = $true; cols = @('Show', 'In instances'); rows = @(
                   @{ label = 'On login'; from = "$popUp > On Login"; desc = 'When you log in.' },
                   @{ label = 'On reload'; from = "$popUp > On Reload"; desc = 'After a /reload.' },
                   @{ label = 'When an event starts'; from = "$popUp > On Event Start"; desc = 'When an event starts while you play.' }) },
               @{ header = 'Pop up position'; items = @(@{ from = 'Event Reminders > Pop ups > Location'; btn = 'Show' }) },
               @{ header = 'Pop up behaviour'; items = @(@{ from = 'Event Reminders > Pop ups > Other' }) },
               @{ header = 'Chat messages for active events'; kind = 'matrix'; chain = $true; cols = @('Show', 'In instances', 'Only with a time'); rows = @(
                   @{ label = 'On login'; from = "$chatAct > On Login"; desc = 'When you log in.' },
                   @{ label = 'On reload'; from = "$chatAct > On Reload"; desc = 'After a /reload.' },
                   @{ label = 'When an event starts'; from = "$chatAct > On Event Start"; desc = 'When an event starts while you play.' }) },
               @{ header = 'Chat messages for upcoming calendar events'; kind = 'matrix'; chain = $true; cols = @('Show', 'In instances'); rows = @(
                   @{ label = 'On login'; from = "$chatUp > On Login"; desc = 'When you log in.' },
                   @{ label = 'On reload'; from = "$chatUp > On Reload"; desc = 'After a /reload.' },
                   @{ label = 'When an event starts'; from = "$chatUp > On Event Start"; desc = 'When an event starts while you play.' }) },
               @{ header = 'Timing'; items = @(@{ from = 'Event Reminders > General > Other' }) },
               @{ header = 'Date and time format'; items = @(@{ from = 'Event Reminders > Date and Time format > Start Time & End Time' }) }) },

        @{ id = 'eventlist'; name = 'Reminder events'; isNew = $true; summary = 'Pick the events you want reminders for.'; showMe = 'shows a placeholder reminder for each event you have on'
           explain = @{ title = 'Which events'; blocks = @(
               'img:',
               'p:Turn reminders off for the events you do not care about. World events are listed per expansion.',
               "li:Curse Surges|New in 104.0: reminders wherever you are, with the surge's name and time left.") }
           groups = @(
               @{ header = 'Holidays'; allNone = 'All holidays'; items = @(@{ from = 'Event Reminders > Calendar Events > Holidays' }) },
               @{ header = 'Other calendar events'; allNone = 'All other calendar events'; items = @(@{ from = 'Event Reminders > Calendar Events > Other' }) },
               @{ header = 'World events: Midnight'; items = @(@{ families = 'Event Reminders > World Events > Midnight' }) },
               @{ header = 'World events: The War Within'; items = @(@{ families = 'Event Reminders > World Events > The War Within' }) },
               @{ header = 'World events: Dragonflight'; items = @(@{ families = 'Event Reminders > World Events > Dragonflight' }) },
               @{ header = 'World events: Shadowlands'; items = @(@{ families = 'Event Reminders > World Events > Shadowlands' }) },
               @{ header = 'World events: Battle for Azeroth'; items = @(@{ families = 'Event Reminders > World Events > Battle for Azeroth' }) },
               @{ header = 'World events: Legion'; items = @(@{ families = 'Event Reminders > World Events > Legion' }) }) },

        @{ id = 'keys'; name = 'Keys and clicks'; summary = 'Key bindings and click modifiers.'
           explain = @{ title = 'Keys and clicks'; blocks = @(
               'img:',
               'p:Key bindings for each tab and for the Current Zone category, two keys each. Click modifiers set what a click with Shift, Ctrl or Alt does on an achievement.') }
           groups = @(
               @{ header = 'Click modifiers'; items = @(@{ from = 'General > Key Binding > General > Modifiers' }) },
               @{ header = "Blizzard's tabs"; items = @(@{ from = "General > Key Binding > Keybindings > Tabs#Blizzard" }) },
               @{ header = "This addon's tabs"; items = @(@{ from = "General > Key Binding > Keybindings > Tabs#Krowi's Achievement Filter" }) },
               @{ header = 'Categories'; items = @(@{ from = 'General > Key Binding > Keybindings > Custom' }) }) },

        @{ id = 'plugins'; name = 'Other addons'; summary = 'Fixes and skins for other addons.'
           explain = @{ title = 'Other addons'; blocks = @(
               'img:',
               'p:Fixes for other addons, and the skins of ElvUI, GW2 UI and EllesmereUI. A skin is turned on or off in that addon; it is listed here so you can see what is on.') }
           groups = @(
               @{ header = 'ElvUI'; items = @(@{ from = 'Plugins > ElvUI' }); notesFromTree = $true; joiner = ' '; lockAll = $true; defAll = $true },
               @{ header = 'GW2 UI'; items = @(@{ from = 'Plugins > GW 2 UI' }); note = 'Each of the options below is set in GW2 UI and shown here for reference.'; lockAll = $true; defAll = $false },
               @{ header = 'EllesmereUI'; items = @(@{ from = 'Plugins > EllesmereUI' }); notesFromTree = $true; joiner = ' '; lockAll = $true; defAll = $false },
               @{ header = 'Achievements Tab Fixes'; items = @(@{ from = 'Plugins > Achievements Tab Fixes' }); notesFromTree = $true; joiner = ' ' },
               @{ header = 'Instance Achievement Tracker'; items = @(@{ from = 'Plugins > Instance Achievement Tracker' }); notesFromTree = $true; joiner = ' ' },
               @{ header = 'Better Wardrobe'; items = @(@{ from = 'Plugins > Better Wardrobe' }); notesFromTree = $true; joiner = ' ' },
               @{ header = 'Zygor Guides Viewer'; items = @(@{ from = 'Plugins > Zygor Guides Viewer' }); notesFromTree = $true; joiner = ' ' }) },

        @{ id = 'profiles'; name = 'Profiles'; summary = 'Share settings between characters.'
           explain = @{ title = 'Profiles'; blocks = @(
               'img:',
               'p:Settings and filters each keep their own profile. Share one between characters, or give a character a profile of its own.') }
           groups = @((Profile-Group 'Settings profile' 'Options'), (Profile-Group 'Filters profile' 'Filters')) },

        @{ id = 'advanced'; name = 'Advanced'; summary = 'Testing and bug reports.'
           explain = @{ title = 'Advanced'; blocks = @(
               'img:',
               'p:Tools for testing new content and for reporting bugs. You do not need them to use the addon.',
               'p:Turn on debug info to see the tools for adding new content.') }
           groups = @(
               @{ header = 'Experimental'; items = @(@{ from = 'General > Experimental > Experimental' }) },
               @{ header = 'Debug'; items = @(@{ from = 'General > Debug > Debug' }); notesFromTree = $true; joiner = ' '
                  devNames = @('Enable trace info', 'Export Criteria', 'Show placeholders filter', 'Export Missing Achievements', 'Print map info', 'Export Removed Achievements', 'Print map info w/o reload', 'Export to CSV', 'Map Verifier'); devSwitch = 'Enable debug info' }) },

        @{ id = 'about'; name = 'About'; summary = 'Version, links and credits.'
           explain = @{ title = "Krowi's Achievement Filter"; blocks = @(
               'img:',
               'p:Version 104.0 for game build 12.1.5, by Krowi on Frostmane (EU).',
               'p:Questions, bugs and ideas are welcome on Discord.') }
           groups = @(
               @{ header = 'Links'; items = @(
                   @{ p = 'General > Info > General > Discord'; btn = 'Discord' },
                   @{ p = 'General > Info > Sources > CurseForge'; btn = 'CurseForge' },
                   @{ p = 'General > Info > Sources > Wago'; btn = 'Wago' }) },
               @{ header = 'Special thanks'; items = @(@{ from = 'Credits > Special thanks' }); notesFromTree = $true; joiner = "`n" },
               @{ header = 'Donations'; items = @(@{ from = 'Credits > Donations' }); notesFromTree = $true; joiner = "`n" },
               @{ header = 'Translations'; items = @(@{ from = 'Credits > Localizations' }); notesFromTree = $true; joiner = "`n" }) }
    )
}