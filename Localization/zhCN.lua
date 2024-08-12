local addonName, addon = ...;
local L = LibStub(addon.Libs.AceLocale):NewLocale(addonName, "zhCN");
if not L then return end
addon.L = L;

addon.Plugins:LoadLocalization(L);

-- [[ https://legacy.curseforge.com/wow/addons/krowi-achievement-filter/localization ]] --
-- [[ Everything after this line is automatically generated from CurseForge and is not meant for manual edit - SOURCETOKEN - AUTOGENTOKEN ]] --

-- [[ Exported at 2024-08-12 15-07-39 ]] --
L["%c"] = true
L["%d/%m/%Y %I:%M %p"] = true
L["%m/%d/%Y %I:%M %p"] = true
L["%m/%d/%Y %R"] = true
L["%Y/%m/%d %I:%M %p"] = true
L["%Y/%m/%d %R"] = true
L["10th Anniversary"] = "10周年"
L["450 skill"] = "450点技能"
L["525 skill"] = "525点技能"
L["600 skill"] = "600点技能"
L["Academy Ascent"] = "学院爬升赛"
L["Account"] = "账号"
L["Account wide (default)"] = "账号（默认）"
L["Achievement browsing history"] = "成就浏览历史"
L["Achievement Calendar"] = "成就日历"
L["Achievement is Completed"] = "成就已获得"
L["Achievement is Completed Desc"] = "成就已获得时仍然显示成就要求"
L["Achievement is excluded"] = "该成就已隐藏"
L["Achievement is watched"] = "该成就在{watchList}"
L["Achievement points earned by"] = "已获得成就点数"
L["Achievement shown temporarily"] = "该成就为临时显示，不匹配当前过滤器设置"
L["Achievement was Not Earned by Me"] = "非当前角色获得"
L["Achievement was Not Earned by Me Desc"] = "非当前角色获得成就时显示成就要求"
L["Achievement Window"] = "成就界面"
L["Achievement window height offset"] = "成就界面高度"
L["Achievement window height offset Desc"] = [=[在默认基础上增加或减少成就界面高度

该数值可在成就界面打开并选中{addonName}标签的情况下调整，这样可能会对游戏造成影响(1)

(1)仅在调整数值时可能出现掉帧和卡顿，不影响正常游戏]=]
L["Achievements"] = "成就"
L["Achievements width offset"] = "成就宽度"
L["Achievements width offset Desc"] = [=[在默认基础上增加或减少成就宽度

该数值可在成就界面打开并选中{addonName}标签的情况下调整，这样可能会对游戏造成影响(1)

(1)仅在调整数值时可能出现掉帧和卡顿，不影响正常游戏]=]
L["Active"] = "激活"
L["Active events"] = "激活事件"
L["Add addon name to world map icon"] = "图标添加插件名称"
L["Add addon name to world map icon Desc"] = "鼠标悬停时在图标底部显示'{addonName}'"
L["Add Locale"] = "添加本地域名"
L["Add Locale Desc"] = "为{wowheadLink}添加客户端对应语言的域名"
L["Add to / Remove from Watch List"] = "添加/移除关注"
L["Add to Watch List"] = "关注"
L["Added in version"] = "添加版本"
L["Adjustable Categories"] = "可调整类别"
L["Aki the Chosen"] = "天选者亚济"
L["Alt"] = true
L["Always Show Completed"] = "总是显示已获得"
L["Always show realm"] = "总是显示服务器"
L["Always show realm Desc"] = "总是显示角色的服务器信息，无论是否与当前角色处于同一服务器"
L["Amathet"] = "阿玛赛特"
L["Andurs"] = "安杜斯"
L["Apex Canopy River Run"] = "绝顶树冠激流冲刺"
L["Aqir"] = "亚基"
L["Archive Ambit"] = "档案限界"
L["Are you sure you want to delete character?"] = "确认要删除{character}？登录该角色将重新添加。如果不希望看到该角色，请勾选{ignore}"
L["Assault on Azsuna"] = "突袭阿苏纳"
L["Assault on Drustvar"] = "德鲁斯瓦突袭"
L["Assault on Highmountain"] = "突袭至高岭"
L["Assault on Nazmir"] = "纳兹米尔突袭"
L["Assault on Stormheim"] = "突袭风暴峡湾"
L["Assault on Stormsong Valley"] = "斯托颂谷地突袭"
L["Assault on Tiragarde Sound"] = "提拉加德海峡突袭"
L["Assault on Val'sharah"] = "突袭瓦尔莎拉"
L["Assault on Vol'dun"] = "沃顿突袭"
L["Assault on Zuldazar"] = "祖达萨突袭"
L["Assault: Amathet"] = "突袭: 阿玛赛特进军"
L["Assault: Aqir"] = "突袭: 亚基重现"
L["Assault: Mantid"] = "突袭: 无尽虫群"
L["Assault: Mogu"] = "突袭: 战争氏族"
L["Assault: N'Zoth (Uldum)"] = "突袭: 黑暗帝国（奥丹姆）"
L["Assault: N'Zoth (Vale of Eternal Blossoms)"] = "突袭: 黑暗帝国（锦绣谷）"
L["Author"] = "作者"
L["Auto number of summary achievements"] = "自动调整成就汇总数量"
L["Auto number of summary achievements Desc"] = "自动调整显示的成就汇总数量，不再显示滚动条"
L["Awakened Raids"] = "觉醒团队副本"
L["Awakening the Machine"] = "主机觉醒"
L["Azerothian Archives"] = "艾泽拉斯档案馆"
L["Azsuna"] = "阿苏纳"
L["Azure Span"] = "碧蓝林海"
L["Azure Span: Next"] = "碧蓝林海: 下次"
L["Blizzard"] = "暴雪"
L["BlizzCon"] = "暴雪嘉年华"
L["Brackenhide Hollow"] = "蕨皮山谷"
L["Brawler's Guild"] = "搏击俱乐部"
L["Brewfest"] = "美酒节"
L["Broken Isles Cup"] = "破碎群岛杯"
L["Build"] = "客户端版本"
L["Buildings"] = "建筑"
L["Burning Pandaren Spirit"] = "熊猫人烈焰之灵"
L["Bur's Mount Collection"] = "坐骑收集"
L["Button"] = "按钮"
L["Calendar"] = "日历"
L["Calendar button"] = "日历按钮"
L["Calendar button horizontal position Desc"] = "调整{calendarButton}垂直位置"
L["Calendar button vertical position Desc"] = "调整{calendarButton}水平位置."
L["Calendar Desc"] = [=[与{calendar}相似

|T:1:8|t- 最上方的成就数量和点数为当前页面所在月份内获得，而非显示的所有日期
|T:1:8|t- 点击最上方月份旁的按钮或使用滚轮切换月份
|T:1:8|t- 高亮显示鼠标悬停日期（11日）并在右侧显示当日获得的成就，鼠标移开后将关闭右侧窗口或显示移动后悬停日期内的成就
|T:1:8|t- 更高亮显示鼠标点击的日期（18日）并保持右侧窗口（锁定），可以上下滚动查看成就、悬停鼠标查看提示或点击跳转至成就界面（将关闭日历窗口），仅可选中获得过成就的日期
|T:1:8|t- 点击选中日期将取消选择并解锁右侧窗口，也可点击右侧窗口的关闭按钮取消选择
|T:1:8|t- 日期上的箭头标志表示当日获得过4个以上成就

设置(1)
|T:1:8|t- 打开日历时可以选择总是保留关闭前的月份（{lockMonth}）或仅在因点击成就而关闭时保留（{lockAchievementMonth}）
|T:1:8|t- 可以更改每周的第一天，当前设置为{firstWeekDay}

(1) {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {calendar}]=]
L["Calendar Events"] = "日历事件"
L["Call of the Crusade"] = "北伐的召唤"
L["Cataclysm (pre-patch)"] = "大地的裂变（前夕）"
L["Categories"] = "类别"
L["Categories not loaded"] = [=[{addonName}未完全加载
重新打开成就界面刷新类别]=]
L["Categories width offset"] = "类别宽度"
L["Categories width offset Desc"] = [=[在默认基础上增加或减少类别宽度

该数值可在成就界面打开并选中{addonName}标签的情况下调整，这样可能会对游戏造成影响(1)

(1)仅在调整数值时可能出现掉帧和卡顿，不影响正常游戏]=]
L["Category shown temporarily"] = "该类别由点击{eventName}事件提醒时选中。当前过滤器设置下无可用成就，仅为临时显示"
L["Caverns Criss-Cross"] = "交错洞窟"
L["Center Header"] = "页眉居中"
L["Center header"] = "页眉居中"
L["Center header Desc"] = "成就界面的页眉保持居中"
L["Center Header Desc"] = "居中成就按钮的成就名称"
L["Central Circuit"] = "中央赛道"
L["Chains of Domination"] = "统御之链"
L["Character / Account wide"] = "角色 / 账号"
L["Character only"] = "仅角色"
L["Characters"] = "角色"
L["Chat messages"] = "聊天信息"
L["Checked"] = "开启"
L["Children's Week"] = "儿童周"
L["Class Hall"] = "职业大厅"
L["Clear all"] = "全部清除"
L["Clear all Desc"] = "清除所有已关注成就"
L["Clear search field on Right Click"] = "右键清除搜索框"
L["Clear search field on Right Click Desc"] = "启用/禁用右键清除搜索框"
L["Click here to view in achievement window"] = "点击查看成就界面"
L["Click here to view in achievements"] = "点击查看成就"
L["Cliffside Circuit"] = "山崖环道"
L["Cobalt Assembly"] = "钴蓝集所"
L["Coldheart Interstitia"] = "凇心间隙"
L["Collapse Chain"] = "合并系列成就"
L["Collecting data"] = "正在收集数据"
L["Collector's Edition"] = "典藏版"
L["Comments"] = "评论"
L["Community Feast"] = "社区盛宴"
L["Community Feast: Active"] = "社区盛宴: 激活"
L["Community Feast: Cooking"] = "社区盛宴: 烹饪中"
L["Community Feast: Next"] = "社区盛宴: 下次"
L["Community Feast: Ready"] = "社区盛宴: 已结束"
L["Community Feast: Soon"] = "社区盛宴: 即将"
L["Community Feast: Starting Soon"] = "社区盛宴: 即将开始"
L["Compact"] = "紧凑"
L["Compact Achievements"] = "紧凑成就"
L["Compact Achievements Desc"] = "成就尺寸减小至2/3，与总览中的近期成就一致"
L["Compact Achievements T Desc"] = [=[- 成就尺寸减小至2/3，与总览中的近期成就一致
- 仅显示成就描述的第一行或成就奖励

可在设置(1)启用紧凑成就（{compactEnabled}）

(1) {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}]=]
L["Compact Desc"] = [=[使用仅显示单行时间的紧凑版本

{reloadRequired}]=]
L["Completion"] = "获得"
L["Covenant"] = "盟约"
L["Covenant Assaults"] = "盟约突袭"
L["Covenant assaults"] = "盟约突袭"
L["Credits"] = "致谢"
L["Criteria"] = "成就要求"
L["Criteria Behaviour"] = "条件文本处理"
L["Criteria Behaviour Desc"] = [=[条件文本过长时的处理方式

|T:1:8|t- {overflow}: 文本正常显示，可能会造成文本重叠
|T:1:8|t- {truncate}: 截断过长的文本并在末尾显示'…'
|T:1:8|t- {flexible}: 文本过长的条件将单独显示在一行]=]
L["Criteria is Completed"] = "要求已达成"
L["Criteria is Completed Desc"] = "成就要求已达成时仍然显示"
L["Criteria of"] = "条件信息"
L["Cross-Expansion"] = "跨资料片"
L["Cross-Expansion - Delves"] = "跨资料片 - 地下堡"
L["Ctrl"] = true
L["Current Obtainable"] = "当前可得"
L["Current Zone"] = "当前区域"
L["CurseForge"] = true
L["CurseForge Desc"] = "提供{addonName}的{curseForge}页面链接"
L["Custom"] = "自定义"
L["Dark Heart"] = "黑暗之心"
L["Darkmoon Faire"] = "暗月马戏团"
L["Data Manager"] = "数据管理"
L["Date and Time format"] = "日期和时间格式"
L["Date and Time formatting guide"] = "日期和时间格式指南"
L["Date and Time formatting guide Desc"] = [=[{a} - 周（英文缩写）（Sat）
{A} - 周（英文全称）（Saturday）
{b} - 月（英文缩写）（Oct）
{B} - 月（英文全称）（October）
{c} - 日期和时间（本地习惯）（Sat Oct 1 10:00:00 2022）
{C} - 世纪（年份/100）（21）
{d} - 日/月（01 - 31）
{D} - 等同于%m/%d/%y（10/01/22）
{e} - 日/月（1 - 31）
{H} - 24小时制（00 - 23）
{I} - 12小时制（01 - 12）
{j} - 日/年（001 - 366）
{k} - 24小时制（0 - 23）
{l} - 12小时制（1 - 12）
{m} - 月（01 - 12）
{M} - 分钟（00 - 59）
{p} - AM/PM（本地习惯）（AM/PM）
{P} - AM/PM（本地习惯）（am/pm）
{R} - 等同于%H:%M（10:00）
{s} - Unix时间戳（1664589600）
{S} - 秒（00 - 59）
{u} - 周（数字）（1 - 7；1为周一）
{U} - 周/年（数字）（00 - 53；周日为每周第一天）
{w} - 周（数字）（0 - 6；0为周日）
{W} - 周/年（数字）（00 - 53；周一为每周第一天）
{x} - 日期（本地习惯）（10/01/22）
{X} - 时间（本地习惯）（10:00:00）
{y} - 年（部分）（00 - 99）
{Y} - 年（完整）（2022）
{z} - GMT时区（+800）
{Z} - 时区名称或缩写（未知时区不显示）]=]
L["Day of the Dead"] = "悼念日"
L["Debug"] = "调试"
L["Debug Desc"] = "下列所有选项仅用于调试，启用后请自行承担后果！"
L["Default value"] = "默认值"
L["Defending Azeroth Assaults"] = "黑暗帝国突袭"
L["Defending the Ruby Sanctum"] = "保卫红玉圣殿"
L["Deselect All"] = "全部取消"
L["Diablo"] = "暗黑破坏神"
L["Diablo III"] = "暗黑破坏神III"
L["Diablo IV"] = "暗黑破坏神IV"
L["Discord"] = true
L["Discord Desc"] = "提供{serverName}的Discord服务器链接。可以加入其中发表评论、反馈、想法和其他相关话题"
L["Donations"] = "赞助"
L["Dos-Ryga"] = "多斯里加"
L["Down"] = "下"
L["Dragon Glyphs"] = "巨龙魔符"
L["Dragon Racing"] = "驭龙竞速"
L["Dragonbane Keep"] = "灭龙要塞"
L["Dragonblight"] = "龙骨荒野"
L["Dragonflight (pre-patch)"] = "巨龙时代（前夕）"
L["Dragonriding"] = "驭龙术"
L["Dragonriding Races"] = "驭龙术比赛"
L["Dreamsurge"] = "梦涌"
L["Dreamsurges"] = "梦涌"
L["Drops"] = "战利品"
L["Drustvar"] = "德鲁斯瓦"
L["Dueler's Guild"] = "决斗俱乐部"
L["during"] = "- 限定"
L["Dustwallow Marsh"] = "尘泥沼泽"
L["Earned By"] = "已获得"
L["Earned By Desc"] = [=[Header
|T:1:8|t- {achievementPointsEarnedBy}: Display {achievementPointsEarnedBy_wc} your current character and/or {achievementPointsEarnedBy_wc} your account ({achievementPointsEarnedByFormat}) (1).
|T:1:8|t- {tooltip}: Overview of which character has earned how many achievement points. Each character needs to be logged in at least once to be added to this list. Will show the character's realm if it's different. Can be forced to always show from the options (1).

Filters
|T:1:8|t- {account}: Achievements are saturated if earned on any character on your account (default).
|T:1:8|t- {character}: Achievements are saturated if earned by your current character and partially saturated if earned on another character on your account but not by the current one.

Tooltip
|T:1:8|t- {earnedBy}: Shows {earnedByNumber} characters that have earned this achievement (2). Faction exclusive achievements with a linked counterpart are taken into account. I.e. alliance characters might show up for horde achievements. Will show the character's realm if it's different. Can be forced to always show from the options (2).
|T:1:8|t- {notEarnedBy}: Shows {notEarnedByNumber} characters that have not yet earned this achievement (2). Faction exclusive achievements with a linked counterpart are taken into account. I.e. alliance characters might show up for horde achievements. Will show the character's realm if it's different. Can be forced to always show from the options (2).

(1) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {header}
(2) Options can be found under {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}]=]
L["Eastern Kingdoms Cup"] = "东部王国杯"
L["Echoes of Doom"] = "末日回响"
L["Emberflow Flight"] = "烬琉航线"
L["Embers of Neltharion"] = "奈萨里奥的余烬"
L["Emerald Garden Ascent"] = "翡翠花园攀升赛"
L["Enable"] = "启用"
L["Enable debug info"] = "启用调试信息"
L["Enable debug info Desc"] = "启用/禁用调试信息"
L["Enable Desc"] = "启用/禁用插件。插件未加载时启用，可能会发生错误"
L["Enable trace info"] = "启用追踪信息"
L["Enable trace info Desc"] = "启用/禁用追踪信息"
L["End Time"] = "结束时间"
L["Enhanced filtering and sorting"] = "增强的过滤器和排序"
L["Enhanced filtering and sorting Desc"] = [=[成就的过滤器和排序添加下列特性

类别: 
|T:1:8|t- {mergeSmallCategories}: 合并低于{mergeSmallCategoriesNumber}个成就的类别(1)

过滤（可同时选择多个过滤器）: 
|T:1:8|t- {completed}: 显示已获得的成就
|T:1:8|t- {notCompleted}: 显示未获得的成就
|T:1:8|t- {obtainable}: 显示可获得的成就
|T:1:8|t- {notObtainable}: 显示绝版的成就
|T:1:8|t- {faction} （{resetFactionFilters} {resetFactionFiltersEnabled}）(2)
|T:1:8|t|T:1:8|t- {neutral}: 显示{alliance_wc}和{horde_wc}都可获得的成就
|T:1:8|t|T:1:8|t- {alliance}: 显示仅{alliance_wc}可获得的成就
|T:1:8|t|T:1:8|t- {horde}: 显示仅{horde_wc}可获得的成就
|T:1:8|t- {excluded}: 显示已隐藏的成就
|T:1:8|t- {collapseChain}: 仅显示系列成就中最后获得和首个未获得的成就

排序: 
|T:1:8|t- {noSorting}: 默认排序
|T:1:8|t- {sortByName}: 根据成就名称排序
|T:1:8|t- {sortByCompletion}: 根据成就是否获得排序
|T:1:8|t- {sortByID}: 根据成就ID排序
|T:1:8|t- {reverseSort}: 勾选后反转成就排序

{tabs}: 
|T:1:8|t- 具有上述所有过滤器和排序功能，每个标签可以独立设置
|T:1:8|t- 更改上述设置将覆盖标签的独立设置

{specialCategories}:
|T:1:8|t- 具有上述所有过滤器和排序功能，每个标签可以独立设置

{earnedBy}（查看{earnedByTutorial}教程了解更多细节）: 
|T:1:8|t- {account}: 账号上任意角色获得成就均可点亮
|T:1:8|t- {character}: 仅当前角色获得成就才能点亮，其他角色获得时半点亮

其他: 
|T:1:8|t- {help}: 从头开始并重置教程
|T:1:8|t|T:1:8|t- 显示指定教程页面且不重置教程
|T:1:8|t- {options}: 打开插件设置(2)

更多过滤器和排序设置可在{discord}或{curseForge}中提出需求（链接在设置中）

(1) {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}
(2) {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName}]=]
L["Enhanced tooltip"] = "增强的鼠标提示"
L["Enhanced tooltip Achievements Desc"] = [=[在鼠标提示中添加几种新的成就关联信息

特性: 
|T:1:8|t- {notObtainable}: 绝版成就显示'{noLongerObtainable}'
|T:1:8|t- {earnedBy}: 查看{earnedBy}教程了解更多细节
|T:1:8|t- {partOfAChain}: 显示鼠标悬停成就所在的系列成就列表(1)（{partOfAChainEnabled}）(2)
|T:1:8|t- {requiredFor}: 显示鼠标悬停成就作为成就条件的所属成就列表(1)（{requiredForEnabled}）(2)
|T:1:8|t- {otherFaction}: 显示其他阵营的关联成就（{otherFactionEnabled}）(2)
|T:1:8|t- {objectivesProgress}: 显示目标进度列表（{objectivesProgressEnabled}）(2)
|T:1:8|t|T:1:8|t- 自定义目标: 部分成就包含自定义目标，例如外观成就将显示对应外观的收集进度

图标: 
|T:1:8|t- {ready}: 成就已获得
|T:1:8|t- {waiting}: 成就未获得
|T:1:8|t- {notready}: 成就已绝版

颜色: 
|T:1:8|t- {green}: 成就/目标已获得
|T:1:8|t- {grey}: 成就/目标未获得
|T:1:8|t- {red}: 成就已绝版
|T:1:8|t- 更浅的{lightGreen}/{lightGrey}/{lightRed}: 鼠标悬停处的成就

更多自定义目标可在{discord}或{curseForge}中提出需求（链接在设置中）

(1) （可选）每行可显示两个图标: 第一个为默认图标，第二个为当前角色图标（{currentCharacterIconEnabled}）(2)
(2) {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {achievements}]=]
L["Enhanced tooltip Categories Desc"] = [=[在鼠标提示中添加可获得/绝版和已获得/未获得的成就数量信息

进度条中的数字格式如下: 
|T:1:8|tOC (+NONC) / T
|T:1:8|t|T:1:8|t- {oc}: 已获得的成就
|T:1:8|t|T:1:8|t- {nonc}: 未获得的绝版成就(1)
|T:1:8|t|T:1:8|t- T: 成就总数

颜色: 
|T:1:8|t- {green}: 已获得的成就
|T:1:8|t- {red}: 未获得的绝版成就(1)
|T:1:8|t- 空白: 未获得的可获得成就

进度条{red}部分和括号内的数字可由设置（{showNotObtainable}）(1)或取消勾选{notObtainable}过滤器关闭

(1) {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}]=]
L["Error Tabs Order"] = "{blizzard}的{statistics}标签不能放在{guild}之前"
L["Escalation"] = "绝地反击"
L["Eternity's End"] = "永恒之尽"
L["Event Reminder"] = "事件提醒"
L["Event Reminder Desc"] = [=[添加{events}至新的{events}标签，在事件活跃时弹窗提醒（同时最多{numPopUps}个）（{popUpEnabled}）(1)

事件提醒包含名称及最多2行结束时间信息(1)
时间格式可选择预设或自定义(1)
紧凑版本仅显示单行时间（{compactEnabled}）(1)

点击弹窗会打开包含可获得成就的对应类别
点击右键或忽略{eventAlertFadeDelay}秒将关闭弹窗(1)

提醒也显示在成就界面右侧

事件类型: 
|T:1:8|t- 日历事件（节日）
|T:1:8|t- 小型事件（托加斯特）
|T:1:8|t- 世界事件（突袭）

(1) {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {eventReminders}]=]
L["Event Reminders"] = "事件提醒"
L["Events"] = "事件"
L["Exclude"] = "隐藏"
L["Exclude Excluded achievements"] = "排除已隐藏成就"
L["Exclude Excluded achievements Desc"] = "在搜索结果中排除/包含已隐藏成就"
L["Excluded"] = "已隐藏"
L["Expansions"] = "资料片"
L["Expansions tab"] = "资料片标签"
L["Expansions tab Desc"] = [=[将成就按不同资料片进行分类并优化结构

结构如下: 
|T:1:8|t- {expansion}
|T:1:8|t|T:1:8|t- {zones}
|T:1:8|t|T:1:8|t|T:1:8|t- {quests}
|T:1:8|t|T:1:8|t|T:1:8|t- {exploration}
|T:1:8|t|T:1:8|t|T:1:8|t- {pvp}
|T:1:8|t|T:1:8|t|T:1:8|t- {reputation}
|T:1:8|t|T:1:8|t- {dungeons}
|T:1:8|t|T:1:8|t- {raids}
|T:1:8|t|T:1:8|t- {petBattles}
|T:1:8|t|T:1:8|t- {expansionFeatures}

特殊类别: 
|T:1:8|t- {currentZone}: 显示与当前区域关联的成就
|T:1:8|t- {selectedZone}: 显示与世界地图选中区域关联的成就
|T:1:8|t- {watchListCategory}: 显示已关注成就，可以设置(1)是否显示子类
|T:1:8|t- {excludedCategory}: 显示已关注成就，可以设置(1)是否显示子类，可以在设置(1)中永久隐藏

(1) {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {categories}]=]
L["Export"] = "导出"
L["Export Criteria"] = "导出要求"
L["Export Criteria Desc"] = "导出成就要求至SavedVariables，用于添加新内容"
L["Faction Assaults"] = "阵营突袭"
L["Fade delay"] = "淡出延迟"
L["Fade delay Desc"] = "忽略提醒时淡出所用的时间，右键点击将直接关闭"
L["Fall of the Lich King"] = "巫妖王的陨落"
L["Fated Raids"] = "宿命团队副本"
L["Fated Raids: Castle Nathria"] = "纳斯利亚堡"
L["Fated Raids: Castle Nathria (CN)"] = "纳斯利亚堡（国服）"
L["Fated Raids: Castle Nathria (EU)"] = "纳斯利亚堡（欧服）"
L["Fated Raids: Castle Nathria (US)"] = "纳斯利亚堡（美服）"
L["Fated Raids: Sanctum of Domination"] = "统御圣所"
L["Fated Raids: Sanctum of Domination (CN)"] = "初诞者圣墓（国服）"
L["Fated Raids: Sanctum of Domination (EU)"] = "初诞者圣墓（欧服）"
L["Fated Raids: Sanctum of Domination (US)"] = "初诞者圣墓（美服）"
L["Fated Raids: Sepulcher of the First Ones"] = "初诞者圣墓"
L["Fated Raids: Sepulcher of the First Ones (CN)"] = "统御圣所（国服）"
L["Fated Raids: Sepulcher of the First Ones (EU)"] = "统御圣所（欧服）"
L["Fated Raids: Sepulcher of the First Ones (US)"] = "统御圣所（美服）"
L["Feast of Winter Veil"] = "冬幕节"
L["Fen Flythrough"] = "泽地漫游"
L["Filters"] = "过滤器"
L["Firestorms"] = "火焰风暴"
L["First day of the week"] = "每周的第一天"
L["First day of the week Desc"] = "选择日历中所使用的每周的第一天"
L["FixTabs"] = [=[新的标签排序功能已启用，重新显示所有标签
不便之处，敬请谅解]=]
L["Flashfrost Flyover"] = "闪霜飞越"
L["Flexible"] = "适应"
L["Flowing Pandaren Spirit"] = "熊猫人流水之灵"
L["for achievement"] = "|cffffff00[{achievement}]|r"
L["Force two columns"] = "强制两列"
L["Force two columns Desc"] = "启用/禁用成就目标强制显示为两列。勾选后如果单列显示过长，将根据相关设置强制显示为两列"
L["Force two columns threshold"] = "强制两列阈值"
L["Force two columns threshold Desc"] = "成就目标高于设置的数值将强制显示为两列，正常情况仅显示单列"
L["Format"] = "格式"
L["Fracture Chambers"] = "断骨密室"
L["Fractures in Time"] = "时光的裂痕"
L["from"] = "从"
L["from the start of"] = "- 从更新"
L["Full Search"] = "完整搜索"
L["Full Search Desc"] = "选择'{showAllResults}'可以查看所有搜索结果（查看{quickSearchTutorial}教程了解更多细节）"
L["Fury Incarnate"] = "狂怒化身"
L["Fury of Hellfire"] = "地狱火危机"
L["Future Obtainable"] = "未来可得"
L["Fyrakk Assault"] = "菲莱克突袭"
L["Fyrakk Assaults"] = "菲莱克突袭"
L["Garden Gallivant"] = "花园休闲赛"
L["Garrisons Update"] = "要塞更新"
L["Gathering"] = "准备中"
L["Gifts"] = "礼物"
L["Gladiator's Sanctum"] = "角斗士圣殿"
L["Glory"] = "荣耀"
L["Go back one achievement"] = "上个成就"
L["Go forward one achievement"] = "下个成就"
L["Go to"] = "前往"
L["Going away with"] = "即将绝版"
L["Gorespine"] = "血刺"
L["Grand Hunts"] = "洪荒狩猎"
L["Grand Hunts: Ohn'ahran Plains"] = "洪荒狩猎: 欧恩哈拉平原"
L["Grand Hunts: Thaldraszus"] = "洪荒狩猎: 索德拉苏斯"
L["Grand Hunts: The Azure Span"] = "洪荒狩猎: 碧蓝林海"
L["Grand Hunts: The Waking Shore"] = "洪荒狩猎: 觉醒海岸"
L["Green"] = "绿色"
L["Grey"] = "灰色"
L["Greyhoof"] = "灰蹄"
L["Grow direction"] = "生长方向"
L["Grow direction Desc"] = "新提醒添加的位置"
L["Guardians of the Dream"] = "梦境守护者"
L["Guides"] = "指南"
L["Hallow's End"] = "万圣节"
L["Header"] = "页眉"
L["Header tooltip"] = "页眉提示"
L["Hearthstone"] = "炉石传说"
L["Hearthstone's 10th Anniversary"] = "炉石传说10周年"
L["Heroes of the Storm"] = "风暴英雄"
L["Hide Date Completed"] = "隐藏获得日期"
L["Hide Date Completed Desc"] = "隐藏成就的获得日期"
L["Hide Not Earned By if current character earned the achievement"] = "当前角色已获得时隐藏{notEarnedBy}"
L["Hide Not Earned By if current character earned the achievement Desc"] = "当前角色已获得该成就时隐藏{notEarnedBy}，{earnedBy}将正常显示"
L["Highmountain"] = "至高岭"
L["Holidays"] = "节日"
L["Horizontal position"] = "水平位置"
L["Hour of Twilight"] = "暮光审判"
L["Icon Left click"] = "打开成就界面"
L["Icon Right click"] = "打开插件设置"
L["ID"] = true
L["Ignore"] = "忽略"
L["Ignore Filters"] = "忽略过滤器"
L["Ignore Filters Desc"] = "忽略所有过滤器，在{category}中显示所有成就"
L["Imbu"] = "伊姆布"
L["Import"] = "导入"
L["in"] = "在"
L["In instances"] = "副本中"
L["Include"] = "显示"
L["Include all"] = "全部清除"
L["Include all Desc"] = "清除所有已隐藏成就"
L["Indentation"] = "缩进"
L["Indentation Desc"] = "子类缩进尺寸"
L["Invasions"] = "入侵"
L["is"] = ": 当前"
L["Iskaara Flyover"] = "伊斯卡拉飞越"
L["Kafi"] = "咖菲"
L["Kalimdor Cup"] = "卡利姆多杯"
L["Ka'wi the Gorger"] = "贪吃的卡瓦"
L["Keep current character"] = "保留当前角色"
L["Keep current character Desc"] = "总是在鼠标提示列表中保留当前角色，无论是否超过{maxNumChar}上限"
L["Keybindings Desc"] = "{addonName}的快捷键设置: 点击窗口左上角的游戏标签，在{keybindings}分类的插件选项卡中进行设置"
L["Kyrian Assault"] = "格里恩突袭"
L["Landfall"] = "夺岛奇兵"
L["Layout"] = "布局"
L["Left"] = "左"
L["Left Alt"] = "左Alt"
L["Left click"] = "左键"
L["Left Ctrl"] = "左Ctrl"
L["Left Shift"] = "左Shift"
L["Legion Assaults"] = "军团突袭"
L["Level 80"] = "80级"
L["Level 85"] = "85级"
L["Level 90"] = "90级"
L["Leveling"] = "升级"
L["Line"] = "行"
L["Load Tracking Achievements"] = "加载成就追踪"
L["Load Tracking Achievements Desc"] = "加载成就追踪描述"
L["Loaded"] = "已加载"
L["Loaded Desc"] = "显示关联插件是否加载"
L["Localizations"] = "本地化"
L["Lock month"] = "锁定月份"
L["Lock month Desc"] = "重新打开成就日历将显示关闭前保留的月份"
L["Lock month when closed by achievement"] = "锁定月份（点击成就而关闭时）"
L["Lock month when closed by achievement Desc"] = "点击成就日历右侧的成就导致日历关闭时，重新打开成就日历将显示关闭前保留的月份"
L["Login Delay"] = "登录延迟"
L["Love is in the Air"] = "情人节"
L["Lucky Yi"] = "幸运的小艺"
L["Lunar Festival"] = "春节"
L["M+ Season"] = "史诗钥石赛季"
L["Make windows movable"] = "解锁窗口"
L["Make windows movable Desc"] = [=[解锁/锁定成就界面和成就日历

勾选后在界面页眉或边缘，按住鼠标左键拖动可移动窗口]=]
L["Mantid"] = "螳螂妖"
L["Maruukai Dash"] = "马鲁凯飞奔"
L["Max number of alerts"] = "最大提醒数"
L["Max number of alerts Desc"] = "同一时间显示的弹窗数量上限"
L["Maximum number of characters"] = "最大角色数量"
L["Maximum number of characters Desc"] = "在鼠标提示中可显示的最大角色数量"
L["Merge Small Categories"] = "合并小类"
L["Merge small categories threshold"] = "合并小类阈值"
L["Merge small categories threshold Desc"] = [=[当一个类别的成就数量小于该数值时，将其并入父类

仅预设类别可进行合并（多为区域子类），这样可能会对游戏造成影响(1)

(1)仅在调整数值时可能出现掉帧和卡顿，不影响正常游戏]=]
L["Micro Button"] = "微型菜单按钮"
L["Midsummer Fire Festival"] = "仲夏火焰节"
L["Minimum characters to search"] = "最小搜索字符数"
L["Minimum characters to search Desc"] = [=[开始进行成就搜索所需输入的最小字符数
数值越小对游戏的影响(1)越大

(1)搜索时可能出现掉帧和卡顿]=]
L["Mirror of the Sky Dash"] = "镜天湖飞奔"
L["Mists of Pandaria (pre-patch)"] = "熊猫人之谜（前夕）"
L["Modifiers"] = "修饰键"
L["Mogu"] = "魔古"
L["More"] = "更多"
L["Mort'regar"] = "莫尔特雷加"
L["Most progress"] = "进度最多"
L["Mouse Wheel Scroll Speed"] = "鼠标滚轮速度"
L["Mouse Wheel Scroll Speed Desc"] = "点击滚动条上下按钮或滚动鼠标滚轮时，滑动的{items}数量"
L["Movable"] = "锁定状态"
L["Mythic+"] = "史诗钥石"
L["Nazmir"] = "纳兹米尔"
L["Necrolord Assault"] = "通灵领主突袭"
L["Necrolords Assault"] = "通灵领主突袭"
L["never obtainable"] = "已绝版"
L["New Achievement Colors"] = "新的成就颜色"
L["New Achievement Colors Desc"] = [=[- 已获得的成就为默认金色，边缘由红色更改为金色
- 已获得的绝版成就为新的红色，边缘为默认红色
- 未获得的绝版成就为新的红色，边缘为默认灰色
- 已获得的战团成就为默认蓝色，边缘为默认蓝色]=]
L["New achievement window tabs"] = "新的成就界面标签"
L["New achievement window tabs Desc"] = [=[新的标签已添加至成就界面
在不影响默认标签的情况下，提供了一种相似的新途径来显示成就

标签: 
|T:1:8|t- {achievements}: 在默认{achievements}标签的基础上，添加{addonName_y}的全新特性
|T:1:8|t- {expansions}: 将成就按不同资料片进行分类并优化结构，查看{expansionsTabTutorial}教程了解更多细节
|T:1:8|t- {events}: 将成就按不同事件进行分类，包含节日以及突袭等世界事件
|T:1:8|t- {pvp}: 将成就按不同战场进行分类
|T:1:8|t- {specials}: 该分类包含各类奖励坐骑、头衔、幻化的成就以及部分难以分类的成就

所有默认标签和{addonName_y}添加的标签都可以在设置(1)中隐藏
{pluginText}
(1) {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {tabs}]=]
L["News"] = "新闻"
L["Next"] = "下次"
L["Next from startDate until endDate"] = "下次活动{startDate}至{endDate}"
L["Next occurrence unknown"] = "下次活动时间未知"
L["Night Fae Assault"] = "法夜突袭"
L["Nitun"] = "尼顿"
L["No achievements are available with the current set of filters"] = "当前过滤器设置下无可用成就"
L["No category selected"] = "未选择类别"
L["No characters found"] = "未找到角色"
L["No data found"] = "未找到数据"
L["No time data available"] = "无可用时间数据"
L["Noblegarden"] = "复活节"
L["Nokhudon Hold"] = "诺库顿要塞"
L["NONC"] = true
L["None"] = "无"
L["No-No"] = "诺诺"
L["Northrend Cup"] = "诺森德杯"
L["Not Earned By"] = "未获得"
L["Not earned by:"] = "未获得: "
L["Not loaded"] = "未加载"
L["Not Obtainable"] = "已绝版"
L["Not part of set"] = "非套装部位"
L["Number of Earned By characters"] = "{earnedBy}角色数"
L["Number of Earned By characters Desc"] = [=[显示已获得该成就的角色数量

设置为0将禁用该功能]=]
L["Number of Most progress characters"] = "进度最多的角色数量"
L["Number of Most progress characters Desc"] = [=[显示该成就进度最多的角色数量

设置为0将禁用该功能]=]
L["Number of Not Earned By characters"] = "{notEarnedBy}角色数"
L["Number of Not Earned By characters Desc"] = [=[显示未获得该成就的角色数量

设置为0将禁用该功能]=]
L["Number of search previews"] = "搜索预览数"
L["Number of search previews Desc"] = "成就搜索结果预览的最大数量"
L["Number of summary achievements"] = "近期成就数"
L["Number of summary achievements Desc"] = "显示在每个标签总览的近期成就最大数量"
L["N'Zoth (Uldum)"] = "黑暗帝国（奥丹姆）"
L["N'Zoth (Vale of Eternal Blossoms)"] = "黑暗帝国（锦绣谷）"
L["N'Zoth Assaults"] = "黑暗帝国突袭"
L["Objectives"] = "目标"
L["Objectives progress"] = "目标进度"
L["Obtainable"] = "可获得"
L["OC"] = true
L["Offsets"] = "偏移"
L["Ohn'ahran Plains"] = "欧恩哈拉平原"
L["Ohn'ahran Plains: Next"] = "欧恩哈拉平原: 下次"
L["Ohn'iri Springs"] = "欧恩伊尔清泉"
L["On Event Start"] = "事件开始时"
L["On Login"] = "登录时"
L["On Reload"] = "重新载入时"
L["only obtainable by one player"] = "仅一名玩家可获得"
L["Only search filtered achievements"] = "仅搜索已过滤成就"
L["Only search filtered achievements Desc"] = "仅在过滤器设置后可见的成就中进行搜索"
L["Only when time data is available"] = "仅当时间数据可用时"
L["Open"] = "打开"
L["Order"] = "排序"
L["Other"] = "其他"
L["Other faction"] = "其他阵营"
L["Other locations"] = "其他定位"
L["Other wings"] = "其他"
L["Outland Cup"] = "外域杯"
L["Overflow"] = "溢出"
L["Overwatch"] = "守望先锋"
L["Pandaren"] = "熊猫人"
L["Pandaria Cup"] = "潘达利亚杯"
L["Part of a chain"] = "系列成就"
L["Passage Pathway"] = "飞逝赛道"
L["Past Obtainable"] = "已绝版"
L["Paste to Chat"] = "发送至聊天框"
L["Patch"] = "版本"
L["Pilgrim's Bounty"] = "感恩节"
L["Pirates' Day"] = "海盗日"
L["Placeholder"] = "占位符"
L["Plugins"] = "插件"
L["Plunderstorm"] = "强袭风暴"
L["Points"] = "点数"
L["Pop ups"] = "弹窗"
L["Pre-Patch Event"] = "前夕事件"
L["Presets"] = "预设"
L["Primal Storms"] = "原始风暴"
L["Primalist Tomorrow"] = "拜荒者的未来"
L["Print map info"] = "显示地图信息"
L["Print map info Desc"] = "在聊天框显示地图ID"
L["Print map info w/o reload"] = "无需重新载入"
L["Print map info w/o reload Desc"] = "无需重新载入，直接显示地图ID"
L["PvP"] = true
L["PvP Season"] = "PvP赛季"
L["Quick Search"] = "快速搜索"
L["Quick Search Desc"] = [=[在{addonName}添加的标签中搜索成就，将不搜索默认标签

特性: 
|T:1:8|t- 搜索成就标题和描述，按标题首字母排序
|T:1:8|t- 输入'#'后搜索成就ID，按ID升序排列

设置(1): 
|T:1:8|t- {clearOnRightClick}（{clearOnRightClickEnabled}）
|T:1:8|t- {excludeExcludedAchievements}（{excludeExcludedAchievementsFrom}搜索结果中{excludeExcludedAchievementsEnabled}已隐藏成就）
|T:1:8|t- {searchFilteredAchievements}（{searchFilteredAchievementsEnabled}）
|T:1:8|t- {minCharToSearch}（{minCharToSearchNumber}）
|T:1:8|t- {numSearchPreviews}（{numSearchPreviewsNumber}）

(1) {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName}]=]
L["Radiant Echoes"] = "光耀回响"
L["Rage of the Firelands"] = "火焰的愤怒"
L["Rated"] = "评级"
L["Ravine River Run"] = "河谷奔行"
L["Realm"] = "服务器"
L["Realm First!"] = "服务器第一！"
L["Rebind Micro Button"] = "重新绑定微型按钮"
L["Rebind Micro Button Desc"] = "重新绑定成就菜单打开时的标签"
L["Recruit-a-Friend"] = "战友招募"
L["Red"] = "红色"
L["Refresh Events"] = "刷新事件"
L["Refresh interval"] = "刷新间隔"
L["Refresh interval Desc"] = "事件时间数据的刷新秒数间隔，设置时间过长可能导致弹窗延迟"
L["Related Tab"] = "关联标签"
L["Related Tab Desc"] = "为{wowheadLink}添加一个额外标识符，将跳转至网页对应的标签而非默认页面"
L["Remember frame position"] = "记住{frame}位置"
L["Remember frame position Desc"] = "记住{frame}位置，保留{frame}的最后位置至下次登录"
L["Remove from Watch List"] = "取消关注"
L["Required for"] = "所属成就"
L["Requires"] = "需要"
L["Researchers Under Fire"] = "研究员遇袭"
L["Reset Faction Filters"] = "重置阵营过滤器"
L["Reset Faction Filters Desc"] = [=[重置/保留阵营过滤

登录一个{alliance}角色，不论是否勾选{neutral}/{alliance}/{horde}阵营过滤器，都将自动勾选{neutral}和{alliance}阵营过滤器并取消勾选{horde}阵营过滤器

适合频繁切换{alliance}和{horde}角色时使用]=]
L["Reset filters"] = "重置过滤器"
L["Reset position"] = "重置位置"
L["Reset position Desc"] = "重置{frame}至默认位置"
L["Reset view"] = "重置显示"
L["Reset view on open"] = "打开时重置显示"
L["Reset view on open Desc"] = "勾选后打开时折叠所有类别并选择第一个"
L["Return to the Forbidden Reach"] = "重返禁忌离岛"
L["Reverse Sort"] = "反转排序"
L["Right"] = "右"
L["Right Alt"] = "右Alt"
L["Right click"] = "右键"
L["Right Click Menu"] = "右键菜单"
L["Right Click Menu Desc"] = [=[新标签中的所有成就都可使用{rightClickMenu}

特性: 
|T:1:8|t- 提供{wowhead}链接
|T:1:8|t- 可以快速{goTo}所在的{partOfAChain}和{require}中的其他成就，可以快速前往{currentZone}类别中成就的默认定位
|T:1:8|t- 如果是{petBattles}相关成就且{xuFuPetGuides}有相关信息，提供{xuFuPetGuides}链接
|T:1:8|t- 如果成就目标是收集外观，链接至对应套装
{pluginText}
|T:1:8|t- {more}: 杂项组，保持主菜单整洁
|T:1:8|t|T:1:8|t- {addToWatch}: 在{watchList}类别中添加成就（仅可添加未关注成就）
|T:1:8|t|T:1:8|t- {removeFromWatch}: 在{watchList}类别中移除成就（仅可移除已关注成就）
|T:1:8|t|T:1:8|t- {include}: 正常显示已隐藏成就（仅可显示已隐藏成就）
|T:1:8|t|T:1:8|t- {exclude}: 隐藏正常显示的成就（仅可隐藏正常显示成就）

设置: 
|T:1:8|t- 在每个成就上可显示一个按钮用于打开{rightClickMenu}（{enabled}）(1)

(1) {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {layout} {arrow} {rightClickMenu}]=]
L["Right Ctrl"] = "右Ctrl"
L["Right Shift"] = "右Shift"
L["Rise of Azshara"] = "艾萨拉的崛起"
L["Rise of the Zandalari"] = "赞达拉的崛起"
L["River Rapids Route"] = "湍流环线"
L["Ruby Lifeshrine Loop"] = "红玉新生圣地赛道"
L["Rydyr"] = "瑞迪尔"
L["Sandstorms"] = "沙暴"
L["Scalecracker Keep"] = "碎鳞要塞"
L["Screenshot Mode"] = "截图模式"
L["Screenshot Mode Desc"] = [=[添加一个置顶的黑色图层，只有打开的新界面可以看见，该功能用于屏幕截图

重新载入后可移除黑色图层]=]
L["Screenshots"] = "屏幕截图"
L["Search"] = "搜索"
L["Search Criteria"] = "搜索类别"
L["Search Descriptions"] = "搜索描述"
L["Search field"] = "搜索框"
L["Search Ids"] = "搜索ID"
L["Search Names"] = "搜索名称"
L["Search options"] = "搜索选项"
L["Search preview"] = "搜索预览"
L["Search Results"] = "搜索结果"
L["Search Rewards"] = "搜索奖励"
L["Searing Gorge"] = "灼热峡谷"
L["Season"] = "赛季"
L["Second column threshold"] = "两列阈值"
L["Second column threshold Desc"] = "成就目标高于设置的数值将会显示为两列"
L["Secrets of Azeroth"] = "艾泽拉斯之秘"
L["Secrets of Azeroth (EU)"] = "艾泽拉斯之秘（EU）"
L["Secrets of Azeroth (KR)"] = "艾泽拉斯之秘（KR）"
L["Secrets of Azeroth (US)"] = "艾泽拉斯之秘（US）"
L["Secrets of Ulduar"] = "奥杜尔的秘密"
L["Seeds of Renewal"] = "复兴之种"
L["Select achievements to see your browsing history"] = "选中成就后可以查看浏览历史"
L["Select All"] = "全部选择"
L["Selected Zone"] = "选中区域"
L["Set Keybind"] = "设置按键绑定"
L["Set Keybind Desc"] = "将所选标签的快捷键设置为'Y'，这将解除'Y'的其他按键绑定，可以前往{keyBindings}中更改为其他按键"
L["Shadowlands (pre-patch)"] = "暗影国度（前夕）"
L["Shadows of Argus"] = "阿古斯之影"
L["Shift"] = true
L["Shipyard"] = "船坞"
L["Show"] = "显示"
L["Show Added in version"] = "显示{addedInVersion}"
L["Show Added in version Desc"] = [=[显示/隐藏{addedInVersion}

勾选后在鼠标提示中显示成就添加的版本]=]
L["Show alertSystem on event start Desc"] = "事件开始时显示/隐藏事件{alertSystem}"
L["Show alertSystem on event start in instances Desc"] = "事件开始并在副本中时显示/隐藏事件{alertSystem}"
L["Show alertSystem on event start only when time data is available Desc"] = "事件开始且时间数据可用时显示/隐藏事件{alertSystem}"
L["Show alertSystem on login Desc"] = "进入游戏时显示/隐藏事件{alertSystem}"
L["Show alertSystem on login in instances Desc"] = "进入游戏并在副本中时显示/隐藏事件{alertSystem}"
L["Show alertSystem on login only when time data is available Desc"] = "进入游戏且时间数据可用时显示/隐藏事件{alertSystem}"
L["Show alertSystem on reload Desc"] = "重新载入时显示/隐藏事件{alertSystem}"
L["Show alertSystem on reload in instances Desc"] = "重新载入并在副本中时显示/隐藏事件{alertSystem}"
L["Show alertSystem on reload only when time data is available Desc"] = "重新载入且时间数据可用时显示/隐藏事件{alertSystem}"
L["Show All Results in Category"] = "在类别中显示所有搜索结果"
L["Show All Results in Category Desc"] = "当前周期内在类别中显示所有搜索结果"
L["Show Criteria"] = "显示要求"
L["Show Criteria Desc"] = "在成就所需单位上显示成就要求（{criteria} 未使用/love [{achievement}]）"
L["Show Criteria If"] = "是否显示要求"
L["Show current character icons"] = "显示当前角色图标"
L["Show current character icons Desc"] = [=[显示/隐藏当前角色图标

勾选后会在{partOfAChain}和{requiredFor}前添加一个当前角色进度图标]=]
L["Show Date Completed Time"] = "显示日期完整时间"
L["Show Date Completed Time Desc"] = [=[显示成就获得时的完整时间（时，分和秒）

免责声明: 暴雪未记录该信息，仅新获得的成就有完整的数据。丢失Saved Variables文件/文件夹，或WTF文件夹将重置该信息至默认时间12:00:00.]=]
L["Show Excluded Category"] = "显示已隐藏类别"
L["Show Excluded Category Desc"] = [=[显示/隐藏{excluded}类别

勾选后该类别仅在包含成就且过滤器设置为可见时显示

未勾选时该类别和过滤器永久隐藏]=]
L["Show Faction Faction Icon"] = "显示{faction}阵营图标"
L["Show Faction Faction Icon Desc"] = "仅{faction}玩家可获得的成就，显示{faction}阵营图标"
L["Show faction icon"] = "显示阵营图标"
L["Show faction icon Desc"] = "在角色名称前显示阵营图标"
L["Show minimap icon"] = "显示小地图图标"
L["Show minimap icon Desc"] = "显示/隐藏小地图图标"
L["Show Not Obtainable"] = "显示{notObtainable}"
L["Show Not Obtainable Desc"] = "在进度条中以红色进度显示/隐藏{notObtainable}成就"
L["Show Objectives progress"] = "显示{objectivesProgress}"
L["Show Objectives progress Desc"] = [=[显示/隐藏{objectivesProgress}

勾选后在鼠标提示中显示成就的{objectivesProgress}]=]
L["Show Other faction"] = "显示其他阵营"
L["Show Other faction Desc"] = [=[显示/隐藏其他阵营

勾选后在鼠标提示中显示其他阵营成就，这将更清楚地表明为何只玩联盟的玩家，新建的部落角色会有一些成就]=]
L["Show Part of a Chain"] = "显示{partOfAChain}"
L["Show Part of a Chain Desc"] = [=[显示/隐藏{partOfAChain}

勾选后在鼠标提示中显示所在系列成就]=]
L["Show placeholders"] = "显示占位符"
L["Show placeholders Desc"] = "显示一个事件占位符帮助反馈修改设置后的视觉效果，右键点击可关闭"
L["Show placeholders filter"] = "显示占位符过滤器"
L["Show placeholders filter Desc"] = [=[在过滤器中显示/隐藏占位符过滤器，该功能用于显示游戏中未实装的成就

启用后可能会包含剧透内容！]=]
L["Show pop ups on login delay Desc"] = "进入游戏时延迟启动事件弹窗"
L["Show Required for"] = "显示{requiredFor}"
L["Show Required for Desc"] = [=[显示/隐藏{requiredFor}

勾选后在鼠标提示中显示所属成就]=]
L["Show Rewards"] = "显示奖励"
L["Show Rewards Desc"] = [=[显示/隐藏{rewards}

勾选后在鼠标提示中显示成就的{rewards}]=]
L["Show Right Click Menu"] = "显示{rightClickMenu}按钮"
L["Show Right Click Menu Desc"] = [=[在每个成就上显示/隐藏{rightClickMenu}按钮

用于替代右键点击]=]
L["Show Start Time & End Time"] = "显示{startTime}和{endTime}"
L["Show Start Time & End Time Desc"] = [=[显示{startTime}和{endTime}.

勾选后当成就{temporarilyObtainable}时，在鼠标提示中显示成就可得的开始和结束时间

仅支持有日历事件的{temporarilyObtainable}成就]=]
L["Show Sub Categories"] = "显示子类"
L["Show Sub Categories Desc"] = [=[显示/隐藏子类

勾选后将在{category}中显示成就的原始分类，而非直接显示]=]
L["Show Temporarily obtainable"] = "显示{temporarilyObtainable}"
L["Show Temporarily obtainable Desc"] = [=[显示/隐藏{temporarilyObtainable}.

勾选后当成就{temporarilyObtainable}时，在鼠标提示中显示该信息]=]
L["Show Temporarily obtainable Icon"] = "显示{tempObt}图标"
L["Show Temporarily obtainable Icon Desc"] = "{tempObt}成就显示/隐藏额外图标"
L["Show world map icon"] = "显示世界地图图标"
L["Show world map icon Desc"] = "显示/隐藏世界地图图标"
L["Side Button Anchor"] = "侧边按钮锚点"
L["Side Button Anchor Desc"] = "设置侧边按钮绑定的界面"
L["Side Window"] = "侧边界面"
L["Siege of Orgrimmar"] = "围攻奥格瑞玛"
L["Siege on Dragonbane Keep"] = "围攻灭龙要塞"
L["Siege on Dragonbane Keep: Active"] = "灭龙要塞: 激活"
L["Siege on Dragonbane Keep: Gathering"] = "灭龙要塞: 准备中"
L["Skitterer Xi'a"] = "飞掠者溪雅"
L["Skoldus Hall"] = "斯科杜斯之厅"
L["Skyriding Races"] = "驭空术比赛"
L["Slagmire"] = "熔渣沼泽"
L["Snowstorms"] = "雪暴"
L["Soon"] = "即将"
L["Sort priority"] = "排序优先级"
L["Soulforges"] = "灵魂熔炉"
L["Sources"] = "资源"
L["Southshore vs. Tarren Mill"] = "南海镇VS塔伦米尔"
L["Spacing"] = "间距"
L["Spacing Desc"] = "在默认基础上增加或减少标签间距"
L["Special Categories"] = "特殊类别"
L["Special thanks"] = "特别鸣谢"
L["Specials"] = "特殊"
L["Spreading the Light"] = "散布圣光"
L["Stables"] = "兽栏"
L["StarCraft II"] = "星际争霸II"
L["Start Time"] = "开始时间"
L["Stormheim"] = "风暴峡湾"
L["Stormsong Valley"] = "斯托颂谷地"
L["Strand of the Ancients"] = "远古海滩"
L["Style"] = "样式"
L["Summary Desc"] = [=[{achievementsHeader}: 
|T:1:8|t- 显示近期战网和角色获得的最后{numAchievements}个成就(1)

{categoriesHeader}: 
|T:1:8|t- 显示标签中所有类别的进度

(1) {gameMenu} {arrow} {interface} {arrow} {addOns} {arrow} {addonName} {arrow} {categories} {arrow} {summary}]=]
L["Sundapple Copse Circuit"] = "阳斑灌木林巡回赛"
L["Superbloom"] = "超然盛放"
L["Superbloom: Active"] = "超然盛放: 激活"
L["Superbloom: Next"] = "超然盛放: 下次"
L["Tab"] = "标签"
L["tab"] = "标签"
L["Tabs"] = "标签"
L["Ta's Pet Collection"] = "宠物收集"
L["Temporarily obtainable"] = "限时可得"
L["temporarily obtainable"] = "限时可得"
L["Temporarily obtainable Header Colors"] = "{tempObt}页眉颜色"
L["Temporarily obtainable Header Colors Desc"] = "勾选后默认橙/蓝页眉颜色扩展为绿/黄/红，分别表示成就当前可得/未来可得/已绝版"
L["Temporarily Obtainable Text"] = "{thisAchievement}{isWillBeWas}{neverOnceTempObt}{startText}{startDetail}{endText}{endDetail}"
L["Thaldraszus"] = "索德拉苏斯"
L["Thaldraszus: Next"] = "索德拉苏斯: 下次"
L["The Azure Span"] = "碧蓝林海"
L["The Azure Span Slalom"] = "碧蓝林海障碍赛"
L["The Azure Span Sprint"] = "碧蓝林海冲刺"
L["The Big Dig: Active"] = "盛大发掘: 激活"
L["The Big Dig: Next"] = "盛大发掘: 下次"
L["The Big Dig: Soon"] = "盛大发掘: 即将"
L["The Entitled"] = "头衔"
L["the event name with run time"] = "{eventName}从{startDate}至{endDate}"
L["The Flowing Forest Flight"] = "起伏森林航线"
L["The Iron Tide"] = "钢铁之潮"
L["The Shattering"] = "破碎的艾泽拉斯"
L["The Thunder King"] = "雷神再临"
L["The Tomb of Sargeras"] = "萨格拉斯之墓"
L["The Vakthros Ascent"] = "瓦克索斯攀升赛"
L["The Waking Shore"] = "觉醒海岸"
L["The War Within (pre-patch)"] = "地心之战（前夕）"
L["Theater Troupe"] = "剧场巡演"
L["This achievement"] = "该成就"
L["This achievement can't be earned by this character."] = "该成就无法由当前角色获得"
L["This achievement is no longer obtainable"] = "该成 : 已绝版"
L["This category has no achievements"] = "该类别没有成就"
L["This character's class has no transmog set that meet the requirements."] = "当前职业无对应的套装外观"
L["Thundering Pandaren Spirit"] = "熊猫人雷霆之灵"
L["Thunderstorms"] = "雷暴"
L["Tides of Vengeance"] = "复仇之潮"
L["Time display"] = "显示时间"
L["Time Left"] = "剩余时间"
L["Time Rift"] = "时光裂隙"
L["Time Rift: Active"] = "时光裂隙: 激活"
L["Time Rift: Next"] = "时光裂隙: 下次"
L["Time Rift: Starting Soon"] = "时光裂隙: 即将开始"
L["Time Rifts"] = "时光裂隙"
L["Tiragarde Sound"] = "提拉加德海峡"
L["Titan Lockdown"] = "泰坦封锁"
L["Titan Lockdown: Active"] = "泰坦封锁: 激活"
L["Titan Lockdown: Next"] = "泰坦封锁: 下次"
L["Titan Lockdown: Soon"] = "泰坦封锁: 即将"
L["Titan Lockdown: Starting Soon"] = "泰坦封锁: 即将开始"
L["Ti'un the Wanderer"] = "云游者啼乌"
L["Toggle"] = "打开/关闭"
L["Toggle Tracking"] = "追踪"
L["Toggle window once opened"] = "打开界面后切换模式"
L["Toggle window once opened Desc"] = "首次打开成就界面时跳转至设置的标签页并选择总览，之后无视绑定的快捷键都打开上次停留的界面"
L["Tooltip"] = "鼠标提示"
L["Torghast"] = "托加斯特"
L["Track achievement browsing history"] = "追踪成就浏览历史"
L["Track achievement browsing history Desc"] = [=[启用后在成就界面页眉显示前后按钮

可以像使用网页浏览器一样，查看选中过的成就历史记录]=]
L["Tracking"] = "追踪"
L["Tracking Achievements"] = "成就追踪"
L["Trading Post"] = "商栈"
L["Transmog Sets"] = "套装外观"
L["Truncate"] = "截断"
L["Turbulent Timeways"] = "紊乱时间流"
L["Tutorial"] = "教程"
L["Tutorial Desc"] = "从头开始教程"
L["Tyrhold"] = "提尔要塞"
L["Uktulut Coaster"] = "乌克图鲁特急流"
L["Uncategorized"] = "未分类"
L["Unchecked"] = "关闭"
L["until the end of"] = "至结束"
L["Up"] = "上"
L["up until the start of"] = "至更新"
L["Upper Reaches"] = "上层区域"
L["Val'sharah"] = "瓦尔莎拉"
L["Vendor"] = "商人"
L["Venthyr Assault"] = "温西尔突袭"
L["Vertical position"] = "垂直位置"
L["View Tutorial"] = "查看教程"
L["Visions of N'Zoth"] = "恩佐斯的幻象"
L["Vol'dun"] = "沃顿"
L["Wago"] = true
L["Wago Desc"] = "提供{addonName}的{wago}页面链接"
L["Waking Shores"] = "觉醒海岸"
L["Waking Shores: Next"] = "觉醒海岸: 下次"
L["Warcraft III: Reforged"] = "魔兽争霸III: 重制版"
L["Warcraft Rumble"] = "魔兽游戏机"
L["was"] = ":"
L["Watch List"] = "已关注"
L["When achievement completed"] = "成就已获得时"
L["When achievement completed Desc"] = [=[成就已获得时显示/隐藏{objectivesProgress}

勾选后在鼠标提示中显示成就的{objectivesProgress}，无论成就是否获得]=]
L["Whispering Pandaren Spirit"] = "熊猫人微风之灵"
L["Widget Events"] = "小型事件"
L["Wild Preserve Circuit"] = "狂野禁猎区巡回赛"
L["Wild Preserve Slalom"] = "狂野禁猎区障碍赛"
L["will be"] = ": 未来"
L["Window"] = "窗口"
L["Wingrest Roundabout"] = "翼眠环线"
L["World Events"] = "地图事件"
L["World Map"] = "世界地图"
L["World Map Button"] = "世界地图按钮"
L["World Map Button Desc"] = [=[悬停: 
|T:1:8|t- 在{selectedZone}过滤器设置的基础上显示可获得/已绝版和已获得/未获得的成就数量信息（同{enhancedTooltipCategories}）
|T:1:8|t- 查看{enhancedTooltipCategories}和{enhancedFilteringAndSorting}教程了解更多细节

点击: 
|T:1:8|t- 打开成就界面并跳转至{selectedZone}类别]=]
L["Worldsoul Memory"] = "世界之魂的回忆"
L["WoW Remix: Mists of Pandaria"] = "潘达利亚幻境"
L["Wowhead"] = true
L["Wowhead Link"] = "Wowhead链接"
L["WoWInterface"] = true
L["WoWInterface Desc"] = "打开一个附带{addonName} {woWInterface}页面链接的"
L["WoW's 10th Anniversary"] = "魔兽世界十周年"
L["WoW's 18th Anniversary"] = "魔兽世界十八周年"
L["WoW's 19th Anniversary"] = "魔兽世界十九周年"
L["WoW's 20th Anniversary"] = "魔兽世界二十周年"
L["WoW's 21st Anniversary"] = "魔兽世界二十一周年"
L["WoW's Anniversary"] = "魔兽世界周年庆典"
L["X offset Desc"] = "初始位置水平偏移"
L["Xu-Fu's Pet Guides"] = "雪福战宠指南"
L["XYZ offset"] = "{xyz}偏移"
L["Y offset Desc"] = "初始位置垂直偏移"
L["Zaqali Ruin Investigation"] = "扎卡利废墟调查"
L["Zaqali Ruin Investigation: Active"] = "扎卡利废墟调查: 激活"
L["Zaqali Ruin Investigation: Next"] = "扎卡利废墟调查: 下次"
L["Zaqali Ruin Investigation: Soon"] = "扎卡利废墟调查: 即将"
L["Zaqali Ruin Investigation: Starting Soon"] = "扎卡利废墟调查: 即将开始"
L["Zones"] = "区域"
L["Zuldazar"] = "祖达萨"