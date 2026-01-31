
--DECLARE_QUEST_INFO_START--
x320009_var_ScriptId =  320009
x320009_var_MissionKind 				= 	1                       --任务类型
x320009_var_Mis_Count = 1
x320009_var_BonusMoney8				=	100
x320009_var_GuildExpBonus				=	1
--DECLARE_QUEST_INFO_STOP--

--x320009_var_BangExp 					=	1

--要杀的怪的个数
x320009_var_NeedKilledNum				= 1
x320009_var_GuildLevelMin				= 3 -- 最低帮会等级
x320009_var_PlayerLevelMin			= 96 -- 最低等级
x320009_var_PlayerLevelMax			= 160 -- 最高等级
x320009_var_QuestName					= "【帮会】仙人谷除妖" -- 任务名称

x320009_var_PreMissionId				= { 7004,7011,7012,7013,7014,7015 }

										 
x320009_var_SubMissionId				=	{ 
										  { MissionId=7602, MissionName = "【帮会】仙人谷除妖", MissionTarget = "  打败@npc_44002", MissionInfo = "\t为了支持帮会的建设，我们通常会挑选一些帮内的精兵强将去完成王城大将军所发出的悬赏任务，今天共有六个任务，你会随机得到其中一个。\n\t#G邪灵萨满#W：他本是一位伟大的萨满，却因为深爱的人意外惨死而开始嫉恨所有处在幸福当中的人们，他用自己强大的法术四处破坏，不断残杀，被国师和大将军击败后，逃进了仙人谷，并在那里召唤出了大群的元素生物保护自己。但是他的邪恶和恐惧却并未从这片土地上消失，你的任务就是让他和他邪恶的智慧从这个世界上彻底消失。\n\t此任务每天只能接取一次，放弃任务后只能在次日再次领取。\n\t你准备好接取仙人谷除妖之#G邪灵萨满任务#W吗？#r\t建帮时间低于24小时或入帮时间低于24小时，不能获得帮会经验！",MissionHelp = "\t@npc_44002非常危险，最好本帮成员组队前往除之！随着你所在帮会等级的提高，你获得的奖励也会相应增加。\n\n", SubmitNPCGUID = 138533,	ExpBonus = 0,NPCName = "@npc_138533",Completed ="已经干掉了那个邪灵萨满！？太好了，这是你应得的报酬，请收下。",Missionruse="你可以和帮会内其他成员一起，组队完成任务！建帮时间低于24小时或入帮时间低于24小时，不能获得帮会经验！",objdataId =9723 }, 
										  {	MissionId=7603, MissionName = "【帮会】仙人谷除妖", MissionTarget = "  打败@npc_45001", MissionInfo = "\t为了支持帮会的建设，我们通常会挑选一些帮内的精兵强将去完成王城大将军所发出的悬赏任务，今天共有六个任务，你会随机得到其中一个。\n\t#G嗜血人屠#W：传说他是一个很普通的屠夫，原本一直在王城中做生意，一次地震后，人们意外地发现在他家院内藏有无数骸骨，直到那时人们才发现原来他所贩卖的生猪竟然是用邪术变化的无辜百姓，事情败露后这个嗜血的屠夫逃进了仙人谷，只是每逢月圆的午夜他都会从藏身的仙人谷中走出来作恶。\n\t此任务每天只能接取一次，放弃任务后只能在次日再次领取。\n\t你准备好接取仙人谷除妖之#G嗜血人屠任务#W吗？#r\t建帮时间低于24小时或入帮时间低于24小时，不能获得帮会经验！",MissionHelp = "\t@npc_45001非常危险，最好本帮成员组队前往除之！随着你所在帮会等级的提高，你获得的奖励也会相应增加。\n\n",	SubmitNPCGUID = 138533, ExpBonus = 0,NPCName = "@npc_138533",Completed ="你的胜利归来让我觉得很欣慰，这是你应得的报酬，请收下。",Missionruse="你可以和帮会内其他成员一起，组队完成任务！建帮时间低于24小时或入帮时间低于24小时，不能获得帮会经验！",objdataId =9724 },
										  {	MissionId=7604, MissionName = "【帮会】仙人谷除妖", MissionTarget = "  打败@npc_45002", MissionInfo = "\t为了支持帮会的建设，我们通常会挑选一些帮内的精兵强将去完成王城大将军所发出的悬赏任务，今天共有六个任务，你会随机得到其中一个。\n\t#G走尸人魔#W：走尸人魔原本是王国内的一员勇将，还是大将军苏儿台的师傅，在一次与邪魔的战斗中被邪灵附体，日子一天天过去，邪灵最终腐蚀了他的意志和肉体，他终于成为了一具受邪灵摆布的行尸走肉。被大将军射瞎了一只眼睛后，他也逃进了仙人谷。\n\t此任务每天只能接取一次，放弃任务后只能在次日再次领取。\n\t你准备好接取仙人谷除妖之#G走尸人魔任务#W吗？#r\t建帮时间低于24小时或入帮时间低于24小时，不能获得帮会经验！",MissionHelp = "\t@npc_45002极度危险，最好本帮成员组队前往除之！随着你所在帮会等级的提高，你获得的奖励也会相应增加。\n\n",SubmitNPCGUID = 138533,	ExpBonus = 0,NPCName = "@npc_138533",Completed ="看到你归来的表情，我就知道此行一定相当顺利 ，这是你应得的报酬，请收下。",Missionruse="你可以和帮会内其他成员一起，组队完成任务！建帮时间低于24小时或入帮时间低于24小时，不能获得帮会经验！",objdataId =9725 },
										  { MissionId=7605, MissionName = "【帮会】仙人谷除妖", MissionTarget = "  打败@npc_44006", MissionInfo = "\t为了支持帮会的建设，我们通常会挑选一些帮内的精兵强将去完成王城大将军所发出的悬赏任务，今天共有六个任务，你会随机得到其中一个。\n\t#G五通鬼婆#W：居住在仙人谷中的一个面目憎恶的老太婆，相传她善于变化，经常用些糕点来诱拐百姓家的小孩子，被拐走的孩子都是有去无回，人们憎恨却又拿她没有办法，只得家家闭户。\n\t此任务每天只能接取一次，放弃任务后只能在次日再次领取。\n\t你准备好接取仙人谷除妖之#G五通鬼婆任务#W吗？#r\t建帮时间低于24小时或入帮时间低于24小时，不能获得帮会经验！",MissionHelp = "\t@npc_44006比较危险，最好本帮成员组队前往除之！随着你所在帮会等级的提高，你获得的奖励也会相应增加。\n\n", SubmitNPCGUID = 138533,	ExpBonus = 0,NPCName = "@npc_138533",Completed ="我一直在等着你的好消息，这些是你应得的报酬，请收下吧。",Missionruse="你可以和帮会内其他成员一起，组队完成任务！建帮时间低于24小时或入帮时间低于24小时，不能获得帮会经验！",objdataId =9726 }, 
										  {	MissionId=7606, MissionName = "【帮会】仙人谷除妖", MissionTarget = "  打败@npc_45006", MissionInfo = "\t为了支持帮会的建设，我们通常会挑选一些帮内的精兵强将去完成王城大将军所发出的悬赏任务，今天共有六个任务，你会随机得到其中一个。\n\t#G铁甲尸王#W：不知什么朝代一位忠心的大将军，死后依然没有忘记生前君主的委托，固执地守卫着自己的疆土。他视所有王国的人们为敌人，现在他正在仙人谷召集着自己的军队，随时准备攻打王城，维护他那早已在历史上烟消云散的帝国疆土。\n\t此任务每天只能接取一次，放弃任务后只能在次日再次领取。\n\t你准备好接取仙人谷除妖之#G铁甲尸王任务#W吗？#r\t建帮时间低于24小时或入帮时间低于24小时，不能获得帮会经验！",MissionHelp = "\t@npc_45006异常凶猛，最好本帮成员组队前往除之！随着你所在帮会等级的提高，你获得的奖励也会相应增加。\n\n",	SubmitNPCGUID = 138533, ExpBonus = 0,NPCName = "@npc_138533",Completed ="看来我是杞人忧天了，你的实力证明了一切，这是你应得的报酬，请收下。",Missionruse="你可以和帮会内其他成员一起，组队完成任务！建帮时间低于24小时或入帮时间低于24小时，不能获得帮会经验！",objdataId =9727 },
										  {	MissionId=7607, MissionName = "【帮会】仙人谷除妖", MissionTarget = "  打败@npc_43004", MissionInfo = "\t为了支持帮会的建设，我们通常会挑选一些帮内的精兵强将去完成王城大将军所发出的悬赏任务，今天共有六个任务，你会随机得到其中一个。\n\t#G幽冥死神#W：一个谜一样的恶魔，通常我们都称他为“噩梦”，他出没于黑暗之中，仿佛地府的恶魔，雪亮的镰刀每一次的挥舞都会夺走一条鲜活的生命，侥幸逃生的人都称他为终生的噩梦！\n\t此任务每天只能接取一次，放弃任务后只能在次日再次领取。\n\t你准备好接取仙人谷除妖之#G幽冥死神任务#W吗？#r\t建帮时间低于24小时或入帮时间低于24小时，不能获得帮会经验！",MissionHelp = "\t@npc_43004非常危险，最好本帮成员组队前往除之！随着你所在帮会等级的提高，你获得的奖励也会相应增加。\n\n", SubmitNPCGUID = 138533,	ExpBonus = 0,NPCName = "@npc_138533",Completed ="太好了，这次的任务你完成得非常顺利，这是你应得的报酬，请收下。",Missionruse="你可以和帮会内其他成员一起，组队完成任务！建帮时间低于24小时或入帮时间低于24小时，不能获得帮会经验！",objdataId =9728 },
										}
										
-- 任务子ID，不同国家不同
x320009_var_QuestCountryInfo = {

-- 楼兰
		{countryid=0, s={ 
										  {varIndex=1, MissionId=8508, SubmitNPCGUID = 123723, NPCName = "@npc_123723"}, 
										  {varIndex=2, MissionId=8509, SubmitNPCGUID = 123723, NPCName = "@npc_123723"},
										  {varIndex=3, MissionId=8510, SubmitNPCGUID = 123723, NPCName = "@npc_123723"},
										  {varIndex=4, MissionId=8511, SubmitNPCGUID = 123723, NPCName = "@npc_123723"}, 
										  {varIndex=5, MissionId=8512, SubmitNPCGUID = 123723, NPCName = "@npc_123723"},
										  {varIndex=6, MissionId=8513, SubmitNPCGUID = 123723, NPCName = "@npc_123723"}
										}} ,                                                                                           

--天山
		{countryid=1, s={ 
										  {varIndex=1, MissionId=8514, SubmitNPCGUID = 126020, NPCName = "@npc_126020"}, 
										  {varIndex=2, MissionId=8515, SubmitNPCGUID = 126020, NPCName = "@npc_126020"},
										  {varIndex=3, MissionId=8516, SubmitNPCGUID = 126020, NPCName = "@npc_126020"},
										  {varIndex=4, MissionId=8517, SubmitNPCGUID = 126020, NPCName = "@npc_126020"}, 
										  {varIndex=5, MissionId=8518, SubmitNPCGUID = 126020, NPCName = "@npc_126020"},
										  {varIndex=6, MissionId=8519, SubmitNPCGUID = 126020, NPCName = "@npc_126020"}
										}}  ,  
										
--昆仑	
		{countryid=2, s={ 
										  {varIndex=1, MissionId=8520, SubmitNPCGUID = 129020, NPCName = "@npc_129020"}, 
										  {varIndex=2, MissionId=8521, SubmitNPCGUID = 129020, NPCName = "@npc_129020"},
										  {varIndex=3, MissionId=8522, SubmitNPCGUID = 129020, NPCName = "@npc_129020"},
										  {varIndex=4, MissionId=8523, SubmitNPCGUID = 129020, NPCName = "@npc_129020"}, 
										  {varIndex=5, MissionId=8524, SubmitNPCGUID = 129020, NPCName = "@npc_129020"},
										  {varIndex=6, MissionId=8525, SubmitNPCGUID = 129020, NPCName = "@npc_129020"}
										}}  ,  
--敦煌									
		{countryid=3, s={ 
										  {varIndex=1, MissionId=8526, SubmitNPCGUID = 132020, NPCName = "@npc_132020"}, 
										  {varIndex=2, MissionId=8527, SubmitNPCGUID = 132020, NPCName = "@npc_132020"},
										  {varIndex=3, MissionId=8528, SubmitNPCGUID = 132020, NPCName = "@npc_132020"},
										  {varIndex=4, MissionId=8529, SubmitNPCGUID = 132020, NPCName = "@npc_132020"}, 
										  {varIndex=5, MissionId=8530, SubmitNPCGUID = 132020, NPCName = "@npc_132020"},
										  {varIndex=6, MissionId=8531, SubmitNPCGUID = 132020, NPCName = "@npc_132020"}
										}}
										}

---------------------------------------------------------------------------------------------------
-- 根据国家ID取得子任务ID列表
---------------------------------------------------------------------------------------------------
function x320009_GetSubQuestList( varCountry )
	for i, itm in x320009_var_QuestCountryInfo do
		if varCountry == itm.countryid then
			return itm.s
		end
	end
	return nil
end

function x320009_IsHavePreMission(sceneId, selfId)
	for i,itm in x320009_var_PreMissionId do
		if IsHaveQuestNM( sceneId, selfId, itm ) > 0 then	-- 如果有这个任务
			return 1
		end
	end
	return -1
end

function x320009_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	--if x320009_IsHavePreMission(varMap, varPlayer) > 0 then
	--	return 0
	--end
	
	--不在帮会中
	if GetGuildID( varMap, varPlayer ) == -1 then
		return
	end
	
	-- 帮会等级是否3级
	local varGuildLevel = GetGuildSimpleData(GetGuildID( varMap, varPlayer ))
	if varGuildLevel < x320009_var_GuildLevelMin then
		return
	end
	
	-- 是否已接取该任务
	local nCountry = GetCurCountry( varMap, varPlayer )
	local varSubMission = x320009_GetSubQuestList( nCountry )
	if varSubMission == nil then
		return
	end
	for i,itm in varSubMission do
		if IsHaveQuestNM( varMap, varPlayer, itm.MissionId ) > 0 then	-- 如果有这个任务
			return 0
		end
	end
	
	local Level = GetLevel(varMap, varPlayer)
	if Level >= x320009_var_PlayerLevelMin and Level <= x320009_var_PlayerLevelMax then	-- 如果可以接这个任务
		TalkAppendButton( varMap, x320009_var_ScriptId, x320009_var_QuestName, 8, -1)
		return 1
	end
	
end


--选中任务
function x320009_ProcEventEntry( sceneId, selfId, targetId, MissionId )
--	if GetTopListInfo_MinLevel( GetWorldID( sceneId, selfId) ) < 70 then
--			Msg2Player(sceneId,selfId,"排行榜最后一名玩家等级未到70级，不能接取此任务",8,3)
  --    return 
  --end

	local index = 1
	local IsHaveQuest = 0
	
	local nCountry = GetCurCountry( sceneId, selfId )
	local varSubMission = x320009_GetSubQuestList( nCountry )
	if varSubMission == nil then
		return
	end
	for i,itm in varSubMission do
		if IsHaveQuestNM( sceneId, selfId, itm.MissionId ) > 0 then	-- 如果有这个任务
	
			IsHaveQuest = 1
			MissionId = itm.MissionId
			index = i
			break
		end
	end

	if(IsHaveQuest > 0) then -- 已接取任务
		
		local bDone = x320009_CheckSubmit(sceneId, selfId, MissionId);
		if(bDone > 0) then
			x320009_DispatchCompletedInfo( sceneId, selfId, targetId, index) --完成任务显示
		else
			x320009_DispatchContinueInfo( sceneId, selfId, targetId, index ) --未完成任务显示
		end
		
	else
	
		local day =  mod(GetDayTime(),1000) + GetGuildID( sceneId, selfId )

		if day < 0 then
			day = 0
		end

		index =  mod(day,6)
		index = index + 1

		x320009_DispatchMissionInfo( sceneId, selfId, targetId, index)	--任务信息显示
	end

end

---------------------------------------------------------------------------------------------------
--检查任务是否可提交
---------------------------------------------------------------------------------------------------
function x320009_CheckSubmit(sceneId, selfId, MissionId)

	local misIndex = GetQuestIndexByID(sceneId, selfId, MissionId);
	return GetQuestParam(sceneId, selfId, misIndex, 7);

end


---------------------------------------------------------------------------------------------------
--向客户端发送任务完成信息
---------------------------------------------------------------------------------------------------
function x320009_DispatchCompletedInfo( sceneId, selfId, targetId, index )
	
	local nCountry = GetCurCountry( sceneId, selfId )
	local varSubMission = x320009_GetSubQuestList( nCountry )
	if varSubMission == nil then
		return
	end
		
	StartTalkTask(sceneId)

		--任务完成信息
		TalkAppendString(sceneId,"#Y"..x320009_var_SubMissionId[index].MissionName)
		TalkAppendString(sceneId,x320009_var_SubMissionId[index].Completed)
		TalkAppendString(sceneId," ")

		--1、经验
		local level = GetLevel(sceneId, selfId)
		--local gongdezhi =GetMeritInfo_Multiple(sceneId, selfId)
		local ExpBonus = ceil ( (100 * 3 * level * 15*1*1 ) )
		ExpBonus =floor(ExpBonus+0.5)
		if ExpBonus> 0 then
			AddQuestExpBonus(sceneId, ExpBonus )
		end
		--2 帮供
		if x320009_var_BonusMoney8>0 then
			AddQuestMoneyBonus8(sceneId,x320009_var_BonusMoney8)
		end
		--3 帮会经验
		if x320009_var_GuildExpBonus>0 then
			AddQuestGuildExpBonus(sceneId,x320009_var_GuildExpBonus)
		end
		AddQuestItemBonus(sceneId, 12250015, 1)
		StopTalkTask(sceneId)
		
		DeliverTalkContinueNM(sceneId, selfId, targetId, x320009_var_ScriptId, varSubMission[index].MissionId);

end



---------------------------------------------------------------------------------------------------
--向客户端发送任务未完成
---------------------------------------------------------------------------------------------------
function x320009_DispatchContinueInfo( sceneId, selfId, targetId,index )
	
	local nCountry = GetCurCountry( sceneId, selfId )
	local varSubMission = x320009_GetSubQuestList( nCountry )
	if varSubMission == nil then
		return
	end
	
	StartTalkTask(sceneId)

		--任务继续信息
		TalkAppendString(sceneId,"#Y"..x320009_var_SubMissionId[index].MissionName)
		TalkAppendString(sceneId,format("%s", x320009_var_SubMissionId[index].MissionInfo))
		TalkAppendString(sceneId," ")

		--任务目标
		TalkAppendString( sceneId,"#Y完成情况：")
		TalkAppendString(sceneId, "未完成");

		--1、经验
		local level = GetLevel(sceneId, selfId)
		--local gongdezhi =GetMeritInfo_Multiple(sceneId, selfId)
		local ExpBonus = ceil ( (100 * 3 * level * 15*1*1 ) )
		ExpBonus =floor(ExpBonus+0.5)
		if ExpBonus> 0 then
			AddQuestExpBonus(sceneId, ExpBonus )
		end
		
		--2 经验
		if x320009_var_BonusMoney8>0 then
			AddQuestMoneyBonus8(sceneId,x320009_var_BonusMoney8)
		end
		--3 帮会经验
		if x320009_var_GuildExpBonus>0 then
			AddQuestGuildExpBonus(sceneId,x320009_var_GuildExpBonus)
		end
			AddQuestItemBonus(sceneId, 12250015, 1)
		
	--任务提示信息
	StopTalkTask()
	DeliverTalkRequire(sceneId, selfId, targetId, x320009_var_ScriptId, varSubMission[index].MissionId,0);

end


---------------------------------------------------------------------------------------------------
--向客户端发送任务信息
---------------------------------------------------------------------------------------------------
function x320009_DispatchMissionInfo( sceneId, selfId, NPCId,index )

	local nCountry = GetCurCountry( sceneId, selfId )
	local varSubMission = x320009_GetSubQuestList( nCountry )
	if varSubMission == nil then
		return
	end
	
	StartTalkTask(sceneId)

		--任务信息
		local BangExp =x320009_var_BangExp
		TalkAppendString(sceneId,"#Y"..x320009_var_SubMissionId[index].MissionName)
		TalkAppendString(sceneId,format("%s", x320009_var_SubMissionId[index].MissionInfo))
		TalkAppendString(sceneId," ")

		--任务目标
		TalkAppendString( sceneId,"#Y任务目标：")
		TalkAppendString( sceneId,format("%s", x320009_var_SubMissionId[index].MissionTarget))
		TalkAppendString( sceneId," ")

		--提示信息
		if x320009_var_SubMissionId[index].MissionHelp ~= "" then

			TalkAppendString(sceneId,"#Y任务提示：")
			TalkAppendString(sceneId,format("%s", x320009_var_SubMissionId[index].MissionHelp))
			TalkAppendString(sceneId," ")
		end

		--任务奖励信息

		--1、经验
		local level = GetLevel(sceneId, selfId)
		--local gongdezhi =GetMeritInfo_Multiple(sceneId, selfId)
		local ExpBonus = ceil ( (100 * 3 * level * 15*1*1 ) )
		ExpBonus =floor(ExpBonus+0.5)
		if ExpBonus > 0 then
			AddQuestExpBonus(sceneId, ExpBonus )
		end
		
		--2 帮供
		if x320009_var_BonusMoney8>0 then
			AddQuestMoneyBonus8(sceneId,x320009_var_BonusMoney8)
		end
		--3 帮会经验
		if x320009_var_GuildExpBonus>0 then
			AddQuestGuildExpBonus(sceneId,x320009_var_GuildExpBonus)
		end
			AddQuestItemBonus(sceneId, 12250015, 1)
		StopTalkTask(sceneId)
		DeliverTalkInfoNM(sceneId, selfId, NPCId, x320009_var_ScriptId, varSubMission[index].MissionId);
		
end


---------------------------------------------------------------------------------------------------
--获得奖励
---------------------------------------------------------------------------------------------------
function x320009_OnReturn1(sceneId, selfId,MissionData,MissionId,targetId)
	local curTime = GetCurrentTime()
	local isMultiple = 0
	if curTime - MissionData < 2*60*60 then
		isMultiple = 1
	end
	local joinguildtime = MissionId
	x320009_GetBonus( sceneId,selfId, isMultiple, joinguildtime )
end

function x320009_GetBonus( sceneId, selfId,isMultiple,joinguildtime)	--奖励经验
	
	local level = GetLevel(sceneId, selfId)
	--local gongdezhi =GetMeritInfo_Multiple(sceneId, selfId)
	local ExpBonus = ceil ( (100 * 3 * level * 15*1*1 ) )
	ExpBonus =floor(ExpBonus+0.5)
	local GuildLevel = GetGuildSimpleData(GetGuildID( sceneId, selfId ))--得到帮会简单数据(等级) 
    if ExpBonus > 0 then
        local text1 = "你完成了任务：【帮会】仙人谷除妖"
    	local text2 = "获得#R经验"..ExpBonus.."点#o的奖励"
		--local text3 = "获得#R帮会功德1点#o的奖励"
    	--AddGuildMerit(sceneId, selfId,1)

    	AddExp(sceneId, selfId, ExpBonus);
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, text1);
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)	
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, text2);
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
		-- StartTalkTask(sceneId)
		-- TalkAppendString(sceneId, text3);
		-- StopTalkTask(sceneId)
		-- DeliverTalkTips(sceneId,selfId)
  		Msg2Player(sceneId,selfId,text1,8,2)
  		Msg2Player(sceneId,selfId,text2,8,2) 
		--Msg2Player(sceneId,selfId,text3,8,2)  
		if isMultiple == 1 then
			local ExpBonus1 = ceil (100 * 3 * level * 15*1*1 *3)
			local Exp3 = ceil (100 * 3 * level * 15*1*1*3 )
			local ExpBonus2 = ceil (100 * 3 * level * 15*1*1 *2)
			local pos = GetGuildOfficial(sceneId, selfId)
			local text3 = "获得#R使命点2点#o的奖励"
				AddGuildShiMing(sceneId, selfId,2)
				StartTalkTask(sceneId)
				TalkAppendString(sceneId, text3);
				StopTalkTask(sceneId)
				DeliverTalkTips(sceneId,selfId)	
				Msg2Player(sceneId,selfId,text3,8,2)
			if pos == 5 then
				local guildid =GetGuildID(sceneId, selfId)
				if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
					StartTalkTask(sceneId)
					TalkAppendString(sceneId, "帮主职位只能领取一次除妖令奖励");
					StopTalkTask(sceneId)
					DeliverTalkTips(sceneId,selfId)
					Msg2Player(sceneId,selfId,"帮主职位只能领取一次除妖令奖励",8,2)
				else
					AddExp(sceneId, selfId, ExpBonus1);	
					StartTalkTask(sceneId)
					TalkAppendString(sceneId, "额外获得#R经验"..Exp3.."点#o的奖励");
					StopTalkTask(sceneId)
					DeliverTalkTips(sceneId,selfId)	
					Msg2Player(sceneId,selfId,"帮会多倍任务额外获得#R经验"..Exp3.."点#o的奖励",8,2)
					SetGuildQuestData(sceneId,GetGuildID(sceneId,selfId),GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
				end
			elseif pos == 4 then
				local guildid =GetGuildID(sceneId, selfId)
				if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
					StartTalkTask(sceneId)
					TalkAppendString(sceneId, "副帮主职位只能领取一次除妖令奖励");
					StopTalkTask(sceneId)
					DeliverTalkTips(sceneId,selfId)
					Msg2Player(sceneId,selfId,"副帮主职位只能领取一次除妖令奖励",8,2)
				else
					AddExp(sceneId, selfId, ExpBonus2);	
					StartTalkTask(sceneId)
					TalkAppendString(sceneId, "额外获得#R经验"..ExpBonus2.."点#o的奖励");
					StopTalkTask(sceneId)
					DeliverTalkTips(sceneId,selfId)	
					Msg2Player(sceneId,selfId,"帮会多倍任务额外获得#R经验"..ExpBonus2.."点#o的奖励",8,2)
					SetGuildQuestData(sceneId,GetGuildID(sceneId,selfId),GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
				end
			else
				AddExp(sceneId, selfId, ExpBonus);	
				StartTalkTask(sceneId)
				TalkAppendString(sceneId, "额外获得#R经验"..ExpBonus.."点#o的奖励");
				StopTalkTask(sceneId)
				DeliverTalkTips(sceneId,selfId)	
				Msg2Player(sceneId,selfId,"帮会多倍任务额外获得#R经验"..ExpBonus.."点#o的奖励",8,2)
			end
		end
		if 	GuildLevel == 2 then
			local level = GetLevel(sceneId, selfId)
			local exp = ceil (100 * 3 * level * 15*0.25*1 )
			AddExp(sceneId, selfId, exp);
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "额外获得#R经验"..exp.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			Msg2Player(sceneId,selfId,"帮会等级2级额外获得#R经验"..exp.."点#o的奖励",8,2)
		end
		if 	GuildLevel == 3 then
			local level = GetLevel(sceneId, selfId)
			local exp = ceil (100 * 3 * level * 15*0.5*1 )
			AddExp(sceneId, selfId, exp);	
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "额外获得#R经验"..exp.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			Msg2Player(sceneId,selfId,"帮会等级3级额外获得#R经验"..exp.."点#o的奖励",8,2)
		end
		if 	GuildLevel == 4 then
			local level = GetLevel(sceneId, selfId)
			local exp = ceil (100 * 3 * level * 15*0.75*1 )
			AddExp(sceneId, selfId, exp);	
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "额外获得#R经验"..exp.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			Msg2Player(sceneId,selfId,"帮会等级4级额外获得#R经验"..exp.."点#o的奖励",8,2)
		end
		if 	GuildLevel == 5 then
			local level = GetLevel(sceneId, selfId)
			local exp = ceil (100 * 3 * level * 15*1*1 )
			AddExp(sceneId, selfId, exp);	
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "额外获得#R经验"..exp.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			Msg2Player(sceneId,selfId,"帮会等级5级额外获得#R经验"..exp.."点#o的奖励",8,2)
		end
		if 	GuildLevel == 6 then
			local level = GetLevel(sceneId, selfId)
			local exp = ceil (100 * 3 * level * 20*1.25*1 )
			AddExp(sceneId, selfId, exp);	
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "额外获得#R经验"..exp.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			Msg2Player(sceneId,selfId,"帮会等级6级额外获得#R经验"..exp.."点#o的奖励",8,2)
		end
		if 	GuildLevel == 7 then
			local level = GetLevel(sceneId, selfId)
			local exp = ceil (100 * 3 * level * 20*1.5*1 )
			AddExp(sceneId, selfId, exp);	
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "额外获得#R经验"..exp.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			Msg2Player(sceneId,selfId,"帮会等级7级额外获得#R经验"..exp.."点#o的奖励",8,2)
		end
	end
--奖励帮贡
    if x320009_var_BonusMoney8 > 0 then
		AddGuildUserPoint(sceneId,selfId,x320009_var_BonusMoney8)	--增加帮贡
		local BonusMoney8 = x320009_var_BonusMoney8
		local pointText = "获得#R帮贡"..BonusMoney8.."点#o的奖励"
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, pointText);
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)			
  		Msg2Player(sceneId,selfId,pointText,8,2)
		if isMultiple == 1 then
			local pos = GetGuildOfficial(sceneId, selfId)
			if pos == 5 then
				local guildid =GetGuildID(sceneId, selfId)
				if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
					StartTalkTask(sceneId)
					TalkAppendString(sceneId, "帮主职位只能领取一次除妖令奖励");
					StopTalkTask(sceneId)
					DeliverTalkTips(sceneId,selfId)
					Msg2Player(sceneId,selfId,"帮主职位只能领取一次除妖令奖励",8,2)
				else
					AddGuildUserPoint(sceneId,selfId,300)	--增加帮贡
					StartTalkTask(sceneId)
					TalkAppendString(sceneId, "额外获得#R帮贡300点#o的奖励");
					StopTalkTask(sceneId)
					DeliverTalkTips(sceneId,selfId)	
					Msg2Player(sceneId,selfId,"帮会多倍任务额外获得#R帮贡300点#o的奖励",8,2)
					SetGuildQuestData(sceneId,GetGuildID(sceneId,selfId),GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
				end
			elseif pos == 4 then
				local guildid =GetGuildID(sceneId, selfId)
				if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
					StartTalkTask(sceneId)
					TalkAppendString(sceneId, "副帮主职位只能领取一次除妖令奖励");
					StopTalkTask(sceneId)
					DeliverTalkTips(sceneId,selfId)
					Msg2Player(sceneId,selfId,"副帮主职位只能领取一次除妖令奖励",8,2)
				else
					AddGuildUserPoint(sceneId,selfId,200)	--增加帮贡
					StartTalkTask(sceneId)
					TalkAppendString(sceneId, "额外获得#R帮贡200点#o的奖励");
					StopTalkTask(sceneId)
					DeliverTalkTips(sceneId,selfId)	
					Msg2Player(sceneId,selfId,"帮会多倍任务额外获得#R帮贡200点#o的奖励",8,2)
					SetGuildQuestData(sceneId,GetGuildID(sceneId,selfId),GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
				end
			else
				AddGuildUserPoint(sceneId,selfId,100)	--增加帮贡
				StartTalkTask(sceneId)
				TalkAppendString(sceneId, "额外获得#R帮贡100点#o的奖励");
				StopTalkTask(sceneId)
				DeliverTalkTips(sceneId,selfId)	
				Msg2Player(sceneId,selfId,"帮会多倍任务额外获得#R帮贡100点#o的奖励",8,2)
			end
		end
	end
-- 奖励帮会经验
	local bangExp = x320009_var_GuildExpBonus 
	if bangExp > 0 then
		if joinguildtime == -1 or GetCurrentTime()-joinguildtime<24*3600 then
			StartTalkTask(sceneId)
			TalkAppendString( sceneId, "很抱歉，您加入帮会时间低于24小时，不能获得帮会经验。" )
			StopTalkTask( sceneId )
			DeliverTalkTips( sceneId, selfId )
			Msg2Player(sceneId,selfId,"很抱歉，您加入帮会时间低于24小时，不能获得帮会经验。",8,2)
			return
		end
		--local gongde = GetGuildMerit(sceneId, selfId)
		--if 	gongde >= 5 then
			AddGuildExp(sceneId,selfId,bangExp)
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "获得#R帮会经验"..bangExp.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)			
			Msg2Player(sceneId,selfId,format("获得#R帮会经验"..bangExp.."点#o的奖励"),8,2)
		-- else
			-- StartTalkTask(sceneId)
			-- TalkAppendString( sceneId, "很抱歉，帮会功德低于5点，不能获得帮会经验。" )
			-- StopTalkTask( sceneId )
			-- DeliverTalkTips( sceneId, selfId )
			-- Msg2Player(sceneId,selfId,"很抱歉，帮会功德低于5点，不能获得帮会经验。",8,2)
		-- end
	end
		
end



--**********************************
--接受
--**********************************
function x320009_ProcQuestAccept( sceneId, selfId, targetId, MissionId )
	if IsQuestFullNM( sceneId, selfId )==1 then
		StartTalkTask(sceneId)
		TalkAppendString(sceneId,"可接任务数量已满")
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
		return 
	end

	if GetGuildID( sceneId, selfId ) == -1 then
		--不在帮会中
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, "你不是帮会成员，请先加入帮会再来领取！");
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)	
		Msg2Player(sceneId,selfId,"你不是帮会成员，请先加入帮会再来领取！",8,2)
		return
	end
	
	local guildid = GetGuildID( sceneId, selfId )
	local GuildLevel = GetGuildSimpleData(guildid)--得到帮会简单数据(等级)
	if 	GuildLevel < 1 then
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, "很抱歉，帮会等级到达3级才可以接取仙人谷除妖任务！");
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)	
		Msg2Player(sceneId,selfId,"很抱歉，帮会等级到达3级才可以接取仙人谷除妖任务！",8,2)
	return 
	end
	
	if x320009_GetDayCount(sceneId, selfId) >= x320009_var_Mis_Count then
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, "你今天已经领取过仙人谷除妖或粮仓除妖任务了，请明天再来吧！");
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
		local Readme = "你今天已经领取过仙人谷除妖或粮仓除妖任务了，请明天再来吧！"
		Msg2Player(sceneId,selfId,Readme,8,2)
		return
	end


	--检查前置任务
	local FrontMissiontId1, FrontMissiontId2, FrontMissiontId3 = GetFrontQuestIdNM( sceneId, selfId, MissionId )
	if FrontMissiontId1 ~= -1 then
		if IsQuestHaveDoneNM( sceneId, selfId, FrontMissiontId1 ) == 0 then
			return 
		end
	end
	if FrontMissiontId2 ~= -1 then
		if IsQuestHaveDoneNM( sceneId, selfId, FrontMissiontId2 ) == 0 then
			return 
		end
	end
	if FrontMissiontId3 ~= -1 then
		if IsQuestHaveDoneNM( sceneId, selfId, FrontMissiontId3 ) == 0 then
			return
		end
	end
	
	if AddQuestNM( sceneId, selfId,MissionId) == 1 then
 
		StartTalkTask(sceneId)
		--接任务写日志
		GamePlayScriptLog(sceneId,selfId,111)

 		TalkAppendString(sceneId, "你接受了任务：【帮会】仙人谷除妖")
 		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
		local Readme = "你接受了任务：【帮会】仙人谷除妖"
		Msg2Player(sceneId,selfId,Readme,8,2)	

		local misIndex = GetQuestIndexByID( sceneId, selfId, MissionId )
		SetQuestByIndex(sceneId, selfId, misIndex, 7, 0);
		SetQuestByIndex(sceneId, selfId, misIndex, 0, 0);
	end
	
end


--完成任务
--返回1代表成功，0代表交任务失败
function x320009_ProcQuestSubmit( sceneId, selfId, targetId, selectId, MissionId )

	if IsHaveQuestNM( sceneId, selfId, MissionId) == 0 then	-- 如果没这个任务直接退出
		return 0
	end

	-- 粉丝先锋团
	local ret = LuaCallNoclosure( 302510, "CheckMission", sceneId, selfId, 320009)
	if ret == 0 then
		return 0
	elseif ret == 2 then
		LuaCallNoclosure( 302510, "FinishMission", sceneId, selfId, 320009)
	end
	StartItemTask( sceneId )
	ItemAppend( sceneId, 12250015, 1 )
	local varRet = StopItemTask( sceneId, selfId )
	if varRet > 0 then
		DeliverItemListSendToPlayer(sceneId,selfId)
	else
		local varText = "背包已满,不能获得奖励物品"
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, varText);
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
		return
	end
	if DelQuestNM( sceneId, selfId, MissionId) < 1 then
		return 
	end
	LuaCallNoclosure(802005,"AddActivityQuest",sceneId, selfId, 0,3)
	LuaCallNoclosure(888895,"EventActivity",sceneId, selfId,3)
	--交任务写日志
	GamePlayScriptLog(sceneId,selfId,112)

	x320009_SetDayCount(sceneId, selfId)

	StartTalkTask(sceneId)
	TalkAppendString(sceneId, "");
	StopTalkTask(sceneId)
	DeliverTalkTips(sceneId,selfId)
	--GetGuildQuestData(sceneId, selfId, GD_GUILD_INDEX_MULTI_MISSION_CHUYAO, x320009_var_ScriptId,MissionId,"OnReturn1",targetId)
	GetJoinGuildTime(sceneId,selfId,x320009_var_ScriptId)
	return 0
end

function x320009_OnMemberJoinTimeReturn( sceneId, selfId, param )

	GetGuildQuestData(sceneId, selfId, GD_GUILD_INDEX_MULTI_MISSION_CHUYAO, x320009_var_ScriptId,param,"OnReturn1",-1)

end

function x320009_ProcQuestAttach( sceneId, selfId, npcId, npcGuid, misIndex, MissionId )

	local nCountry = GetCurCountry( sceneId, selfId )
	local varSubMission = x320009_GetSubQuestList( nCountry )
	if varSubMission == nil then
		return
	end
	
	for i,itm in varSubMission do
		local bHaveMission = IsHaveQuestNM(sceneId, selfId, itm.MissionId );

		if bHaveMission > 0 then
			if npcGuid == itm.SubmitNPCGUID then
				local MemberMisIndex = GetQuestIndexByID( sceneId, selfId, itm.MissionId )
				local MemberKilledNum = GetQuestParam( sceneId, selfId, MemberMisIndex, 0 )
				if MemberKilledNum < x320009_var_NeedKilledNum then
					local state = GetQuestStateNM(sceneId, selfId, npcId, itm.MissionId)
					TalkAppendButton(sceneId, itm.MissionId, x320009_var_SubMissionId[itm.varIndex].MissionName, 6, state);
				else
					local state = GetQuestStateNM(sceneId, selfId, npcId, itm.MissionId)
					TalkAppendButton(sceneId, itm.MissionId, x320009_var_SubMissionId[itm.varIndex].MissionName, 7, state);
				end
			end
		end
	end
end




--********************************************************************
--放弃
--********************************************************************
function x320009_ProcQuestAbandon( sceneId, selfId,MissionId )

	if IsHaveQuestNM( sceneId, selfId, MissionId) == 0 then	-- 如果没有这个任务
		return
	end

	DelQuestNM( sceneId, selfId, MissionId)
	local Readme = "你放弃了任务：【帮会】仙人谷除妖"
	StartTalkTask(sceneId)
	TalkAppendString(sceneId, Readme);
    StopTalkTask(sceneId)
	DeliverTalkTips(sceneId,selfId)
	Msg2Player(sceneId,selfId,Readme,8,2)
	x320009_SetDayCount(sceneId, selfId)
end


function x320009_OnReturn(sceneId, selfId,MissionData,MissionId,targetId)

	local CurDaytime = GetDayTime()						--当前时间(天)

 		                                                  --可以做任务
 		StartTalkTask(sceneId)
 		TalkAppendString(sceneId, "接受仙人谷除妖任务完成，快去做吧！")
 		StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)
			local Readme = "接受仙人谷除妖任务完成，快去做吧！"
			Msg2Player(sceneId,selfId,Readme,8,2)
		AddQuestNM( sceneId, selfId,MissionId)
	--else
	    --StartTalkTask(sceneId)
		--TalkAppendString(sceneId, "帮会今天还没有发布该任务！")
		--StopTalkTask(sceneId)
		--	DeliverTalkTips(sceneId,selfId)
			--local Readme = "帮会今天还没有发布该任务！"
			--Msg2Player(sceneId,selfId,Readme,8,2)
		--DeliverTalkTips(sceneId,selfId)
	--end

  --  DeliverTalkMenu(sceneId, selfId, -1)
end


--********************************************************************
--接受
--********************************************************************
function x320009_ProcAccept( sceneId, selfId )
end

function x320009_ProcDie( sceneId,objId,killerId )

	if killerId == -1 then
		--出错了
		return 
	end

	if IsObjValid(sceneId,killerId)  == 0 then
		--无效OBJ
		return
	end

	local ObjType = GetObjType(sceneId,killerId)

	if ObjType == 3 then		-- 被PET杀死
		ObjType = 1
		killerId = GetOwnerID(sceneId, killerId)
	end

	if ObjType ~= 1 then
		return
	end

	if IsPlayerStateNormal( sceneId,killerId ) ~= 1 then
		return
	end
	
	local nCountry = GetCurCountry( sceneId, killerId )
	local varSubMission = x320009_GetSubQuestList( nCountry )
	if varSubMission == nil then
		return
	end

	local MissionId = -1
	local objdataId = -1
	
 	for it,itm in varSubMission do
		if IsHaveQuestNM( sceneId, killerId, itm.MissionId ) > 0 then	-- 如果有这个任务
			MissionId = itm.MissionId
			objdataId = x320009_var_SubMissionId[itm.varIndex].objdataId
			break
		end
	end

	local strText = "";
	if MissionId ~= -1 and objdataId == GetMonsterDataID(sceneId,objId) then

		--先算自己的任务数据qq
		local misIndex = GetQuestIndexByID( sceneId, killerId, MissionId )
		local KilledNum = GetQuestParam( sceneId, killerId, misIndex, 0 )

		if KilledNum < x320009_var_NeedKilledNum then	
			SetQuestByIndex( sceneId, killerId, misIndex, 0, KilledNum+1 )
			x320009_QuestLogRefresh( sceneId, killerId, MissionId)

			StartTalkTask(sceneId)
			
			if GetName(sceneId,objId) == "" then
				strText = format( "已经杀死怪物: %d/%d", KilledNum+1, x320009_var_NeedKilledNum )
			else
				strText = format( "已经杀死%s: %d/%d", GetName(sceneId,objId), KilledNum+1, x320009_var_NeedKilledNum )
			end

			TalkAppendString( sceneId, strText )
			StopTalkTask( sceneId )
			DeliverTalkTips( sceneId, killerId )
			
			if KilledNum == x320009_var_NeedKilledNum - 1 then
				--完成了～～	
				SetQuestByIndex(sceneId, killerId, misIndex, 7, 1);
				--local str = format("%s完成任务",GetName(sceneId,killerId) )
			end
		end

	end

	if GetGuildID(sceneId, killerId) == -1 or HasTeam(sceneId, killerId) < 1 then		--不在帮会或队伍中，只判断自己是否有任务
		return 
	end

	--算同帮同队成员任务数据
	local num =  GetNearTeamCount(sceneId, killerId)
	for	i=0,num-1 do

		local member = GetNearTeamMember(sceneId, killerId,i)
		if member ~= -1 and member ~= killerId and GetGuildID(sceneId, member) == GetGuildID(sceneId, killerId) and IsPlayerStateNormal( sceneId,member ) == 1 then

			if GetHp(sceneId, member) > 0 then
				if MissionId ~= -1  and objdataId == GetMonsterDataID(sceneId,objId)  then
					local MemberMisIndex = GetQuestIndexByID( sceneId, member, MissionId )
					local MemberKilledNum = GetQuestParam( sceneId, member, MemberMisIndex, 0 )

					if MemberKilledNum < x320009_var_NeedKilledNum then	
				
						StartTalkTask(sceneId)
						if GetName(sceneId,objId) == "" then
							strText = format( "已经杀死怪物: %d/%d", MemberKilledNum+1, x320009_var_NeedKilledNum )
						else
							strText = format( "已经杀死%s: %d/%d", GetName(sceneId,objId), MemberKilledNum+1, x320009_var_NeedKilledNum )
						end
						TalkAppendString( sceneId, strText )
						StopTalkTask( sceneId )
						DeliverTalkTips( sceneId, member )

						SetQuestByIndex( sceneId, member, MemberMisIndex, 0, MemberKilledNum+1 )
						if MemberKilledNum == x320009_var_NeedKilledNum - 1 then
							--完成了～～
							--local str = format("%s完成任务",GetName(sceneId,member) )
							SetQuestByIndex(sceneId, member, MemberMisIndex, 7, 1);
						end				
					end
				end
			end
		end    
	end

end


--杀死怪物
function x320009_ProcQuestObjectKilled( sceneId, selfId, objdataId, objId, MissionId )
						   --场景ID, 自己的ID, 怪物表位置号, 怪物objId, 任务ID

end



---------------------------------------------------------------------------------------------------
--任务日志刷新
---------------------------------------------------------------------------------------------------
function x320009_QuestLogRefresh( sceneId, selfId, MissionId)

	local varSubMission = x320009_GetSubQuestList(GetCurCountry( sceneId, selfId ))
	if varSubMission == nil then
		return
	end
	
	for i,itm in varSubMission do 
		local bHaveMission = IsHaveQuestNM(sceneId, selfId, itm.MissionId );
		if bHaveMission > 0 then
		
			StartTalkTask(sceneId)	
			local level = GetLevel(sceneId, selfId)
			local ExpBonus = ceil ( (100 * 3 * level * 15*1*1 ) )
			ExpBonus =floor(ExpBonus+0.5)
			if ExpBonus > 0 then
				AddQuestExpBonus(sceneId, ExpBonus);		
			end
			if x320009_var_BonusMoney8 > 0 then
				AddQuestMoneyBonus8(sceneId, x320009_var_BonusMoney8 )	--增加帮贡
			end
			if x320009_var_GuildExpBonus>0 then
				AddQuestGuildExpBonus(sceneId,x320009_var_GuildExpBonus)
			end
			AddQuestItemBonus(sceneId, 12250015, 1)
			local misIndex = GetQuestIndexByID(sceneId, selfId, itm.MissionId);
			local num = GetQuestParam(sceneId, selfId, misIndex, 0)
			local text = format("(%d/%d)",num,1)


			AddQuestLogCustomText( sceneId,
									"",						-- 标题
									x320009_var_QuestName,        -- 任务名字
									x320009_var_SubMissionId[itm.varIndex].MissionTarget..text,		--任务目标
									itm.NPCName,			--任务NPC
									x320009_var_SubMissionId[itm.varIndex].Missionruse,               --任务攻略
									x320009_var_SubMissionId[itm.varIndex].MissionInfo,	--任务描述
									"随着你所在帮会等级的提高，你获得的奖励也会相应增加。"					--任务小提示
									)
		  
			StopTalkTask(sceneId)
			DeliverTalkRefreshQuest(sceneId, selfId, itm.MissionId);
			break
		end
	end

end

function x320009_ProcQuestLogRefresh( sceneId, selfId, MissionId)

	x320009_QuestLogRefresh( sceneId, selfId, MissionId );
end

---------------------------------------------------------------------------------------------------
--取得此任务当天当前已完成次数
---------------------------------------------------------------------------------------------------
function x320009_GetDayCount(sceneId, selfId)

	if x320009_var_Mis_Count > 0 then

		local today = GetDayOfYear()

		local lastday = GetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_KILLMONSTER_DATE[1], MD_GUILD_HOUHUAYUAN_KILLMONSTER_DATE[2], MD_GUILD_HOUHUAYUAN_KILLMONSTER_DATE[3])

		if lastday ~= today then
			return 0
		end

		local daycount =  GetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT[1], MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT[2], MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT[3])
		return daycount

	end

	return 0
end

---------------------------------------------------------------------------------------------------
--更新当天接任务次数
---------------------------------------------------------------------------------------------------
function x320009_SetDayCount(sceneId, selfId)
	local today = GetDayOfYear()

	local lastday = GetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_KILLMONSTER_DATE[1], MD_GUILD_HOUHUAYUAN_KILLMONSTER_DATE[2], MD_GUILD_HOUHUAYUAN_KILLMONSTER_DATE[3])

	if lastday ~= today then
		SetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_KILLMONSTER_DATE[1], MD_GUILD_HOUHUAYUAN_KILLMONSTER_DATE[2], MD_GUILD_HOUHUAYUAN_KILLMONSTER_DATE[3], today)
		SetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT[1], MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT[2], MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT[3], 1)
	else
		local daycount = GetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT[1], MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT[2], MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT[3])
		SetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT[1], MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT[2], MD_GUILD_HOUHUAYUAN_KILLMONSTER_COUNT[3], daycount+1)
	end
end

function x320009_ProcMemberJoinTimeReturn( varMap, varPlayer, param )

	GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_MULTI_MISSION_CHUYAO, x320009_var_ScriptId,param,"OnReturn1",-1)

end
