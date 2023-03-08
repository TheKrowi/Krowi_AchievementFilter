-- [[ Exported at 2023-03-08 07-19-23 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Chinese (Simplified) translation by Shykai, 2022-08-22 ]] --

-- [[ Namespaces ]] --
local addonName, addon = ...;
local L = LibStub(addon.Libs.AceLocale):NewLocale(addonName, "zhCN");
if not L then return end

local tab = "|T:1:8|t";
L["TAB"] = tab;

-- Load strings into the localization that are already localized by Blizzard
addon.ExtraWrathStrings.zhCN.Load(L);
addon.PluginStrings.zhCN.Load(L);
addon.GlobalStrings.Load(L);
addon.Plugins:LoadLocalization(L);

L["Achievement points earned by"] = "获得的成就点数";
L["Achievements"] = "成就";
L["Expansions"] = "扩展";
L["Events"] = "事件";
L["PvP"] = "PvP";
L["Specials"] = "特殊";
L["Merge Small Categories"] = "合并小分类";
L["Obtainable"] = "可见";
L["Not Obtainable"] = "不可见";
L["Covenant"] = "盟约";
L["Collapse Chain"] = "折叠链";
L["Excluded"] = "已排除";
L["Completion"] = "完成";
L["ID"] = "ID";
L["Reverse Sort"] = "反向排序";
L["Earned By"] = "获得者";
L["Account"] = "账户";
L["Tabs"] = "标签";
L["Special Categories"] = "特殊分类";
L["Current Zone"] = "当前地区";
L["Selected Zone"] = "选中地区";
L["View Tutorial"] = "查看教程";
L["Brawler's Guild"] = "搏击俱乐部";
L["Buildings"] = "建筑";
L["Bur's Mount Collection"] = "Bur的坐骑收藏";
L["Class Hall"] = "职业大厅";
L["Covenant Assaults"] = "盟约突袭";
L["Drops"] = "掉落";
L["Dueler's Guild"] = "决斗俱乐部";
L["Faction Assaults"] = "阵营突袭";
L["Watch List"] = "已跟踪";
L["Gifts"] = "礼物";
L["Gladiator's Sanctum"] = "角斗士圣殿";
L["Glory"] = "荣耀";
L["Holidays"] = "节日";
L["Invasions"] = "入群";
L["Legion Assaults"] = "军团突袭";
L["N'Zoth Assaults"] = "恩佐斯突袭";
L["Necrolords Assault"] = "通灵领主突袭";
L["Other"] = "其他";
L["Other wings"] = "托加斯特";
L["Pirates' Day"] = "海盗日";
L["Rated"] = "评级";
L["Recruit-a-Friend"] = "战友招募";
L["Shipyard"] = "船坞";
L["Southshore vs. Tarren Mill"] = "南海镇 vs. 塔伦米尔";
L["Stables"] = "马厩";
L["Strand of the Ancients"] = "远古海滩";
L["The Entitled"] = "头衔";
L["Vendor"] = "商人";
L["Zones"] = "地区";
L["Realm First!"] = "服务器第一!";
L["Leveling"] = "升级";
L["Level 80"] = "等级 80";
L["Level 85"] = "等级 85";
L["Level 90"] = "等级 90";
L["450 skill"] = "450 技能";
L["525 skill"] = "525 技能";
L["600 skill"] = "600 技能";
L["BlizzCon"] = "暴雪嘉年华";
L["Collector's Edition"] = "典藏版";
L["Diablo III"] = "暗黑破坏神III";
L["Overwatch"] = "守望先锋";
L["StarCraft II"] = "星际争霸II";
L["Hearthstone"] = "炉石传说";
L["Heroes of the Storm"] = "风暴英雄";
L["Warcraft III: Reforged"] = "魔兽争霸III:重制版";
L["WoW's Anniversary"] = "魔兽周年";
L["WoW's 18th Anniversary"] = "魔兽18周年";
L["Season"] = "赛季";
L["Feast of Winter Veil"] = "冬幕节";
L["Noblegarden"] = "复活节";
L["Children's Week"] = "儿童周";
L["Hallow's End"] = "万圣节";
L["Lunar Festival"] = "春节";
L["Midsummer Fire Festival"] = "仲夏火焰节";
L["Brewfest"] = "美酒节";
L["Pilgrim's Bounty"] = "感恩节";
L["Day of the Dead"] = "悼念日";
L["Love is in the Air"] = "情人节";
L["Darkmoon Faire"] = "暗月马戏团";
L["Soulforges"] = "灵魂熔炉";
L["Fracture Chambers"] = "断骨密室";
L["Skoldus Hall"] = "斯科杜斯之厅";
L["Coldheart Interstitia"] = "凇心间隙";
L["Mort'regar"] = "莫尔特雷加";
L["Upper Reaches"] = "上层区域";
L["Assault on Azsuna"] = "突袭阿苏纳";
L["Assault on Highmountain"] = "突袭至高岭";
L["Assault on Stormheim"] = "突袭风暴峡湾";
L["Assault on Val'sharah"] = "突袭瓦尔莎拉";
L["Assault on Tiragarde Sound"] = "突袭提拉加德海峡";
L["Assault on Drustvar"] = "突袭德鲁斯瓦";
L["Assault on Stormsong Valley"] = "突袭斯托颂谷地";
L["Assault on Nazmir"] = "突袭纳兹米尔";
L["Assault on Vol'dun"] = "突袭沃顿";
L["Assault on Zuldazar"] = "突袭祖达萨";
L["Assault: N'Zoth (Uldum)"] = "突袭:恩佐斯(奥丹姆)";
L["Assault: Amathet"] = "突袭:阿玛赛特";
L["Assault: Aqir"] = "突袭:亚基";
L["Assault: N'Zoth (Vale of Eternal Blossoms)"] = "突袭:恩佐斯(锦绣谷)";
L["Assault: Mogu"] = "突袭:魔古";
L["Assault: Mantid"] = "突袭:螳螂妖";
L["Necrolord Assault"] = "通灵领主突袭";
L["Venthyr Assault"] = "温西尔突袭";
L["Kyrian Assault"] = "格里恩突袭";
L["Night Fae Assault"] = "法夜突袭";
L["This achievement is no longer obtainable"] = "该成就已绝版";
L["Not earned by:"] = "未获得:";
L["Part of a chain"] = "子项";
L["Required for"] = "需求";
L["Other faction"] = "其他阵营";
L["Objectives progress"] = "目标进度";
L["Collecting data"] = "数据收集中";
L["Not part of set"] = "非套装部位";
L["This achievement can't be earned by this character."] = "该角色不可获得该成就.";
L["This character's class has no transmog set that meet the requirements."] = "该角色的职业无可用幻化套装.";
L["Wowhead"] = "Wowhead";
L["Go to"] = "前往";
L["Other locations"] = "其他地点";
L["Transmog Sets"] = "幻化套装";
L["Xu-Fu's Pet Guides"] = "Xu-Fu's Pet Guides";
L["More"] = "更多";
L["Add to Watch List"] = "添加到{watchList}";
L["Remove from Watch List"] = "从{watchList}移除";
L["Exclude"] = "排除";
L["Include"] = "包含";
L["No achievements are available with the current set of filters"] = "当前过滤条件下无可用成就";
L["Requires a reload"] = "需要重载界面";
L["Build"] = "版本";
L["Author"] = "作者";
L["Tutorial"] = "教程";
L["Discord"] = "Discord";
L["CurseForge"] = "CurseForge";
L["Wago"] = "Wago";
L["WoWInterface"] = "WoWInterface";
L["Show minimap icon"] = "显示小地图图标";
L["Reset view on open"] = "每次打开时重置过滤和界面";
L["Search"] = "搜索";
L["Clear search field on Right Click"] = "右键清除搜索栏";
L["Exclude Excluded achievements"] = "不搜索已排除的成就";
L["Only search filtered achievements"] = "只搜索过滤后的成就";
L["Minimum characters to search"] = "最小化角色搜索";
L["Number of search previews"] = "搜索框的预览条数";
L["Filters"] = "过滤器";
L["Reset Faction Filters"] = "重置阵营过滤器";
L["Layout"] = "布局";
L["Window"] = "窗口";
L["Make windows movable"] = "窗口可移动";
L["Categories width offset"] = "成就类别框宽度";
L["Achievement window height offset"] = "成就窗口高度";
L["Blizzard"] = "暴雪";
L["Order"] = "标签页顺序";
L["Tab"] = "标签页";
L["FixTabs"] = "所有成就标签页将重新全部显示。 这是由于新加入了标签排序功能。\n非常抱歉给您带来的不便。";
L["Header"] = "标题";
L["Format"] = "格式";
L["Account wide (default)"] = "账号 (默认)";
L["Character / Account wide"] = "角色 / 账号";
L["Tooltip"] = "提示";
L["Always show realm"] = "显示服务器";
L["Show Sub Categories"] = "显示子分类";
L["Clear all"] = "清除所有分类过滤";
L["Show Excluded Category"] = "显示已排除的分类";
L["Include all"] = "包含所有";
L["Show Not Obtainable"] = "显示 {notObtainable}";
L["Merge small categories threshold"] = "合并小类别成就的阈值";
L["Style"] = "样式";
L["Compact Achievements"] = "简洁成就";
L["Not Earned By"] = "未获取";
L["Number of Earned By characters"] = "{earnedBy} 的角色数量";
L["Number of Not Earned By characters"] = "{notEarnedBy} 的角色数量";
L["Show Part of a Chain"] = "显示 {partOfAChain}";
L["Show current character icons"] = "显示当前角色的图标";
L["Show Required for"] = "显示 {requiredFor}";
L["Show Other faction"] = "显示其他阵营";
L["Show Objectives progress"] = "显示 {objectivesProgress}";
L["When achievement completed"] = "当成就完成时";
L["Second column threshold"] = "子成就列数阈值";
L["Right Click Menu"] = "右键菜单";
L["Show Right Click Menu"] = "显示 {rightClickMenu} 按钮";
L["Event Reminders"] = "事件提醒";
L["Pop ups"] = "弹窗";
L["Show"] = "显示弹窗";
L["Max number of alerts"] = "成就提醒的最大数量";
L["Fade delay"] = "消失延迟";
L["Compact"] = "简洁模式";
L["Time display"] = "时间显示";
L["Line"] = "行";
L["None"] = "不显示";
L["Start Time"] = "开始时间";
L["End Time"] = "结束时间";
L["Time Left"] = "剩余时间";
L["Calendar Events"] = "日历事件";
L["Widget Events"] = "外置事件";
L["World Events"] = "世界事件";
L["Select All"] = "全选";
L["Deselect All"] = "取消全选";
L["Date and Time format"] = "日期和时间格式";
L["Presets"] = "预设格式";
L["Custom"] = "自定义";
L["Date and Time formatting guide"] = "日期和时间格式指导";
L["Plugins"] = "插件";
L["Loaded"] = "已加载";
L["Enable"] = "启用";
L["Not loaded"] = "未加载";
L["Credits"] = "致谢";
L["Special thanks"] = "特别鸣谢";
L["Donations"] = "支持";
L["Localizations"] = "本地化";
L["Toggle"] = "切换";
L["tab"] = "标签页";
L["Left click"] = "左键";
L["Right click"] = "右键";
L["Icon Left click"] = "打开成就窗口";
L["Icon Right click"] = "打开配置";
L["Andurs"] = "安杜斯";
L["Rydyr"] = "瑞迪尔";
L["Aki the Chosen"] = "天选者亚济";
L["Burning Pandaren Spirit"] = "熊猫人烈焰之灵";
L["Flowing Pandaren Spirit"] = "熊猫人流水之灵";
L["Thundering Pandaren Spirit"] = "熊猫人雷霆之灵";
L["Whispering Pandaren Spirit"] = "熊猫人微风之灵";
L["Dos-Ryga"] = "多斯里加";
L["Kafi"] = "咖菲";
L["Ti'un the Wanderer"] = "云游者啼乌";
L["No-No"] = "诺诺";
L["Gorespine"] = "血刺";
L["Skitterer Xi'a"] = "飞掠者溪雅";
L["Greyhoof"] = "灰蹄";
L["Lucky Yi"] = "幸运的小艺";
L["Ka'wi the Gorger"] = "贪吃的卡瓦";
L["Nitun"] = "尼顿";
L["Number of summary achievements"] = "成就汇总数量";
L["Rebind Micro Button"] = "重新绑定成就图标按钮";
L["Set Keybind"] = "设置按键";
L["Criteria of"] = "标准";
L["Guides"] = "指南";
L["News"] = "新闻";
L["Comments"] = "注释";
L["Wowhead Link"] = "Wowhead链接";
L["Add Locale"] = "添加语言";
L["Related Tab"] = "相关标签";
L["Torghast"] = "托加斯特";
L["Show placeholders"] = "展示占位符";
L["Points"] = "点数";
L["Calendar"] = "日历";
L["First day of the week"] = "一周的第一天";
L["Lock month when closed by achievement"] = "关闭成就界面时锁定当前月";
L["Lock month"] = "锁定当前月";
L["Movable"] = "可移动";
L["Offsets"] = "偏移量";
L["Sources"] = "来源";
L["Reset view"] = "重置界面";
L["Micro Button"] = "成就图标按钮";
L["Search field"] = "搜索栏";
L["Search preview"] = "搜索预览";
L["Reset filters"] = "重置过滤器";
L["Character only"] = "仅角色";
L["Show faction icon"] = "显示阵营";
L["Maximum number of characters"] = "最大角色数量";
L["Keep current character"] = "保留当前角色";
L["Sort priority"] = "排序优先级";
L["Category shown temporarily"] = "暂时显示分类";
L["Show Rewards"] = "显示奖励";
L["Indentation"] = "缩进";
L["Force two columns"] = "强制两列模式";
L["Force two columns threshold"] = "强制两列模式的阈值";
L["Objectives"] = "目标";
L["Criteria Behaviour"] = "文本过长时行为";
L["Overflow"] = "超长溢出";
L["Truncate"] = "过长截断";
L["Flexible"] = "灵活新行";
L["Error Tabs Order"] = "{blizzard} 的标签页 {statistics} 不能放置于 {guild} 的前面.";
L["Open"] = "打开";
L["Header tooltip"] = "标题提示信息";
L["Achievement shown temporarily"] = "暂时显示成就";
L["Screenshots"] = "截屏";
L["WoW's 10th Anniversary"] = "魔兽世界十周年";
L["Fated Raids: Castle Nathria"] = "宿命团队副本:纳斯利亚堡";
L["Fated Raids: Sanctum of Domination"] = "宿命团队副本:统御圣所";
L["Fated Raids: Sepulcher of the First Ones"] = "宿命团队副本:初诞者圣墓";
L["Refresh Events"] = "刷新事件";
L["Data Manager"] = "数据管理";
L["Fated Raids"] = "宿命团队副本";
L["No time data available"] = "没有可用的时间数据";
L["Remember frame position"] = "{frame} 位置固定";
L["Achievement Window"] = "成就窗口";
L["Achievement Calendar"] = "成就日历";
L["Reset position"] = "重置位置";
L["Fated Raids: Castle Nathria (US)"] = "宿命团队副本:纳斯利亚堡(US)";
L["Fated Raids: Sepulcher of the First Ones (US)"] = "宿命团队副本:统御圣所(US)";
L["Fated Raids: Sanctum of Domination (US)"] = "宿命团队副本:初诞者圣墓(US)";
L["Fated Raids: Castle Nathria (EU)"] = "宿命团队副本:纳斯利亚堡(EU)";
L["Fated Raids: Sepulcher of the First Ones (EU)"] = "宿命团队副本:统御圣所(EU)";
L["Fated Raids: Sanctum of Domination (EU)"] = "宿命团队副本:初诞者圣墓(EU)";
L["Fated Raids: Castle Nathria (CN)"] = "宿命团队副本:纳斯利亚堡(CN)";
L["Fated Raids: Sepulcher of the First Ones (CN)"] = "宿命团队副本:统御圣所(CN)";
L["Fated Raids: Sanctum of Domination (CN)"] = "宿命团队副本:初诞者圣墓(CN)";
L["Adjustable Categories"] = "可调节类别";
L["Dragon Glyphs"] = "巨龙魔符";
L["Dragon Racing"] = "巨龙竞速";
L["Apex Canopy River Run"] = "绝顶树冠激流冲刺";
L["Emberflow Flight"] = "烬琉航线";
L["Flashfrost Flyover"] = "闪霜飞越";
L["Ruby Lifeshrine Loop"] = "红玉新生圣地赛道";
L["Uktulut Coaster"] = "乌克图鲁特急流";
L["Wild Preserve Circuit"] = "狂野禁猎区巡回赛";
L["Wild Preserve Slalom"] = "狂野禁猎区障碍赛";
L["Wingrest Roundabout"] = "翼眠环线";
L["Emerald Garden Ascent"] = "翡翠花园攀升赛";
L["Fen Flythrough"] = "泽地漫游";
L["Maruukai Dash"] = "马鲁凯飞驰";
L["Mirror of the Sky Dash"] = "镜天湖飞驰";
L["Ravine River Run"] = "河谷奔行";
L["River Rapids Route"] = "湍流环线";
L["Sundapple Copse Circuit"] = "阳斑灌木林巡回赛";
L["Archive Ambit"] = "档案限界";
L["Central Circuit"] = "霜土飞越";
L["Iskaara Flyover"] = "伊斯卡拉锦标赛";
L["The Azure Span Slalom"] = "碧蓝林海障碍赛";
L["The Azure Span Sprint"] = "碧蓝林海冲刺";
L["The Vakthros Ascent"] = "瓦克索斯攀升赛";
L["Academy Ascent"] = "学院爬升赛";
L["Caverns Criss-Cross"] = "交错洞窟";
L["Cliffside Circuit"] = "山崖环道";
L["Garden Gallivant"] = "花园休闲赛";
L["Passage Pathway"] = "提尔要塞试炼";
L["The Flowing Forest Flight"] = "起伏森林航线";
L["Dragonriding"] = "驭龙术";
L["This achievement"] = "该成就";
L["was"] = "已在";
L["temporary obtainable"] = "可获得";
L["during"] = "当";
L["M+ Season"] = "史诗钥石地下城赛季";
L["PvP Season"] = "PvP 赛季";
L["from the start of"] = "开始自";
L["up until the start of"] = "直到开始于";
L["never obtainable"] = "不可获得";
L["will be"] = "将在";
L["only obtainable by one player"] = "可由单角色获得";
L["is"] = "在";
L["Patch"] = "补丁";
L["Temporary Obtainable Text"] = "{thisAchievement}{isWillBeWas}{startText}{startDetail}{endText}{endDetail}{neverOnceTempObt}";
L["Tracking Achievements"] = "追踪中的成就";
L["Load Tracking Achievements"] = "加载追踪中的成就";
L["DF - Firestorms"] = "巨龙时代-火焰风暴";
L["DF - Sandstorms"] = "巨龙时代-沙暴";
L["DF - Snowstorms"] = "巨龙时代-雪暴";
L["DF - Thunderstorms"] = "巨龙时代-雷暴";
L["Nokhudon Hold"] = "诺库顿要塞";
L["Ohn'iri Springs"] = "欧恩伊尔清泉";
L["Brackenhide Hollow"] = "蕨皮山谷";
L["Cobalt Assembly"] = "钴蓝集所";
L["Imbu"] = "伊姆布";
L["Tyrhold"] = "提尔要塞";
L["Dragonbane Keep"] = "凿刻记录";
L["Slagmire"] = "熔渣沼泽";
L["Scalecracker Keep"] = "碎鳞山脉";
L["Going away with"] = "即将离开";
L["Dragonflight Pre-patch"] = "巨龙时代 前夕";
L["Dragonflight"] = "巨龙时代";
L["Hide Not Earned By if current character earned the achievement"] = "当前角色已获取该成就时隐藏 {notEarnedBy}";
L["Spacing"] = "间距";
L["Ignore"] = "忽略";
L["Dragonflight pre-patch - Firestorms"] = "巨龙时代前夕-火焰风暴";
L["Dragonflight pre-patch - Sandstorms"] = "巨龙时代前夕-沙暴";
L["Dragonflight pre-patch - Snowstorms"] = "巨龙时代前夕-雪暴";
L["Dragonflight pre-patch - Thunderstorms"] = "巨龙时代前夕-雷暴";
L["Criteria"] = "成就标准";
L["Show Criteria"] = "显示成就标准";
L["Show Criteria If"] = "显示标准的条件";
L["Achievement is Completed"] = "成就已完成时";
L["Achievement was Not Earned by Me"] = "成就非当前角色完成时";
L["Criteria is Completed"] = "成就标准已完成";
L["Needs /love for achievement"] = "{forAchievement} 需要 /love";
L["Already /loved for achievement"] = "{forAchievement} 已完成 /love";
L["Needs to be killed for achievement"] = "{forAchievement} 需要击杀";
L["Already killed for achievement"] = "{forAchievement} 已完成击杀";
L["Needs to be cooked for achievement"] = "{forAchievement} 需要烹饪";
L["Already cooked for achievement"] = "{forAchievement} 已完成烹饪";
L["for achievement"] = "针对 {achievement}";
L["Show For Achievement"] = "显示成就要求";
L["Needs to be eaten for achievement"] = "{forAchievement} 需要食用";
L["Already eaten for achievement"] = "{forAchievement} 已完成食用";
L["Needs to be drunk for achievement"] = "{forAchievement} 需要喝酒";
L["Already drank for achievement"] = "{forAchievement} 已完成喝酒";
L["Show world map icon"] = "显示世界地图图标";
L["Primal Storms"] = "原始风暴";
L["Left"] = "鼠标左键";
L["Right"] = "鼠标右键";
L["Alt"] = "Alt键";
L["Ctrl"] = "Ctrl键";
L["Shift"] = "Shift键";
L["Right Alt"] = "右Alt键";
L["Right Ctrl"] = "右Ctrl键";
L["Right Shift"] = "右Shift键";
L["Left Alt"] = "左Alt键";
L["Left Ctrl"] = "左Ctrl键";
L["Left Shift"] = "左Shift键";
L["Modifiers"] = "修饰符";
L["Paste to Chat"] = "粘贴到聊天栏";
L["Toggle Tracking"] = "切换跟踪";
L["Add to / Remove from Watch List"] = "在跟踪列表中添加/移除";
L["Achievement is watched"] = "该成就在{watchList}中";
L["Achievement is excluded"] = "该成就被排除在外";
L["Needs to be defeated for achievement"] = "{forAchievement} 需要击败";
L["Already defeated for achievement"] = "{forAchievement} 已击败";
L["DF - Grand Hunts"] = "DF - 洪荒狩猎";
L["Grand Hunts: Ohn'ahran Plains"] = "洪荒狩猎: 欧恩哈拉平原";
L["Grand Hunts: The Waking Shore"] = "洪荒狩猎: 觉醒海岸";
L["Grand Hunts: Thaldraszus"] = "洪荒狩猎: 索德拉苏斯";
L["Grand Hunts: The Azure Span"] = "洪荒狩猎: 碧蓝林海";
L["DF - Community Feast"] = "DF - 社区盛宴";
L["Community Feast: Cooking"] = "社区盛宴: 烹饪";
L["Community Feast: Soon"] = "社区盛宴: 在即";
L["Community Feast: Ready"] = "社区盛宴: 就绪";
L["DF - Siege on Dragonbane Keep"] = "DF - 围攻灭龙要塞";
L["Siege on Dragonbane Keep: Active"] = "围攻灭龙要塞: 激活";
L["Siege on Dragonbane Keep: Gathering"] = "围攻灭龙要塞: 收集";
L["Siege on Dragonbane Keep"] = "围攻灭龙要塞";
L["Community Feast"] = "社区盛宴";
L["Needs to be petted for achievement"] = "{forAchievement} 需要抚摸";
L["Already petted for achievement"] = "{forAchievement} 已抚摸";
L["Toggle window once opened"] = "打开后切换窗口";
L["%d/%m/%Y %I:%M %p"] = "%d/%m/%Y %I:%M %p";
L["%m/%d/%Y %R"] = "%m/%d/%Y %R";
L["%m/%d/%Y %I:%M %p"] = "%m/%d/%Y %I:%M %p";
L["%Y/%m/%d %R"] = "%Y/%m/%d %R";
L["%Y/%m/%d %I:%M %p"] = "%Y/%m/%d %I:%M %p";
L["%c"] = "%c";
L["Show All Results in Category"] = "在分类中显示所有结果";
L["Search Results"] = "搜索结果";
L["Are you sure you want to delete character?"] = "是否确认删除 {character}？该角色在下次登录时会重新添加。如果你不想看到这个角色，请勾选 {ignore} 标签。";
L["In instances"] = "副本中";
L["On Event Start"] = "事件开始时";
L["Refresh interval"] = "刷新间隔";
L["Default value"] = "默认值";
L["Unchecked"] = "未勾选";
L["Checked"] = "已勾选";
L["Hide Date Completed"] = "隐藏完成时间";
L["Delay"] = "延迟";
L["Up"] = "上";
L["Down"] = "下";
L["Location"] = "位置";
L["Grow direction"] = "增长方向";
L["XYZ offset"] = "{xyz} 偏移量";
L["Placeholder"] = "占位符";
L["Chat messages"] = "聊天消息";
L["Diablo IV"] = "暗黑破坏神IV";

