--马场家园建设脚本


x430600_var_ScriptId            = 430600     --本脚本号             
x430600_var_varQuest	        = {10280,10281,10282,10283}      --内政任务ID
x430600_var_MissionName			= 	"【个人】兴修马场"
x430600_var_MissionDesc         = "\t    总堂最近战事紧张，你作为总堂的一员，应该承担起保护总堂的重任，你要接受兴修马场任务吗？"

x430600_SubmitvarTalknpc			    = {124000,124000,124000,124000}
x430600_varTalknpc = nil
x430600_RecordCache = nil

x430600_var_AddQuestErrorTip    = "任务已满，任务接受失败"  --添加任务失败提示
x430600_var_MissionFinishTip    = "任务已经完成，快点回去汇报吧！" --任务完成提示
x430600_var_AcceptMissionTip    = "您接受了任务：【个人】兴修马场(%d/%d)" -- 接受任务提示
x430600_var_AbandonMissionTip   = "您放弃了兴修马场任务，今日将不能再接取兴修马场任务！" ---- 放弃任务提示
x430600_var_BoxAwardTip         = "您意外获得了一个@item_%d的奖励"
x430600_var_BoxAwaredBroadCast1  = "%s在完成兴修马场任务时表现突出，获得神秘奖励"
x430600_var_BoxAwaredBroadCast2  = "%s完成所有兴修马场任务，获得一个总堂战利品"
x430600_var_SmallTip = "#W  每环任务会消耗#G1点体力值#W，环数增加经验也会随之增加，杀怪任务#G使用随身商店出售的移形幻影符#W能直接传送到相应地图。"
x430600_var_EquipCommitTip = "您想上交哪件装备呢？"

--任务限制及次数配置
x430600_var_LevelLess           = 40         --可接任务最小等级
x430600_var_LevelMax            = 80         --可接任务最大等级


--宝箱配置
--x430600_NormalBoxId = 12250010           --普通宝箱物品ID
x430600_GoodBoxId = 12030060             --高级宝箱物品ID
x430600_GetNormalBoxProbability = 3     --每一环得到普通宝箱概率
x430600_GetGoodBoxTimesNum      = 100    --每多少环获得一个高级宝箱



--任务类型配置
x430600_MissionType_Item = 1         --收集物品
x430600_MissionType_Find = 2         --找人
x430600_MissionType_Kill = 3         --杀怪
x430600_MissionType_Equip = 4        --收集装备

--记录任务数据所用数据索引配置
x430600_MP_MissionType			    = 1         -- 任务类型
x430600_MP_MissionGuid				= 2         -- 任务表格索引标示
x430600_MP_TargetId					= 3         -- 任务目标，收集的话是物品id,找人的话是varTalknpc,杀怪的话是怪物id
x430600_MP_TargetCount			    = 4         -- 任务目标个数
x430600_MP_KillCount				= 5         -- 杀怪计数
x430600_MP_KillvarMap				= 6         -- 杀怪任务场景ID
x430600_MP_AcceptWeek               = 0         -- 哪一周接的任务 
x430600_MP_ISCOMPLETE			    = 7	        -- 代表完成 0未完成， 1完成

--gameopen开关
x430600_var_GameId	= 1056

--每周任务最大环数，由等级决定
x430600_MaxWeekTimes = 
{
    { minLevel = 60, maxLevel = 160, times = 30 },
}

--任务类型概率配置
x430600_MissionType_Probability = 
{
    { minLevel = 40, maxLevel = 100, itemPro = 70, findPro = 30, killPro = 0, equipPro=0 },

}

--收集任务配置----------------------------------------------------------------------------------
--x430600_ItemSourceShop = 1       --从商店里买
--x430600_ItemSourceNotShop = 2    --非商店买的东西
--x430600_ItemMissionTargetBuy = "前往@npc_%d处购买@item_%d"  --从商店里买的任务目标文字
--x430600_ItemMissionTargetNotBuy = "收集@item_%d"            --非商店买的任务目标文字

x430600_ItemTypeProbability = --环数决定 普通物品，有难度物品的概率
{
    { minTimes = 1,   maxTimes = 100, normalPro = 100, specialPro = 0 },

} 
x430600_ItemNormal = --普通物品任务表 guid从10000开始
{
{guid=10000,itemId=11030001,count=20,minLevel=60,maxLevel=160,pro=20,target="  找到#R20#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10001,itemId=11030003,count=15,minLevel=60,maxLevel=160,pro=20,target="  找到#R15#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10002,itemId=11030005,count=10,minLevel=60,maxLevel=160,pro=20,target="  找到#R10#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10003,itemId=11030007,count=5,minLevel=70,maxLevel=160,pro=20,target="  找到#R5#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R70#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10004,itemId=11030401,count=20,minLevel=60,maxLevel=160,pro=20,target="  找到#R20#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10005,itemId=11030402,count=15,minLevel=60,maxLevel=160,pro=20,target="  找到#R15#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10006,itemId=11030403,count=10,minLevel=60,maxLevel=160,pro=20,target="  找到#R10#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10007,itemId=11030404,count=5,minLevel=70,maxLevel=160,pro=20,target="  找到#R5#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R70#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10008,itemId=11030406,count=5,minLevel=60,maxLevel=160,pro=20,target="  找到#R5#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10009,itemId=11030502,count=5,minLevel=60,maxLevel=160,pro=20,target="  找到#R5#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10010,itemId=12267000,count=5,minLevel=80,maxLevel=160,pro=20,target="  找到#R5#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R80#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10011,itemId=12267001,count=5,minLevel=80,maxLevel=160,pro=20,target="  找到#R5#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R80#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10012,itemId=12267002,count=5,minLevel=80,maxLevel=160,pro=20,target="  找到#R5#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R80#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10013,itemId=11041000,count=20,minLevel=60,maxLevel=160,pro=20,target="  找到#R20#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10014,itemId=11041001,count=15,minLevel=60,maxLevel=160,pro=20,target="  找到#R15#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10015,itemId=11041002,count=5,minLevel=60,maxLevel=160,pro=20,target="  找到#R5#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10016,itemId=11041003,count=1,minLevel=70,maxLevel=160,pro=20,target="  找到#R1#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R70#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10017,itemId=11041010,count=20,minLevel=60,maxLevel=160,pro=20,target="  找到#R20#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10018,itemId=11041011,count=15,minLevel=60,maxLevel=160,pro=20,target="  找到#R15#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10019,itemId=11041012,count=5,minLevel=60,maxLevel=160,pro=20,target="  找到#R5#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10020,itemId=11041013,count=1,minLevel=70,maxLevel=160,pro=20,target="  找到#R1#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R70#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10021,itemId=11041020,count=20,minLevel=60,maxLevel=160,pro=20,target="  找到#R20#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10022,itemId=11041021,count=15,minLevel=60,maxLevel=160,pro=20,target="  找到#R15#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10023,itemId=11041022,count=5,minLevel=60,maxLevel=160,pro=20,target="  找到#R5#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10024,itemId=11041023,count=1,minLevel=70,maxLevel=160,pro=20,target="  找到#R1#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R70#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10025,itemId=11041030,count=20,minLevel=60,maxLevel=160,pro=20,target="  找到#R20#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10026,itemId=11041031,count=15,minLevel=60,maxLevel=160,pro=20,target="  找到#R15#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10027,itemId=11041032,count=5,minLevel=60,maxLevel=160,pro=20,target="  找到#R5#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10028,itemId=11041033,count=1,minLevel=70,maxLevel=160,pro=20,target="  找到#R1#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R70#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10029,itemId=11041040,count=20,minLevel=60,maxLevel=160,pro=20,target="  找到#R20#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10030,itemId=11041041,count=15,minLevel=60,maxLevel=160,pro=20,target="  找到#R15#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10031,itemId=11041042,count=5,minLevel=60,maxLevel=160,pro=20,target="  找到#R5#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10032,itemId=11041043,count=1,minLevel=70,maxLevel=160,pro=20,target="  找到#R1#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R70#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10033,itemId=11041050,count=20,minLevel=60,maxLevel=160,pro=20,target="  找到#R20#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10034,itemId=11041051,count=15,minLevel=60,maxLevel=160,pro=20,target="  找到#R15#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10035,itemId=11041052,count=5,minLevel=60,maxLevel=160,pro=20,target="  找到#R5#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R60#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10036,itemId=11041053,count=1,minLevel=70,maxLevel=160,pro=20,target="  找到#R1#W个@item_%d#W送到马场",desc="  这个真不是一个小工程啊，现在@item_%d又紧缺了，你去找到#R70#W个@item_%d#W送到这里来",continueInfo="  此事紧急，速速出发吧！不要耽误了马场修建进度！",completeInfo="  嗯不错不错，这批物资能暂解决燃煤之急了。",},
{guid=10037,itemId=13810450,count=1,minLevel=40,maxLevel=59,pro=20,target="  找到#R3#W个@item_%d#W送到酒仙这里",desc="  总堂正在秘密筹备大批装备来对抗清军的进攻，现在需要大量@item_%d#W，但又不能太张扬，你去收集3个@item_%d#W送到这里来，注意万事一定要低调万万不可暴露了你此行的目的。",continueInfo="  此事紧急，不可拖延，速速出发吧！再次提醒你一定要低调行事,不可暴露了！",completeInfo="  东西送来了啊，太感谢你了，总堂会记住你的帮助的。",},
{guid=10038,itemId=13810451,count=1,minLevel=40,maxLevel=59,pro=20,target="  找到#R3#W个@item_%d#W送到酒仙这里",desc="  总堂正在秘密筹备大批装备来对抗清军的进攻，现在需要大量@item_%d#W，但又不能太张扬，你去收集3个@item_%d#W送到这里来，注意万事一定要低调万万不可暴露了你此行的目的。",continueInfo="  此事紧急，不可拖延，速速出发吧！再次提醒你一定要低调行事,不可暴露了！",completeInfo="  东西送来了啊，太感谢你了，总堂会记住你的帮助的。",},

}
x430600_ItemSpecial =  --有难度物品任务表 guid从15000开始
{
{guid=15001,itemId=11010163,count=5,minLevel=40,maxLevel=59,pro=20,target="  找到#R5#W个@item_%d#W送到酒仙这里",desc="  总堂正在秘密筹备大批装备来对抗清军的进攻，现在需要大量@item_%d#W，但又不能太张扬，你去收集5个@item_%d#W送到这里来，注意万事一定要低调万万不可暴露了你此行的目的。",continueInfo="  此事紧急，不可拖延，速速出发吧！再次提醒你一定要低调行事,不可暴露了！",completeInfo="  东西送来了啊，太感谢你了，总堂会记住你的帮助的。",},

}

--找人送信任务配置-----------------------------------------------------------------
--x430600_FindNpcTarget="寻找@npc_"
x430600_NpcTable =                  --找人任务配置表 guid从20000开始
{
{guid=20000,npcId={123709,126008,129006,132008,},minLevel=40,maxLevel=59,pro=10,target=" 去#G王城#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G王城#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20001,npcId={123710,126009,129007,132009,},minLevel=40,maxLevel=59,pro=10,target=" 去#G王城#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G王城#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20002,npcId={123727,126024,129024,132024,},minLevel=40,maxLevel=59,pro=10,target=" 去#G王城#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G王城#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20003,npcId={123728,126025,129025,132025,},minLevel=40,maxLevel=59,pro=10,target=" 去#G王城#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G王城#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20004,npcId={123729,126026,129026,132026,},minLevel=40,maxLevel=59,pro=10,target=" 去#G王城#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G王城#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20005,npcId={123730,126027,129027,132027,},minLevel=40,maxLevel=59,pro=10,target=" 去#G王城#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G王城#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20006,npcId={123735,126031,129032,132031,},minLevel=40,maxLevel=59,pro=10,target=" 去#G王城#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G王城#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20007,npcId={123736,126032,129033,132032,},minLevel=40,maxLevel=59,pro=10,target=" 去#G王城#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G王城#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20008,npcId={123737,126033,129034,132033,},minLevel=40,maxLevel=59,pro=10,target=" 去#G王城#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G王城#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20009,npcId={123742,126038,129039,132038,},minLevel=40,maxLevel=59,pro=10,target=" 去#G王城#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G王城#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20010,npcId={123846,126146,129759,132170,},minLevel=40,maxLevel=59,pro=10,target=" 去#G王城#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G王城#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20011,npcId={139062,139062,139062,139062,},minLevel=40,maxLevel=59,pro=10,target=" 去#G大都#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G大都#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20012,npcId={139063,139063,139063,139063,},minLevel=40,maxLevel=59,pro=10,target=" 去#G大都#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G大都#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20013,npcId={139068,139068,139068,139068,},minLevel=40,maxLevel=59,pro=10,target=" 去#G大都#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G大都#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20014,npcId={139077,139077,139077,139077,},minLevel=40,maxLevel=59,pro=10,target=" 去#G大都#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G大都#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},
{guid=20015,npcId={139092,139092,139092,139092,},minLevel=40,maxLevel=59,pro=10,target=" 去#G大都#W寻找@npc_%d",desc="  马场正在大兴土木，需要大量各种资源，你去#G大都#W找#G@npcname_%d#W催一催，让他把他手里货尽快筹备好送过来，要不耽误了马场建设的进度。",talking="  关于兴修马场需要的那批货你那里准备的怎么样了？",continueInfo="  速速启程，工人们正等着这批物资运到呢！",completeInfo="  嗯？就快到了，唉这些人做事真是墨迹，严重影响施工进度啊！"},

}

--打怪任务配置------------------------------------------------------------------------
x430600_KillTypeProbability = --环数决定 普通怪，高级怪的概率
{
    { minTimes = 1,   maxTimes = 39, normalPro = 100, specialPro = 0 },
    { minTimes = 40, maxTimes = 89, normalPro = 80, specialPro = 20 },
    { minTimes = 90, maxTimes = 99, normalPro = 60, specialPro = 40 },
    { minTimes = 100,   maxTimes = 139, normalPro = 100, specialPro = 0 },
    { minTimes = 140, maxTimes = 189, normalPro = 80, specialPro = 20 },
    { minTimes = 190, maxTimes = 199, normalPro = 60, specialPro = 40 },
    { minTimes = 200,   maxTimes = 239, normalPro = 100, specialPro = 0 },
    { minTimes = 240, maxTimes = 289, normalPro = 80, specialPro = 20 },
    { minTimes = 290, maxTimes = 300, normalPro = 60, specialPro = 40 },
}

x430600_MonsterNormal = --普通怪 guid从30000开始
{
{guid=30000,monsterId=6040,scene=1604,monsterName="吐熄者",count=3,minLevel=40,maxLevel=49,pro=80,target="  前往#G@varMap_%d#W,消灭#R3#W个%s",desc="\t  总堂危机四伏，需要你的?明，不过为了你自身的安危，请你前往#G@varMap_%d#W消灭#R3#W个%s锻炼身手，路途中可能并不太平，你要多加小心。",continueInfo="  怎么，胆怯了？你可要知道，你自身不强大起来是没有人能护得住你的。",completeInfo="  少侠身手不凡啊，看来以后总堂的安危托付在你手里是没什么大问题的了！"},

}

x430600_MonsterSpecial = --难度怪 guid从35000开始
{
{guid=35000,monsterId=6060,scene=1607,monsterName="沙蜥",count=3,minLevel=40,maxLevel=49,pro=0,target="  前往#G@varMap_%d#W,消灭#R3#W个%s",desc="\t  总堂危机四伏，需要你的?明，不过为了你自身的安危，请你前往#G@varMap_%d#W消灭#R3#W个%s锻炼身手，路途中可能并不太平，你要多加小心。",continueInfo="  怎么，胆怯了？你可要知道，你自身不强大起来是没有人能护得住你的。",completeInfo="  少侠身手不凡啊，看来以后总堂的安危托付在你手里是没什么大问题的了！"},

}

--装备收集表,guid从40000开始
--Color_White=0,Color_Blue=1,Color_Greed=2,Color_Yellow=3,Color_Purple=4,Color_Orange=5,Color_DIY=6,Color_Max,

x430600_ColorTable = { "白色","蓝色", "绿色", "黄色", "紫色", "橙色" }		
x430600_QualityTable = { "一阶", "二阶", "三阶", "四阶", "五阶" }
x430600_Equip = 
{
{guid=40000,itemId=10232030,color=1,quality=-1,minLevel=40,maxLevel=159,pro=30,target="  找到#R1#W个%s@item_%d#W送到酒仙这里",desc="  总堂正在秘密筹备大批装备来对抗清军的进攻，现在需要大量@item_%d#W，但又不能太张扬，你去收集#R1个%s@item_%d#W送到这里来，注意万事一定要低调万万不可暴露了你此行的目的。",continueInfo="  此事紧急，不可拖延，速速出发吧！再次提醒你一定要低调行事,不可暴露了！",completeInfo="  东西送来了啊，太感谢你了，总堂会记住你的帮助的。",},

}



---------------------------------------------------------------------------

function x430600_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

	if GetGameOpenById(x430600_var_GameId)<=0 then
		x430600_ShowTips(varMap, varPlayer,"此功能暂时无法使用")
		return
	end
	
	local level = GetLevel( varMap, varPlayer)
	if level < x430600_var_LevelLess or level >= x430600_var_LevelMax then
		 return
	end
	
	--x430600_DeleteQuestIfWeekChanged( varMap, varPlayer )

    local state = GetQuestStateNM( varMap, varPlayer, varTalknpc, x430600_GetvarQuest(varMap, varPlayer))
    TalkAppendButton( varMap, x430600_GetvarQuest(varMap, varPlayer), x430600_var_MissionName, state, 1)
end

function x430600_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExtIdx)	

   	if GetGameOpenById(x430600_var_GameId)<=0 then
		x430600_ShowTips(varMap, varPlayer,"此功能暂时无法使用")
		return
	end
     
--   if GetTopListInfo_MinLevel(-1) < x430600_var_LevelLess then 
--		Msg2Player(varMap, varPlayer,"很抱歉，等级排行榜最后一名玩家未到"..x430600_var_LevelLess.."级，无法领取兴修马场任务。",8,3)
--		return 
--   end 
   local country = GetCurCountry( varMap, varPlayer )
   if IsHaveQuest( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer) ) > 0 then  
 
        local bDone = x430600_CheckSubmit( varMap, varPlayer, varTalknpc)
             
        if bDone > 0 then
            if GetMonsterGUID(varMap, varTalknpc) == x430600_SubmitvarTalknpc[country+1] then --检查提交NPC
                x430600_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) --完成任务显示  
            end
        else
            x430600_DispatchContinueInfo( varMap, varPlayer, varTalknpc ) --未完成任务显示
        end
        
   else --未接任务
        
        --检查今日是否放弃过 
        local curWeek = x430600_GetCurrentWeek()
        if curWeek == x430600_GetQuitWeek(varMap, varPlayer) then
            Msg2Player( varMap, varPlayer, "您今日不能再领取兴修马场任务了，请下周再来吧。", 8, 2)
            Msg2Player( varMap, varPlayer, "您今日不能再领取兴修马场任务了，请下周再来吧。", 8, 3)
            return
        end
        
        --检查今日是否完成全部环
        if x430600_GetMaxWeekTimes(varMap, varPlayer) <= x430600_GetFinishTimes(varMap, varPlayer) 
           and curWeek == x430600_GetFinishWeek(varMap, varPlayer) then
            Msg2Player( varMap, varPlayer, "您今日不能再领取兴修马场任务了，请下周再来吧。", 8, 2)
            Msg2Player( varMap, varPlayer, "您今日不能再领取兴修马场任务了，请下周再来吧。", 8, 3)
            return
        end
        
        x430600_DispatchMissionInfo( varMap, varPlayer, varTalknpc)	--任务信息显示
   end
               
end

--------------------------------------------------------------------------- 
function x430600_DispatchMissionInfo( varMap, varPlayer, varTalknpc) --显示接任务信息
	StartTalkTask( varMap )
		--任务信息
		TalkAppendString( varMap, "#Y"..x430600_var_MissionName)
		TalkAppendString( varMap, x430600_var_MissionDesc )
		TalkAppendString( varMap, format("        #R今日任务已完成%d次。 ",x430600_GetFinishTimes(varMap,varPlayer)))

		--任务奖励信息
        local exp = x430600_GetExpAward( varMap, varPlayer )
        local siller_card = x430600_GetMoneyAward( varMap, varPlayer )
        if( exp > 0) then
            AddQuestExpBonus( varMap, exp )
        end
        if( siller_card > 0 ) then
            AddQuestMoneyBonus1( varMap, siller_card )
        end
        
        --小提示
        TalkAppendString( varMap, "\n#c00FF00小提示:" )
        TalkAppendString( varMap, x430600_var_SmallTip )
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x430600_var_ScriptId, x430600_GetvarQuest(varMap, varPlayer))
end

--------------------------------------------------------------------------- 
function x430600_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) --显示任务完成信息
    local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
    local misType = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionType)
    local misTableIndex = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionGuid )
        
    StartTalkTask( varMap)
       
        TalkAppendString( varMap, "#Y"..x430600_var_MissionName)
        TalkAppendString( varMap, x430600_GetMissionInfo(misTableIndex,"completeInfo"))
        
        local exp = x430600_GetExpAward( varMap, varPlayer )
        local siller_card = x430600_GetMoneyAward( varMap, varPlayer )
        if( exp > 0) then
            AddQuestExpBonus( varMap, exp)
        end
        if( siller_card > 0) then
            AddQuestMoneyBonus1( varMap, siller_card)
        end

    StopTalkTask()
    DeliverTalkContinueNM( varMap, varPlayer, varTalknpc, x430600_var_ScriptId, x430600_GetvarQuest(varMap, varPlayer))

end
---------------------------------------------------------------------------
function x430600_GetMissionInfoValue( strKey )
    
    if strKey == "completeInfo" then
        if x430600_RecordCache ~= nil and x430600_RecordCache.completeInfo ~= nil then
            return x430600_RecordCache.completeInfo
        else
            return ""
        end    
    elseif strKey == "continueInfo" then
        
        if x430600_RecordCache ~= nil and x430600_RecordCache.continueInfo ~= nil then
            return x430600_RecordCache.continueInfo
        else
            return ""
        end  
    
    elseif strKey == "desc" then
        
        if x430600_RecordCache ~= nil and x430600_RecordCache.desc ~= nil then
            return x430600_RecordCache.desc
        else
            return ""
        end  
    
    elseif strKey == "target" then
        
        if x430600_RecordCache ~= nil and x430600_RecordCache.target ~= nil then
            return x430600_RecordCache.target
        else
            return ""
        end  
    
    elseif strKey == "talking" then
        
        if x430600_RecordCache ~= nil and x430600_RecordCache.talking ~= nil then
            return x430600_RecordCache.talking
        else
            return ""
        end  
    
    elseif strKey == "monsterName" then
    
        if x430600_RecordCache ~= nil and x430600_RecordCache.monsterName ~= nil then
            return x430600_RecordCache.monsterName
        else
            return ""
        end  
    
    elseif strKey == "scene" then
        
        if x430600_RecordCache ~= nil and x430600_RecordCache.scene ~= nil then
            return x430600_RecordCache.scene
        else
            return -1
        end  
    elseif strKey == "color" then
        if x430600_RecordCache ~= nil and x430600_RecordCache.color ~= nil then
            return x430600_RecordCache.color
        else
            return nil
        end  
    elseif strKey == "quality" then
        if x430600_RecordCache ~= nil and x430600_RecordCache.quality ~= nil then
            return x430600_RecordCache.quality
        else
            return nil
        end  
    end
end

function x430600_GetMissionInfo( missionGuid, strKey ) --得到任务文字信息
    
    if x430600_RecordCache ~= nil then
        if x430600_RecordCache.guid == missionGuid then
            return x430600_GetMissionInfoValue( strKey )
        end
    end
    
    local tableRef = nil
    if missionGuid >= 10000 and missionGuid < 20000 then --收集任务
        if missionGuid < 15000 then
            tableRef = x430600_ItemNormal
        else
            tableRef = x430600_ItemSpecial
        end
                 
    elseif missionGuid >= 20000 and missionGuid < 30000 then --找人任务
        tableRef = x430600_NpcTable
    
    elseif missionGuid >= 30000 and missionGuid < 40000 then --杀怪任务
        if missionGuid < 35000 then
            tableRef = x430600_MonsterNormal
        else
            tableRef = x430600_MonsterSpecial
        end
    
    elseif missionGuid >= 40000 then --装备任务
        tableRef =  x430600_Equip               
    end
    
    if tableRef == nil then
        x430600_RecordCache = nil
    else
        for i, item in tableRef do
            if item.guid == missionGuid then
                x430600_RecordCache = item
            end
        end
    end
    
    return x430600_GetMissionInfoValue( strKey ) 
   
end

-------------------------------------------------------------------------------
function x430600_DispatchContinueInfo( varMap, varPlayer, varTalknpc ) ---任务未完成显示
	local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
    local misType = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionType)
    local misGuid = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionGuid )

    if misType == x430600_MissionType_Find then
        local targetId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId)
        if GetMonsterGUID( varMap, varTalknpc) == targetId then
        
            SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 1)
            x430600_ProcQuestLogRefresh( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer) )
            Msg2Player( varMap, varPlayer, x430600_var_MissionFinishTip, 8, 3)
            
            StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x430600_var_MissionName)
            TalkAppendString( varMap, x430600_GetMissionInfo( misGuid, "talking" ))
            StopTalkTask()
            DeliverTalkMenu( varMap, varPlayer, varTalknpc)            
            
            return  
        end
    end
    
    StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x430600_var_MissionName)
    TalkAppendString( varMap, x430600_GetMissionInfo(misGuid,"continueInfo") )
    StopTalkTask()
    DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x430600_var_ScriptId, x430600_GetvarQuest(varMap, varPlayer))
    
end

---------------------------------------------------------------------------
function x430600_CheckSubmit( varMap, varPlayer, varTalknpc) --任务是否可以提交
	local misIndex = GetQuestIndexByID(varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
	return GetQuestParam(varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE)
end

---------------------------------------------------------------------------
function x430600_GetCurrentWeek()
	local nCurrentTime = ( GetCurrentTime() + 8 * 3600) / 86400 - 4
	local nWeek =  GetDayOfYear()
	return nWeek
end

---------------------------------------------------------------------------
function x430600_GetMaxWeekTimes(varMap,varPlayer)
    local myLevel = GetLevel( varMap, varPlayer )
    for i, item in x430600_MaxWeekTimes do
        if myLevel >= item.minLevel and myLevel <= item.maxLevel then
            return item.times
        end
    end
    return 0
end

---------------------------------------------------------------------------
function x430600_GetFinishTimes(varMap,varPlayer)
    
    local curWeek = x430600_GetCurrentWeek()
    local finishWeek = x430600_GetFinishWeek( varMap,varPlayer )
    if curWeek ~= finishWeek then
        return 0
    end
    
    local curTimes = GetPlayerGameData(varMap,varPlayer,MD_COUNTRY_NEIZHENG_CIRCLES[1],MD_COUNTRY_NEIZHENG_CIRCLES[2],MD_COUNTRY_NEIZHENG_CIRCLES[3])
    if curTimes < 0 then
        curTimes = 0
    end
    return curTimes
    
end

---------------------------------------------------------------------------
function x430600_GetFinishWeek( varMap,varPlayer )
    
    return GetPlayerGameData(varMap,varPlayer,MD_COUNTRY_NEIZHENG_WEEK[1],MD_COUNTRY_NEIZHENG_WEEK[2],MD_COUNTRY_NEIZHENG_WEEK[3])
    
end


---------------------------------------------------------------------------
function x430600_AddFinishTimes(varMap,varPlayer) 
    
    local mdWeek = GetPlayerGameData(varMap,varPlayer,MD_COUNTRY_NEIZHENG_WEEK[1],MD_COUNTRY_NEIZHENG_WEEK[2],MD_COUNTRY_NEIZHENG_WEEK[3]);
    local curWeek = x430600_GetCurrentWeek()
    local curTimes = 0
    
    if mdWeek ~= curWeek then
        SetPlayerGameData(varMap,varPlayer,MD_COUNTRY_NEIZHENG_WEEK[1],MD_COUNTRY_NEIZHENG_WEEK[2],MD_COUNTRY_NEIZHENG_WEEK[3],curWeek)
        curTimes = 1
    else
        curTimes = GetPlayerGameData(varMap,varPlayer,MD_COUNTRY_NEIZHENG_CIRCLES[1],MD_COUNTRY_NEIZHENG_CIRCLES[2],MD_COUNTRY_NEIZHENG_CIRCLES[3])
        curTimes = curTimes + 1
    end
    
    
    SetPlayerGameData(varMap,varPlayer,MD_COUNTRY_NEIZHENG_CIRCLES[1],MD_COUNTRY_NEIZHENG_CIRCLES[2],MD_COUNTRY_NEIZHENG_CIRCLES[3],curTimes)
    
    return curTimes
end

---------------------------------------------------------------------------
function x430600_SetQuitWeek( varMap, varPlayer ) --设置放弃周
    local curWeek = x430600_GetCurrentWeek()
    SetPlayerGameData(varMap,varPlayer,MD_COUNTRY_NEIZHENG_WEEK_QUIT[1],MD_COUNTRY_NEIZHENG_WEEK_QUIT[2],MD_COUNTRY_NEIZHENG_WEEK_QUIT[3],curWeek)

    --清空环数
    SetPlayerGameData(varMap,varPlayer,MD_COUNTRY_NEIZHENG_CIRCLES[1],MD_COUNTRY_NEIZHENG_CIRCLES[2],MD_COUNTRY_NEIZHENG_CIRCLES[3],0)
end

---------------------------------------------------------------------------
function x430600_GetQuitWeek( varMap, varPlayer ) --查询放弃周
   return GetPlayerGameData(varMap,varPlayer,MD_COUNTRY_NEIZHENG_WEEK_QUIT[1],MD_COUNTRY_NEIZHENG_WEEK_QUIT[2],MD_COUNTRY_NEIZHENG_WEEK_QUIT[3])
end

---------------------------------------------------------------------------
function x430600_GetExpAward( varMap, varPlayer ) --计算经验奖励
	local curTimes = 1+GetPlayerGameData(varMap,varPlayer,MD_COUNTRY_NEIZHENG_CIRCLES[1],MD_COUNTRY_NEIZHENG_CIRCLES[2],MD_COUNTRY_NEIZHENG_CIRCLES[3])
    local xiaolv = 0
    local exp =0
    local level = GetLevel( varMap, varPlayer )
    if curTimes<40 then
        xiaolv=0.005*curTimes+1.41 
    elseif curTimes>39 and curTimes<90 then
        xiaolv=0.01*(curTimes-39)+1.68
    elseif curTimes>89 and curTimes<101 then
        xiaolv=0.055*(curTimes-89)+2.745
    elseif curTimes>100 and curTimes<140 then
       xiaolv=0.02*(curTimes-100) + 1.41 
    elseif curTimes>139 and curTimes<190 then
        xiaolv=0.02*(curTimes-139) + 1.8 
    elseif curTimes>189 and curTimes<201 then
        xiaolv=0.005*(curTimes-189) + 3.66 
    elseif curTimes>200 and curTimes<240 then
        xiaolv=0.03*(curTimes-200) + 1.65 
    elseif curTimes>239 and curTimes<290 then
        xiaolv= 0.005*(curTimes-239) + 2.795 
    elseif curTimes>289 and curTimes<301 then
    	xiaolv=0.147*(curTimes-289) + 3.727 
    end
    exp =(level*level+level+5)*30*xiaolv
    
    return floor(exp)
end


--提交装备后给经验奖励的公式
--needColor 任务至少需要的颜色
--needQuality 任务至少需要的阶
--realColor 实际提交物品的颜色
--realQuality 实际提交物品的阶
function x430600_GetExpAwardForEquip( varMap, varPlayer, needColor,needQuality, realColor, realQuality )

    return x430600_GetExpAward( varMap, varPlayer )

end

---------------------------------------------------------------------------
function x430600_GetMoneyAward( varMap, varPlayer ) --计算银卡奖励

    return 0
end

---------------------------------------------------------------------------
function x430600_ProcAcceptCheck( varMap, varPlayer, varTalknpc)


end

function x430600_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest) --接任务

	if GetGameOpenById(x430600_var_GameId)<=0 then
		x430600_ShowTips(varMap, varPlayer,"此功能暂时无法使用")
		return
	end
	
	if IsHaveQuestNM( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer)) > 0 then
	    return
	end
	
	 --检查今日是否放弃过 
    local curWeek = x430600_GetCurrentWeek()
    if curWeek == x430600_GetQuitWeek(varMap, varPlayer) then
        Msg2Player( varMap, varPlayer, "您今日不能再领取兴修马场任务了，请下周再来吧。", 8, 2)
        Msg2Player( varMap, varPlayer, "您今日不能再领取兴修马场任务了，请下周再来吧。", 8, 3)
        return
    end
    
    --检查今日是否完成全部环
    if x430600_GetMaxWeekTimes(varMap, varPlayer) <= x430600_GetFinishTimes(varMap, varPlayer) 
       and curWeek == x430600_GetFinishWeek(varMap, varPlayer) then
        Msg2Player( varMap, varPlayer, "您今日不能再领取兴修马场任务了，请下周再来吧。", 8, 2)
        Msg2Player( varMap, varPlayer, "您今日不能再领取兴修马场任务了，请下周再来吧。", 8, 3)
        return
    end
    
    --消耗体力
--    local nXiaoHao = 1
--    local nCurPhysicalForce = GetPhysicalForce(varMap, varPlayer)
--    if nCurPhysicalForce < nXiaoHao then
--        Msg2Player( varMap, varPlayer, "您的体力值不够。", 8, 2)
--        Msg2Player( varMap, varPlayer, "您的体力值不够。", 8, 3)
--        return
--    end

    --1)随机任务类型
    local missionType = -1
    local curLevel = GetLevel( varMap, varPlayer )
    for i, item in x430600_MissionType_Probability do
        if curLevel >= item.minLevel and curLevel <= item.maxLevel then
            local randMax = item.itemPro + item.findPro + item.killPro + item.equipPro
            local rand = random( 1, randMax )
            if rand <= item.itemPro then
                missionType = x430600_MissionType_Item
            elseif rand <= ( item.itemPro + item.findPro ) then
                missionType = x430600_MissionType_Find
            elseif rand <= ( item.itemPro + item.findPro + item.killPro ) then
                missionType =  x430600_MissionType_Kill             
            else
                missionType = x430600_MissionType_Equip
            end
            
            break
        end
    end
    
    if missionType == -1 then
        WriteLog(1,"x430600_ProcQuestAccept Random MisionType Failed!");
        return
    end
    
    local ret = 0
    if missionType == x430600_MissionType_Item  then --收集
        ret = x430600_ItemAppendQuest(varMap, varPlayer, varTalknpc)
    elseif missionType == x430600_MissionType_Find then --找人
        ret = x430600_AddFindQuest(varMap, varPlayer, varTalknpc)
    elseif missionType == x430600_MissionType_Kill then --杀怪
        ret = x430600_AddKillQuest(varMap, varPlayer, varTalknpc)
    elseif missionType == x430600_MissionType_Equip then --收集装备
        ret = x430600_AddEquipQuest(varMap, varPlayer, varTalknpc )
    end
       
    if ret == 0 then
        WriteLog( 1, 
            format( "x430600_ProcQuestAccept AddQuest Fail!Map=%d,Player=%X",varMap,varPlayer ) );
        return
    end
    
    local strTips = format( x430600_var_AcceptMissionTip, x430600_GetFinishTimes(varMap,varPlayer)+1,
                            x430600_GetMaxWeekTimes(varMap,varPlayer) )
    Msg2Player( varMap, varPlayer, strTips, 8, 3)
    Msg2Player( varMap, varPlayer, strTips, 8, 2)
    
            
    if missionType == x430600_MissionType_Item  then --收集
        
        local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
        local itemId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId)
        local itemCount = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetCount)
        
        if GetItemCountInBag( varMap, varPlayer, itemId) >= itemCount then
            SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 1)
            Msg2Player( varMap, varPlayer, x430600_var_MissionFinishTip, 8, 3)
        end
        
    end
    
    
    

    -- 更新任务跟踪
    x430600_ProcQuestLogRefresh( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))

    -- 写日志
    GamePlayScriptLog( varMap, varPlayer, 5002)

end

--------------------------------------------------------------------------
function x430600_ItemAppendQuest( varMap, varPlayer, varTalknpc ) --给玩家添加一个收集物品任务
    
    local level = GetLevel( varMap, varPlayer )
    local topList_MinLevel = GetTopListInfo_MinLevel( -1 )
    local curTimes = x430600_GetFinishTimes(varMap, varPlayer) + 1
    
    --随机普通还是特殊
    local tableRef = nil
    for i, item in x430600_ItemTypeProbability do
        if curTimes >= item.minTimes and curTimes <= item.maxTimes then
            local randMax = item.normalPro + item.specialPro 
            local rand = random( 1, randMax )
            if rand <= item.normalPro then
                tableRef = x430600_ItemNormal
            else
                tableRef = x430600_ItemSpecial
            end
        
            break
        end
    end
    
    
    if tableRef == nil then
        WriteLog( 1, "x430600_ItemAppendQuest tableRef is nil!" )
        return 0
    end
    
    
    local randMax = 0
    for i,item in tableRef do
        if  level >= item.minLevel and level <= item.maxLevel then
            randMax = randMax + item.pro
        end
    end
    
    if randMax <= 0 then
        WriteLog( 1, "x430600_ItemAppendQuest randMax ="..randMax )
        return 0
    end
    
    local tableIndex = -1
    local rand = random( 1, randMax )
    local temp = 0
    for i, item in tableRef do
        if   level >= item.minLevel and level <= item.maxLevel then
            if rand > temp and rand <= temp + item.pro then
               tableIndex = i
               break
            end
            
            temp = temp + item.pro
        end 
    end
    
    if tableIndex == -1 then
        WriteLog( 1, "x430600_ItemAppendQuest rand tableIndex failed!" )
        return 0
    end
    
    local result = AddQuest( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer), x430600_var_ScriptId, 0, 0, 1, 0)
     if result == 0 then
        Msg2Player( varMap, varPlayer, x430600_var_AddQuestErrorTip, 8, 3)
        return 0
    end
    
    local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_MissionType, x430600_MissionType_Item)
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_MissionGuid, tableRef[tableIndex].guid )
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_TargetId, tableRef[tableIndex].itemId )
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_TargetCount, tableRef[tableIndex].count )
	SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_KillvarMap,-1)
	SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_AcceptWeek, x430600_GetCurrentWeek() ) 
	SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 0)
	
    StartTalkTask( varMap)
        --任务继续信息
        TalkAppendString( varMap, "#Y"..x430600_var_MissionName)
        TalkAppendString( varMap, format( tableRef[tableIndex].desc,tableRef[tableIndex].itemId,tableRef[tableIndex].itemId) )
        TalkAppendString( varMap, "#r" )
        TalkAppendString( varMap, "#Y任务目标:" )
        TalkAppendString( varMap, format(tableRef[tableIndex].target,tableRef[tableIndex].itemId) )
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc )
    return 1

end

function x430600_AddFindQuest( varMap, varPlayer, varTalknpc ) --给玩家添加一个找人任务
    
    local country = GetCurCountry( varMap, varPlayer )
    local level = GetLevel( varMap, varPlayer )
    local topList_MinLevel = GetTopListInfo_MinLevel( -1 )
    
    local randMax = 0
    for i, item in x430600_NpcTable do
        if  level >= item.minLevel and level <= item.maxLevel then
            randMax = randMax + item.pro
        end
    end
    
    if randMax <= 0 then
        WriteLog( 1, "x430600_AddFindQuest randMax<=0 !" )
        return 0
    end
    
    
    local tableIndex = -1
    local rand = random( 1, randMax )
    local temp = 0
    for i, item in x430600_NpcTable do
        if  level >= item.minLevel and level <= item.maxLevel then
            if rand > temp and rand <= temp + item.pro then
                tableIndex = i
                break
            end
            temp = temp + item.pro
        end
    end
    
    if tableIndex == -1 then
        WriteLog(1,"x430600_AddFindQuest rand table index failed!")
        return 0
    end
    
    local result = AddQuest( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer), x430600_var_ScriptId, 0, 0, 0, 1)
    if result == 0 then
        Msg2Player( varMap, varPlayer, x430600_var_AddQuestErrorTip, 8, 3)
        return 0
    end
    
    local targetvarTalknpc = x430600_NpcTable[tableIndex].varTalknpc[country+1]
    local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_MissionType, x430600_MissionType_Find)
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_MissionGuid, x430600_NpcTable[tableIndex].guid )
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_TargetId, targetvarTalknpc )
 	SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_KillvarMap,-1)
 	SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_AcceptWeek, x430600_GetCurrentWeek() ) 
 	SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 0)
    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y"..x430600_var_MissionName)
        TalkAppendString( varMap, format(x430600_NpcTable[tableIndex].desc, targetvarTalknpc) )
        TalkAppendString( varMap, "#r" )
        TalkAppendString( varMap, "#Y任务目标:" )
        TalkAppendString( varMap, format(x430600_NpcTable[tableIndex].target, targetvarTalknpc) )
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc )
    return 1
    
end

function x430600_AddKillQuest( varMap, varPlayer, varTalknpc ) --给玩家添加一个杀怪任务
    
    local level = GetLevel( varMap, varPlayer )
    local topList_MinLevel = GetTopListInfo_MinLevel( -1 )
    local nextTimes = x430600_GetFinishTimes(varMap, varPlayer) + 1
    local tableRef = nil
    for i, item in x430600_KillTypeProbability do
        if nextTimes >= item.minTimes and nextTimes <= item.maxTimes then
            local randMax = item.normalPro + item.specialPro
            local rand = random( 1, randMax )
            if rand <= item.normalPro then
                tableRef = x430600_MonsterNormal
            else
                tableRef = x430600_MonsterSpecial
            end
        end
    end
    
    
    local randMax = 0
    for i, item in tableRef do
        if  level >= item.minLevel and level <= item.maxLevel then
            randMax = randMax + item.pro
        end
    end    
    
    if randMax <= 0 then
        WriteLog( 1, "x430600_AddKillQuest randMax <= 0 !")
        return 0
    end    
    
    local temp = 0
    local rand = random( 1, randMax )
    local tableIndex = -1
    for i, item in tableRef do
        if   level >= item.minLevel and level <= item.maxLevel then
            if rand > temp and rand <= temp + item.pro then
                tableIndex = i
                break
            end
            
            temp = temp + item.pro
        end
    end 
    
    if tableIndex == -1 then
        WriteLog( 1, "x430600_AddKillQuest tableIndex < 0 Error !" )
        return 0
    end
    
    local result = AddQuest( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer), x430600_var_ScriptId, 1, 0, 0, 0)
    if result == 0 then
        Msg2Player( varMap, varPlayer, x430600_var_AddQuestErrorTip, 8, 3)
        return 0
    end
    
    local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer) )
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_MissionType, x430600_MissionType_Kill)
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_MissionGuid, tableRef[tableIndex].guid )
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_TargetId,    tableRef[tableIndex].monsterId )
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_TargetCount, tableRef[tableIndex].count )
 	SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_KillvarMap,tableRef[tableIndex].scene)
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_AcceptWeek, x430600_GetCurrentWeek() ) 
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 0)
    
    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y"..x430600_var_MissionName)
        if tableRef[tableIndex].scene >= 0 then
        	TalkAppendString( varMap, format( tableRef[tableIndex].desc, tableRef[tableIndex].scene,tableRef[tableIndex].monsterName) )
        else
        	TalkAppendString( varMap, format( tableRef[tableIndex].desc, tableRef[tableIndex].monsterName) )
        end
        TalkAppendString( varMap, "#r" )
        TalkAppendString( varMap, "#Y任务目标:" )
        local strTarget = tableRef[tableIndex].target
        if tableRef[tableIndex].scene >= 0 then
            strTarget = format( strTarget, tableRef[tableIndex].scene, tableRef[tableIndex].monsterName )
        else
            strTarget = format( strTarget, tableRef[tableIndex].monsterName)
        end
        TalkAppendString( varMap, strTarget  )
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc )
    return 1
    
end

--------------------------------------------------------------添加一个收集装备任务
function x430600_AddEquipQuest( varMap, varPlayer, varTalknpc )
    
    local level = GetLevel( varMap, varPlayer )
    local topList_MinLevel = GetTopListInfo_MinLevel( -1 )
        
    local randMax = 0
    for i,item in x430600_Equip do
        if  level >= item.minLevel and level <= item.maxLevel then
            randMax = randMax + item.pro
        end
    end
    
    if randMax <= 0 then
        WriteLog( 1, "x430600_AddEquipQuest randMax<=0" )
        return 0
    end
    
    local tableIndex = -1
    local rand = random( 1, randMax )
    local temp = 0
    for i, item in x430600_Equip do
        if  level >= item.minLevel and level <= item.maxLevel then
            if rand > temp and rand <= temp + item.pro then
               tableIndex = i
               break
            end
            
            temp = temp + item.pro
        end 
    end
    
    if tableIndex == -1 then
        WriteLog( 1, "x430600_AddEquipQuest rand tableIndex failed!" )
        return 0
    end
    
    local result = AddQuest( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer), x430600_var_ScriptId, 0, 0, 1, 0)
    if result == 0 then
        Msg2Player( varMap, varPlayer, x430600_var_AddQuestErrorTip, 8, 3)
        return 0
    end
    
    local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_MissionType, x430600_MissionType_Equip)
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_MissionGuid, x430600_Equip[tableIndex].guid )
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_TargetId, x430600_Equip[tableIndex].itemId )
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_AcceptWeek, x430600_GetCurrentWeek() ) 
    SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 0)
    
    local strEquipPrefix = ""
    if x430600_Equip[tableIndex].color >= 0 then
        strEquipPrefix = x430600_ColorTable[x430600_Equip[tableIndex].color+1]
    end
    if x430600_Equip[tableIndex].quality >= 0 then
        strEquipPrefix = strEquipPrefix..x430600_QualityTable[x430600_Equip[tableIndex].quality+1]
    end
        
    StartTalkTask( varMap)
        --任务继续信息
        TalkAppendString( varMap, "#Y"..x430600_var_MissionName)
        TalkAppendString( varMap, format( x430600_Equip[tableIndex].desc,x430600_Equip[tableIndex].itemId, strEquipPrefix, x430600_Equip[tableIndex].itemId) )
        TalkAppendString( varMap, "#r" )
        TalkAppendString( varMap, "#Y任务目标:" )
        TalkAppendString( varMap, format(x430600_Equip[tableIndex].target,strEquipPrefix, x430600_Equip[tableIndex].itemId) )
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc )
    return 1


end

---------提交任务--------------------------------------------------------------------

function x430600_ProcQuestSubmit( varMap, varPlayer, varTalknpc, RadioId, varQuest) 
    
    if IsHaveQuestNM( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer)) <= 0 then
	    return
	end
	
	local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
    local misType = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionType)
    
    if misType == x430600_MissionType_Equip then --提交装备
        
       local country = GetCurCountry( varMap, varPlayer )
       if( x430600_varTalknpc == nil ) then
            x430600_varTalknpc = {}
       end
       x430600_varTalknpc[country] = varTalknpc
       
       local itemId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId )
       local misGuid = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionGuid)
       local color = x430600_GetMissionInfo( misGuid, "color" )
       local quality = x430600_GetMissionInfo( misGuid, "quality" )
       
       StartGCDTask( varMap)
            GCDAppendInt( varMap, x430600_var_ScriptId)
            GCDAppendInt( varMap, x430600_GetvarQuest(varMap, varPlayer))
            GCDAppendInt( varMap, varTalknpc)
            GCDAppendInt( varMap, itemId)
            GCDAppendInt( varMap, color)
            GCDAppendInt( varMap, quality)
            DeliverGCDInfo( varMap, varPlayer, 111 )
       StopGCDTask( varMap)
       
       StartTalkTask( varMap)
           TalkAppendString( varMap, "#Y"..x430600_var_MissionName)
           TalkAppendString( varMap, x430600_var_EquipCommitTip )
           StopTalkTask( varMap )
       DeliverTalkMenu( varMap, varPlayer, varTalknpc )
        
        
    else
        x430600_DeliverMission( varMap, varPlayer, varTalknpc)
    end
	
    
    
    
end
--------------------------------------------------------------------------
function x430600_DeliverMission( varMap, varPlayer, varTalknpc, EquipColor,EquipQuality ) -----------交任务
	
    local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
    local misType = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionType)
    local misTableIndex = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionGuid)
    local complete = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE )
    
        
    local targetId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId )
    local targetCount = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetCount )
    
    local exp = 0
     
    
    --删除任务道具   
    if misType == x430600_MissionType_Item then     --收集
        
        if GetItemCountInBag( varMap, varPlayer, targetId ) < targetCount then
            Msg2Player( varMap, varPlayer, "物品不足！", 8, 3)
            return
        else
            if DelItem( varMap, varPlayer, targetId, targetCount ) == 0 then
                Msg2Player( varMap, varPlayer, "交付物品失败，可能是该物品处于锁定状态或已遗失", 8, 3)
                return
            end
        end
        
        exp =  x430600_GetExpAward( varMap, varPlayer )
        
    elseif misType == x430600_MissionType_Find then --找人
        
        exp =  x430600_GetExpAward( varMap, varPlayer )
    
    elseif misType == x430600_MissionType_Kill then --杀怪
    
        exp =  x430600_GetExpAward( varMap, varPlayer )
        
    elseif misType == x430600_MissionType_Equip then
        
        local color = x430600_GetMissionInfo(misTableIndex,"color")
        local quality = x430600_GetMissionInfo(misTableIndex,"quality")
        
        exp = x430600_GetExpAwardForEquip( varMap, varPlayer, color,quality,EquipColor,EquipQuality )
        
    end
    
    DelQuest( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer) ) --删除任务
--      --消耗体力
--    local nXiaoHao = 1
--    local nCurPhysicalForce = GetPhysicalForce(varMap, varPlayer)
-- 
--    SetPhysicalForce( varMap, varPlayer, nCurPhysicalForce - nXiaoHao ,x430600_var_ScriptId)
    --任务奖励     
    
    local money = x430600_GetMoneyAward( varMap, varPlayer )
    if( exp > 0) then
        AddExp( varMap, varPlayer, exp)
        Msg2Player(varMap,varPlayer,"#o获得#R经验"..exp.."点#o的奖励",8,3)
    end
    if money > 0 then
        AddMoney( varMap, varPlayer, 1, money )
        local moneystr = ""
        local liang = floor( money / 1000 )
        local wen = mod( money, 1000 )
        if liang > 0 then
            moneystr = liang.."两"
        end
        if wen > 0 then
            moneystr = moneystr..wen.."文"
        end
        Msg2Player(varMap,varPlayer,"#o获得#R银卡"..moneystr.."#o的奖励",8,3)
    end
    
      local times = x430600_AddFinishTimes( varMap, varPlayer )
    
    --随机获得宝箱
    local boxId = -1
    local broadCastMsg = ""
    local country = GetCurCountry( varMap, varPlayer )
    if mod( times, x430600_GetGoodBoxTimesNum ) == 0 then
        --获得一个高级宝箱
        boxId = x430600_GoodBoxId
        broadCastMsg = x430600_var_BoxAwaredBroadCast2
		NpcTalk(varMap, FindMonsterByGUID(varMap,x430600_SubmitvarTalknpc[country+1]), "很好很好，你能坚持不懈的帮助老夫做完这么多事儿，这份毅力值得嘉奖，这点小礼品就拿去吧！这可是从其他总堂抢来的战利品，肯定对你有很大的帮助！", -1)
    else
        
        local rand = random( 1, 100 )
        if rand <= x430600_GetNormalBoxProbability then
            boxId = x430600_itemnormalaward( varMap, varPlayer)
            broadCastMsg = x430600_var_BoxAwaredBroadCast1
      		NpcTalk(varMap, FindMonsterByGUID(varMap,x430600_SubmitvarTalknpc[country+1]), "恩恩，你在兴修马场中表现突出，这点小东西就拿去吧，不过这是一个传说中很危险的东西，你一定要小心！", -1)
        end
    end
    
    if boxId > 0 then
        StartItemTask( varMap )
        AddBindItem( varMap, boxId, 1)
        local result = EndItemAppend( varMap, varPlayer )
        if result > 0 then
            ItemAppendListToPlayer( varMap, varPlayer)
            Msg2Player( varMap, varPlayer, format(x430600_var_BoxAwardTip, boxId), 8, 3)
            
            local msg = format(broadCastMsg,GetName(varMap,varPlayer) );
            
            LuaAllScenceM2Wrold( varMap, msg, 5, 1 )
            
        end
    end
       

    local strInfo = format("您今日已完成了%d次兴修马场任务", times )
    Msg2Player(varMap, varPlayer, strInfo, 8, 2)
  
    --自动接新任务
   local curWeek = x430600_GetCurrentWeek();
    if x430600_GetMaxWeekTimes(varMap, varPlayer) == x430600_GetFinishTimes(varMap, varPlayer) 
       and curWeek == x430600_GetFinishWeek(varMap, varPlayer) then
    else
       x430600_DispatchMissionInfo( varMap, varPlayer, varTalknpc)	
    end
        
    GamePlayScriptLog(varMap, varPlayer, 5001)
    
end

--------------------------------------------------------------------------
function x430600_ProcQuestLogRefresh( varMap, varPlayer, varQuest) -- 任务跟踪更新
    
    x430600_DeleteQuestIfWeekChanged( varMap, varPlayer )
    
    if IsHaveQuest( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer)) ~= 1 then
        return
    end

    local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer) )
    local misType = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionType )
    local misGuid = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionGuid )
    
    if misType == x430600_MissionType_Item  then --收集
        
        local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
        local itemId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId)
        local itemCount = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetCount)
        
        if GetItemCountInBag( varMap, varPlayer, itemId) >= itemCount then
            SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 1)
        else
            SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 0)
        end
        
    elseif misType == x430600_MissionType_Equip then --装备

        local itemId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId )
        local color = x430600_GetMissionInfo(misGuid,"color")
        local quality = x430600_GetMissionInfo(misGuid,"quality")
        local count = GetSpecialEquipCountInBag( varMap, varPlayer, itemId, color, quality )
        if count > 0 then
            SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 1)
        else
            SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 0)
        end          
    end
    
    local strTitle = ""
    local strMissionName = ""
    local strDescription = ""
    local strTarget = ""
    local strTips = x430600_var_SmallTip
    
    local country = GetCurCountry( varMap, varPlayer )
    local complete = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE )
    local gonglve = format( " #W当前任务为第#R%d#W次。", x430600_GetFinishTimes(varMap,varPlayer)+1 )
    strMissionName = format( "%s", x430600_var_MissionName..format("(%d/100)",1+x430600_GetFinishTimes(varMap,varPlayer)))
                                
    
    strDescription = x430600_GetMissionInfo( misGuid, "desc" )
    strTarget = x430600_GetMissionInfo( misGuid, "target" )
   
    --任务目标处理
    if complete == 1 then
       strTarget = format("任务已经完成，请回去向@npc_%d#W汇报！",x430600_SubmitvarTalknpc[country+1])
    else
       if strTarget ~= "" then
           if misType == x430600_MissionType_Kill then --杀怪
                
                local killCount = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_KillCount )
                local needCount = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetCount )
                local monsterName = x430600_GetMissionInfo( misGuid, "monsterName" )
                local validScene = x430600_GetMissionInfo( misGuid, "scene" )
                if monsterName ~= "" and validScene > 0 then
                    strTarget = format( strTarget, validScene, monsterName )
                    strDescription = format( strDescription, validScene, monsterName)
                elseif monsterName ~= "" then
                    strTarget = format( strTarget, monsterName )
                    strDescription = format( strDescription, monsterName)
                end
                strTarget = strTarget..format("(%d/%d)", killCount, needCount )
           
           elseif misType == x430600_MissionType_Find then ----找人
                local varTalknpc = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId )
                if varTalknpc ==102401 then
                	varTalknpc =102186
                	SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_TargetId, varTalknpc)
                end
                strTarget = format( strTarget, varTalknpc)
           elseif misType ==  x430600_MissionType_Item then --物品任务格式化物品名称
           		 local itemId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId )
           		 strTarget = format( strTarget, itemId)
           
           elseif misType ==  x430600_MissionType_Equip then 
                 
                 local color = x430600_GetMissionInfo( misGuid, "color" )
                 local quality = x430600_GetMissionInfo( misGuid, "quality" )
                 local strEquipPrefix = ""
                 if color >= 0 then
                    strEquipPrefix = x430600_ColorTable[color+1]
                 end
                 if quality >= 0 then
                    strEquipPrefix = strEquipPrefix..x430600_QualityTable[quality+1]
                 end
                 local itemId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId )
           		 strTarget = format( strTarget, strEquipPrefix, itemId )
           end
       end
    end
    
    --任务描述处理
    if misType == x430600_MissionType_Find then --找人的任务描述都需要格式化npc名称
        local varTalknpc = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId )
        strDescription = format( strDescription, varTalknpc )
        
    elseif misType ==  x430600_MissionType_Item then --物品任务格式化物品名称
 		 local itemId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId )
 		 strDescription = format( strDescription, itemId,itemId)
 		 
 	elseif misType ==  x430600_MissionType_Kill then --杀怪任务描述
 		local guid = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionGuid )
 		local varMap = x430600_GetMissionInfo(guid,"scene")
 		local monsterName = x430600_GetMissionInfo(guid,"monsterName")
 		if varMap ~= nil and varMap >= 0 then
 			strDescription = format( strDescription, varMap,monsterName)
 		else
 			strDescription = format( strDescription, monsterName)
 		end 
 		
    elseif misType ==  x430600_MissionType_Equip then 
        
        local color = x430600_GetMissionInfo( misGuid, "color" )
        local quality = x430600_GetMissionInfo( misGuid, "quality" )
        local strEquipPrefix = ""
        if color >= 0 then
            strEquipPrefix = x430600_ColorTable[color+1]
        end
        if quality >= 0 then
            strEquipPrefix = strEquipPrefix..x430600_QualityTable[quality+1]
        end
        local itemId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId )
 		strDescription = format( strDescription, itemId,strEquipPrefix, itemId)
 		
    end
    
    StartTalkTask(varMap)
    AddQuestLogCustomText( varMap,
                           "",                      -- 标题  
                           strMissionName,          -- 任务名字
                           strTarget,      -- 任务目标
                           format("@npc_%d",x430600_SubmitvarTalknpc[country+1]),            -- 任务NPC
                           gonglve,                        -- 任务攻略
                           strDescription,            -- 任务描述
                           strTips)                      -- 任务提示
    
    
    local exp = x430600_GetExpAward( varMap, varPlayer )
    local money = x430600_GetMoneyAward( varMap, varPlayer )
    if( exp > 0) then
        AddQuestExpBonus( varMap, exp)
    end
    if( money > 0) then
        AddQuestMoneyBonus1( varMap, money)
    end
    StopTalkTask()
    DeliverTalkRefreshQuest( varMap, varPlayer, varQuest )
end

---------------------------------------------------------------------------------
function x430600_ProcQuestAbandon( varMap, varPlayer, varQuest) --放弃任务

	local bHaveMission	= IsHaveQuestNM( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
	if bHaveMission > 0 then
		DelQuest( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
        StartTalkTask( varMap)
        TalkAppendString( varMap, x430600_var_AbandonMissionTip )
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, x430600_var_AbandonMissionTip, 8, 2)
        
        x430600_SetQuitWeek( varMap, varPlayer )
    end

end


--------单击NPC事件--------------------------------------------------------------------
function x430600_ProcQuestAttach( varMap, varPlayer, varTalknpc, npcGuid, misIndex, varQuest)

	local bHaveMission	= IsHaveQuestNM( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
	if bHaveMission <= 0 then
		return
	end
	
	local misIndex = GetQuestIndexByID(varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
	local isComplete =  GetQuestParam(varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE)
	if isComplete == 1 then
		return
	end
	
	local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer) )
    local misType = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionType )
    if misType ~= x430600_MissionType_Find then
    	return
    end
    
    local targetId =  GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId )
    if GetMonsterGUID(varMap, varTalknpc) ~= targetId then
    	return
    end
       
    TalkAppendButton( varMap, x430600_GetvarQuest(varMap, varPlayer), x430600_var_MissionName, 6, x430600_GetvarQuest(varMap, varPlayer))
end

--------物品改变事件-------------------------------------------------------------------
function x430600_ProcQuestItemChanged( varMap, varPlayer, itemdataId, varQuest)
    
    if IsHaveQuest( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer)) == 0 then
        return
    end

    local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
    local misType = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionType)
    
    if misType == x430600_MissionType_Item then
        local itemId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId )
        local itemCount = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetCount )
        
        if GetItemCountInBag( varMap, varPlayer, itemId ) >= itemCount then
            if GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE) == 0  then
                SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 1)
                Msg2Player( varMap, varPlayer, x430600_var_MissionFinishTip, 8, 3)
                x430600_ProcQuestLogRefresh( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
            end
        else
            if GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE) > 0  then
                SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 0)
                x430600_ProcQuestLogRefresh( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
            end
        end       
        
    elseif misType == x430600_MissionType_Equip then
       
        local guid = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionGuid )
        local itemId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId )
        local color = x430600_GetMissionInfo(guid,"color")
        local quality = x430600_GetMissionInfo(guid,"quality")
        local count = GetSpecialEquipCountInBag( varMap, varPlayer, itemId, color, quality )
        if count > 0 then
            if GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE) == 0  then
                SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 1)
                Msg2Player( varMap, varPlayer, x430600_var_MissionFinishTip, 8, 3)
                x430600_ProcQuestLogRefresh( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
            end 
        else
            if GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE) > 0  then
                SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 0)
                x430600_ProcQuestLogRefresh( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
            end
        end          
   
    end   
    
    
  
end

--------杀怪事件-------------------------------------------------------------------
function x430600_ProcQuestObjectKilled(varMap, varPlayer, objdataId, objId, varQuest)
    
    if IsPlayerStateNormal( varMap, varPlayer) ~= 1 then
        return
    end
    
    --没有任务
    if IsHaveQuest( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer)) <= 0 then
        return
    end
    
    local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
    --任务已完成
    if GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE) == 1 then 
        return
    end
        
    --检测任务类型为杀怪
    local misType = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionType)
    if misType ~= x430600_MissionType_Kill then
        return
    end
    
    --检查怪物种类
    local monsterId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId)
    if  monsterId ~= objdataId then
        return
    end
    
    local misGuid = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionGuid)
    
    --检查地图
    local ValidvarMap = x430600_GetMissionInfo(misGuid,"scene")
    if ValidvarMap ~= nil and ValidvarMap >= 0 then
        if varMap ~= ValidvarMap then
            return
        end
    end
    
    local monsterName = x430600_GetMissionInfo(misGuid,"monsterName")
   
    local monsterCount = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetCount)
    local killCount = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_KillCount)
    
    local teamSize = GetNearTeamCount( varMap, varPlayer)
    if teamSize <= 1 then -- 非组队，单独做任务
        
        if killCount < monsterCount then
            SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_KillCount, killCount + 1)
        else
            return
        end

    	--检测任务是否完成
        killCount = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_KillCount)
    	if killCount >= monsterCount then
    		SetQuestByIndex( varMap, varPlayer, misIndex, x430600_MP_ISCOMPLETE, 1)
            Msg2Player( varMap, varPlayer, x430600_var_MissionFinishTip, 8, 3)
        else
            Msg2Player( varMap, varPlayer, format( "已消灭#G%s#cffcf00(%d/%d)", monsterName, killCount, monsterCount), 8, 3)
    	end

        x430600_ProcQuestLogRefresh( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
    else
        for i = 0, teamSize - 1 do
            local memberId = GetNearTeamMember( varMap, varPlayer, i)
            if memberId >= 0 and IsPlayerStateNormal( varMap, memberId) == 1 then
                if IsHaveQuest( varMap, memberId, x430600_GetvarQuest(varMap, memberId)) > 0 then -- 如果该成员接受了国家内政
                    misIndex = GetQuestIndexByID( varMap, memberId, x430600_GetvarQuest(varMap, memberId))
                    misType = GetQuestParam( varMap, memberId, x430600_MP_MissionType)
                    if misType == x430600_MissionType_Kill and GetQuestParam( varMap, memberId, misIndex, x430600_MP_ISCOMPLETE) == 0 then
                        local _monsterId   = GetQuestParam( varMap, memberId, misIndex, x430600_MP_TargetId)
                        local _monsterCount = GetQuestParam( varMap, memberId, misIndex, x430600_MP_TargetCount)
                        local _killCount = GetQuestParam( varMap, memberId, misIndex, x430600_MP_KillCount)
                        
                        if _killCount < _monsterCount then
                            SetQuestByIndex( varMap, memberId, misIndex, x430600_MP_KillCount, _killCount + 1)
                        end

                        --检测任务是否完成
                        _killCount = GetQuestParam( varMap, memberId, misIndex, x430600_MP_KillCount)
                        if _killCount >= _monsterCount then
                           SetQuestByIndex( varMap, memberId, misIndex, x430600_MP_ISCOMPLETE, 1)
                           Msg2Player( varMap, memberId, x430600_var_MissionFinishTip, 8, 3)
                        else
                           Msg2Player( varMap, memberId, format( "已消灭#G%s#cffcf00(%d/%d)", monsterName, _killCount, _monsterCount), 8, 3)
                        end

                        x430600_ProcQuestLogRefresh( varMap, memberId, x430600_GetvarQuest(varMap, memberId))
                    end
                end
            end
        end
    end
end

-------------------------------------------------------------------
function x430600_GetvarQuest( varMap, varPlayer )
    local country = GetCurCountry( varMap, varPlayer )
    return x430600_var_varQuest[country+1]
end

function x430600_itemnormalaward(varMap, varPlayer)
	local level = GetLevel(varMap, varPlayer)
	local ran = random(1,2)
	local reward = 0

	if level > 39 and level < 60 then
		if ran ==1 then
			reward = 12030970
		elseif ran == 2 then
			reward = 12030974
		end	
	elseif level >59 and level <80 then
		if ran ==1 then
			reward = 12030971
		elseif ran == 2 then
			reward = 12030975
		end	
	end
	return reward
end

function x430600_itemhigh(varMap, varPlayer)
	local level = GetLevel(varMap, varPlayer)
	if level > 39 and level < 50 then
		return 12030252
	elseif level > 49 and level < 60 then
		return 12030253
	elseif level > 59 then
		return 12030254
	end
end


function x430600_OnSelectSubmitItem( varMap, varPlayer, bagPos, itemSerial,itemServer,itemWorld )

    if IsHaveQuest( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer) ) == 0 then
        return
    end
    
    local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
    local misType = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionType)
    
    if misType ~= x430600_MissionType_Equip then
        return
    end
    
    local guid = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_MissionGuid )
    local itemId = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_TargetId )
    local color = x430600_GetMissionInfo(guid,"color")
    local quality = x430600_GetMissionInfo(guid,"quality")

    
    if GetItemProperty( varMap, varPlayer, bagPos, "ItemId" ) ~= itemId then
        Msg2Player( varMap, varPlayer, "这不是我要的东西！", 8, 3 )    
        return
    end
    
    local EquipColor = GetItemProperty( varMap, varPlayer, bagPos, "EquipColor" )
    if  EquipColor < color then
        Msg2Player( varMap, varPlayer, "这不是我要的东西！", 8, 3 )    
        return
    end 
    
    local EquipQuality = GetItemProperty( varMap, varPlayer, bagPos, "EquipQuality" )
    if EquipQuality < quality then
        Msg2Player( varMap, varPlayer, "这不是我要的东西！", 8, 3 )    
        return
    end 
    
    if DelItemByIndexInBag( varMap, varPlayer, bagPos, 1 ) == 1 then
    
         local country = GetCurCountry( varMap, varPlayer )
         x430600_DeliverMission(varMap, varPlayer, x430600_varTalknpc[country],EquipColor,EquipQuality  ) 
    
    else
    
         Msg2Player( varMap, varPlayer, "提交物品失败！", 8, 3 ) 
        
    end
    
    --关闭客户端界面
    StartGCDTask( varMap)
    DeliverGCDInfo( varMap, varPlayer, 112 )
    StopGCDTask( varMap)
   
end


function x430600_DeleteQuestIfWeekChanged( varMap, varPlayer )
	local bDone = x430600_CheckSubmit( varMap, varPlayer, varTalknpc)
	if bDone == 1 then return end
	
    if IsHaveQuest( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer) ) == 0 then
        return
    end
    
    local misIndex = GetQuestIndexByID( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer))
    local acceptWeek = GetQuestParam( varMap, varPlayer, misIndex, x430600_MP_AcceptWeek )
    
    local curWeek = x430600_GetCurrentWeek( varMap, varPlayer )
    if acceptWeek ~= curWeek then
        DelQuest( varMap, varPlayer, x430600_GetvarQuest(varMap, varPlayer) )
    end
end

