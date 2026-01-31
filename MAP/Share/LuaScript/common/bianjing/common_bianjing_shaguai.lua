--【练兵】清扫恶徒

--DECLARE_QUEST_INFO_START--
x304001_var_ScriptId 					= 304001
x304001_var_MissionIdList 		= {                     --任务ID
																		{Country=0,MissionId=10604},
																		{Country=1,MissionId=10605},
																		{Country=2,MissionId=10606},
																		{Country=3,MissionId=10607}

															}
x304001_var_MapInfo						= {
																{Country = 0,MapId	= 51 },
																{Country = 1,MapId	= 151},
																{Country = 2,MapId	= 251},
																{Country = 3,MapId	= 351},

														}
x304001_var_LevelLess 				= 80 
x304001_var_LevelMax 					= 89
x304001_var_Name							=	{}
x304001_var_ExtTarget					=	{
															{type=20,n=1,target="回报@npc_123838"},
															{type=20,n=1,target="回报@npc_126138"},
															{type=20,n=1,target="回报@npc_129740"},
															{type=20,n=1,target="回报@npc_132164"}

															}
x304001_var_MissionName				=	"【练兵】清扫恶徒"
x304001_var_MissionInfo				=	"\t边塞是非多，更有恶意之人从中作梗，破坏各部族之间的友好关系。近来，更是有恶人挑拨引诱大批不法之徒前来滋事，令各部剑拔弩张，一场部族之战一触即发。作为大元王朝的勇士，岂能坐看子民于水生火热之中。将那边塞扰民滋事的恶徒，屠之而后快。"	--任务描述
x304001_var_MissionTarget			=	{	"除掉恶徒之后回报@npc_125551",
																  "除掉恶徒之后回报@npc_128560",
															  	"除掉恶徒之后回报@npc_131561",
																  "除掉恶徒之后回报@npc_134557"}
x304001_var_MissionCompleted	=	"\t作为草原上最勇敢的战士，长生天一定会赐予你最伟大的力量！王城的子民将永远追随着你的目光！"	--完成任务npc说话的话
x304001_var_MissionUncompleted=	"\t速速动身，还在这里闲逛什么。"
x304001_var_QuestTarget				=	"\t清除滋事的不法之徒。"
x304001_var_ContinueInfo			=	""
x304001_var_MissionHelp 			=	"#W\t如果目前拥有的经验超过当前升级所需经验将不能接取此任务。"
x304001_var_DemandItem 				=	{}
x304001_var_ExpBonus 					= 0
x304001_var_BonusMoney1 			= 0        	--银卡
x304001_var_BonusMoney2 			= 0        	--现银
x304001_var_BonusMoney3 			= 0        	--金卡
x304001_var_BonusMoney4 			= 0        	--朝廷声望
x304001_var_BonusMoney5 			= 0        	--声望
x304001_var_BonusMoney6 			= 0        	--荣誉
x304001_var_BonusMoney8 			= 0        	--帮贡
x304001_var_BonusItem					=	{}
x304001_var_BonusChoiceItem 	=	{}
x304001_var_NpcGUID 					= {}
x304001_var_MissionCount			=	1		--每天任务限制
x304001_var_NeedPhysicalForce = 8
x304001_var_MissionMdDay			=	MD_QUEST_BAOZANG_DAY3
x304001_var_MissionMdDayCount	=	MD_QUEST_BAOZANG_DAYCOUNT3
----DECLARE_QUEST_INFO_STOP-- 
x304001_var_ScriptIdNext 			= -1
x304001_var_KillOgre 					= {
															{ Id=1, Type=2610, Name="花剌子模散兵"  , Target=125553, Level=30, Index=1, IndexId=1, OverId=3 },
															{ Id=2, Type=2611, Name="花剌子模精兵"  , Target=125554, Level=30, Index=1, IndexId=2, OverId=4 },
															{ Id=3, Type=2612, Name="花剌子模将领"  , Target=125555, Level=40, Index=2, IndexId=1, OverId=3 },
															{ Id=4, Type=2613, Name="花剌子模主将"  , Target=125556, Level=40, Index=2, IndexId=2, OverId=4 },
															{ Id=5, Type=2614, Name="黑风盗宝客"    , Target=125557, Level=50, Index=3, IndexId=1, OverId=3 },
															{ Id=6, Type=2615, Name="波斯盗宝客"    , Target=125558, Level=50, Index=3, IndexId=2, OverId=4 },
															{ Id=7, Type=2616, Name="完颜部蛮兵"    , Target=125559, Level=60, Index=4, IndexId=1, OverId=3 },
															{ Id=8, Type=2617, Name="残暴的监工"        , Target=125560, Level=60, Index=4, IndexId=2, OverId=4 },
															{ Id=9, Type=2618, Name="鬼祟的监工"       , Target=125561, Level=70, Index=5, IndexId=1, OverId=3 },
															{ Id=10,Type=2619, Name="完颜部精锐步兵"  , Target=125562, Level=70, Index=5, IndexId=2, OverId=4 },
															{ Id=11,Type=2620, Name="夏王墓盗墓贼"    , Target=125563, Level=80, Index=6, IndexId=1, OverId=3 },
															{ Id=12,Type=2621, Name="夏王墓盗陵者"    , Target=125564, Level=80, Index=6, IndexId=2, OverId=4 },
															}


x304001_var_ExpTable       ={
													10         ,
													45         ,
													140        ,
													325        ,
													630        ,
													1085       ,
													1720       ,
													2565       ,
													3650       ,
													5005       ,
													6660       ,
													8645       ,
													10990      ,
													13725      ,
													16880      ,
													20485      ,
													24570      ,
													29165      ,
													34300      ,
													68956      ,
													95810      ,
													120000     ,
													150579     ,
													187824     ,
													201192     ,
													222841     ,
													259924     ,
													302592     ,
													310990     ,
													1251143    ,
													1320651    ,
													1390160    ,
													1469597    ,
													1539105    ,
													1618543    ,
													1697980    ,
													1777418    ,
													1856856    ,
													3813009    ,
													4855871    ,
													5085377    ,
													5302804    ,
													5544390    ,
													5785976    ,
													6039640    ,
													6293305    ,
													6559050    ,
													6824794    ,
													13939491   ,
													11446321   ,
													11908062   ,
													12381955   ,
													12880149   ,
													19672605   ,
													16027280   ,
													16646985   ,
													17278842   ,
													17935000   ,
													27364242   ,
													28024350   ,
													34189707   ,
													41700232   ,
													50847380   ,
													61985378   ,
													94430849   ,
													105471995  ,
													117777061  ,
													131488420  ,
													200133111  ,
													203278075  ,
													247418457  ,
													301083868  ,
													366318707  ,
													445604125  ,
													903251606  ,
													1006824457 ,
													1122079362 ,
													1250317003 ,
													1392981379 ,
													1415855064 ,
													1449169301 ,
													1482483538 ,
													1515797774 ,
													1549112011 ,
													1582426248 ,
													1615740485 ,
													1649054722 ,
													1682368958 ,
													1731996576 ,
													2251595549 ,
													2476755104 ,
													2724430614 ,
													2996873675 ,
													4495310513 ,
													4720076039 ,
													4956079841 ,
													5203883833 ,
													5464078024 ,
													7376505333 ,
													7430265312 ,
													8173291842 ,
													8336757679 ,
													8503492832 ,
													8673562689 ,
													9891497937 ,
													10815327896,
													11643634453,
													12176507143,
													13140372085,
													14827581638,
													15568960719,
													16503098363,
													17658315248,
													19070980468,
													20787368710,
													21826737146,
													23136341374,
													24755885271,
													26736356092,
													29142628141,
													32056890955,
													33980304412,
													36019122677,
													38180270038,
													40471086240,
													42899351414,
													45473312499,
													48201711249,
													51093813924,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,
													54159442760,

}

--**********************************

function x304001_ProcEnumEvent(varMap, varPlayer, NPCId, MissionId)
	if IsHaveQuest( varMap, varPlayer, x304001_GetMissionId( varMap, varPlayer ) ) <= 0 then
		return
	end
	if IsHaveQuest( varMap, varPlayer, x304001_GetMissionId( varMap, varPlayer ) ) <= 0 then
		local level = GetLevel( varMap, varPlayer )
		if level < x304001_var_LevelLess or level > x304001_var_LevelMax then
			return 
		end	
	end
	local state = GetQuestStateNM( varMap, varPlayer, NPCId, x304001_GetMissionId( varMap, varPlayer ) )
	TalkAppendButtonNM( varMap, varPlayer, NPCId, x304001_GetMissionId( varMap, varPlayer ), state, -1 )
end

function x304001_DispatchMissionInfo( varMap, varPlayer, NPCId )
	local ExpBonus = x304001_GetMissionExpBonus(varMap, varPlayer )

	if ExpBonus> 0 then
		AddQuestExpBonus(varMap, ExpBonus )
	end
	if x304001_GetSliverCardBonus(varMap, varPlayer ) > 0 then
		AddQuestMoneyBonus1(varMap, x304001_GetSliverCardBonus(varMap, varPlayer ) )
	end
	if x304001_var_BonusMoney2 > 0 then
		AddQuestMoneyBonus2(varMap, x304001_var_BonusMoney2 )
	end
	if x304001_var_BonusMoney3 > 0 then
		AddQuestMoneyBonus3(varMap, x304001_var_BonusMoney3 )
	end
	if x304001_var_BonusMoney4 > 0 then
		AddQuestMoneyBonus4(varMap, x304001_var_BonusMoney4 )
	end
	if x304001_var_BonusMoney5 > 0 then
		AddQuestMoneyBonus5(varMap, x304001_var_BonusMoney5 )
	end
	if x304001_var_BonusMoney6 > 0 then
		AddQuestMoneyBonus6(varMap, x304001_var_BonusMoney6 )
	end
	if x304001_GetBanggong(varMap,varPlayer) > 0 then
		AddQuestMoneyBonus8(varMap, x304001_GetBanggong(varMap,varPlayer) )
	end
	for i, item in x304001_var_BonusItem do
		AddQuestItemBonus(varMap, item.item, item.n)
	end
	for i, item in x304001_var_BonusChoiceItem do
		AddQuestRadioItemBonus(varMap, item.item, item.n)
	end
end
--**********************************

function x304001_ProcEventEntry(varMap, varPlayer, NPCId, MissionId)	--点击该任务后执行此脚本

--	if GetLevel(varMap, varPlayer) < x304001_var_LevelLess then
--		StartTalkTask(varMap);
--		TalkAppendString(varMap, "你等级过低，不能领取任务");
--		StopTalkTask();
--		DeliverTalkTips(varMap, varPlayer);
--		Msg2Player(varMap,varPlayer,"你等级过低，不能领取任务",8,2)
--		return
--	end
--
--	if GetLevel(varMap, varPlayer) > x304001_var_LevelMax then
--		StartTalkTask(varMap);
--		TalkAppendString(varMap, "你等级过高，不能领取任务");
--		StopTalkTask();
--		DeliverTalkTips(varMap, varPlayer);
--		Msg2Player(varMap,varPlayer,"你等级过高，不能领取任务",8,2)
--		return
--	end
--	local varLevelMax = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
--	if GetLevel(varMap, varPlayer) > ( varLevelMax-5) then
--		StartTalkTask(varMap);
--		TalkAppendString(varMap, "你等级过高，不能领取任务");
--		StopTalkTask();
--		DeliverTalkTips(varMap, varPlayer);
--		Msg2Player(varMap,varPlayer,"你等级过高，不能领取任务",8,2)
--		return
--	end
	
	local IsHaveExp = GetExp(varMap, varPlayer)
	local Selflevel = GetLevel( varMap, varPlayer )
	if IsHaveExp >= x304001_var_ExpTable[Selflevel] then 
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您的剩余经验超过了当前升级所需经验，请升级后再试");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您的剩余经验超过了当前升级所需经验，请升级后再试",8,2)	
		return
	end	

	if IsHaveQuest(varMap,varPlayer, x304001_GetMissionId( varMap, varPlayer )) > 0 then
		if x304001_CheckSubmit(varMap, varPlayer, NPCId) <= 0 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x304001_var_MissionName)
				TalkAppendString(varMap,x304001_var_MissionUncompleted)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, NPCId, x304001_var_ScriptId, x304001_GetMissionId( varMap, varPlayer ));
		else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x304001_var_MissionName)
				TalkAppendString(varMap,x304001_var_MissionCompleted)
				TalkAppendString(varMap," ")
--			if GetGuildID(varMap, varPlayer) >= 0 then
--				TalkAppendString( varMap,"#Y帮会奖励:#W\n帮会基金：100文\n帮会边塞经验：10点")
--			end		
			x304001_DispatchMissionInfo( varMap, varPlayer, NPCId )
			StopTalkTask()
			DeliverTalkContinueNM(varMap, varPlayer, NPCId, x304001_var_ScriptId, x304001_GetMissionId( varMap, varPlayer ));
		end
	elseif x304001_ProcAcceptCheck(varMap, varPlayer, NPCId) > 0 then
		local CountryID = GetCurCountry( varMap, varPlayer )
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x304001_var_MissionName)
			TalkAppendString(varMap,x304001_var_MissionInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			TalkAppendString( varMap, x304001_var_QuestTarget )  --简化任务目标

			if x304001_var_MissionHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x304001_var_MissionHelp )
			end
--			if GetGuildID(varMap, varPlayer) >= 0 then
--				TalkAppendString( varMap,"#Y帮会奖励:#W\n帮会基金：100文\n帮会边塞经验：10点")
--			end		
			x304001_DispatchMissionInfo( varMap, varPlayer, NPCId )
		StopTalkTask()
		DeliverTalkInfoNM(varMap, varPlayer, NPCId, x304001_var_ScriptId, x304001_GetMissionId( varMap, varPlayer ));
	end
end
--**********************************

function x304001_ProcQuestLogRefresh( varMap, varPlayer, MissionId )
	local ExpBonus = x304001_GetMissionExpBonus(varMap, varPlayer )
	local misIndex = GetQuestIndexByID( varMap, varPlayer, x304001_GetMissionId( varMap, varPlayer ) )
--	local msg = "\n \n#Y帮会奖励:#W\n帮会基金：100文\n帮会边塞经验：10点"
--		if GetGuildID(varMap, varPlayer) == -1 then
--				 msg = ""
--		end		
	if x304001_CheckSubmit(varMap, varPlayer, -1) > 0 then
		local CountryID = GetCurCountry( varMap, varPlayer )
		local strTarget = "任务完成，"..x304001_var_ExtTarget[CountryID+1].target
		SetQuestByIndex( varMap, varPlayer, misIndex, 7, 1 )
		StartTalkTask( varMap )
		AddQuestLogCustomText( varMap,
					"",                             -- 标题
					x304001_var_MissionName,          -- 任务名字
					strTarget,
					"",                             --任务NPC
					x304001_var_MissionTarget[CountryID+1],
					x304001_var_MissionInfo,
					x304001_var_MissionHelp
					)
		StopTalkTask()
	else        
		local CountryID = GetCurCountry( varMap, varPlayer )   
		local strTarget = ""
		for i = 1, 6 do
				--if ( strTarget ~= "" ) then
				--	strTarget = strTarget.."\n"
				--end
				if ( GetQuestParam( varMap, varPlayer, misIndex, i ) == 3 ) then
					strTarget = strTarget.."  除掉@npc_"..(x304001_var_KillOgre[(i-1)*2+1].Target).."（1/1）" 
				elseif ( GetQuestParam( varMap, varPlayer, misIndex, i ) == 4 ) then
					strTarget = strTarget.."  除掉@npc_"..(x304001_var_KillOgre[(i-1)*2+2].Target).."（1/1）" 
				elseif ( GetQuestParam( varMap, varPlayer, misIndex, i ) == 1 ) then
					strTarget = strTarget.."  除掉@npc_"..(x304001_var_KillOgre[(i-1)*2+1].Target).."（0/1）" 
				elseif ( GetQuestParam( varMap, varPlayer, misIndex, i ) == 2 ) then
					strTarget = strTarget.."  除掉@npc_"..(x304001_var_KillOgre[(i-1)*2+2].Target).."（0/1）" 
				end
		end
		StartTalkTask( varMap )
		AddQuestLogCustomText( varMap,
					"",                             -- 标题
					x304001_var_MissionName,          -- 任务名字
					strTarget,
					"",                             --任务NPC
					x304001_var_MissionTarget[CountryID+1],
					x304001_var_MissionInfo,
					x304001_var_MissionHelp
					)
		StopTalkTask()
	end
		if ExpBonus> 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
  	if x304001_GetSliverCardBonus(varMap, varPlayer ) > 0 then
			AddQuestMoneyBonus1(varMap, x304001_GetSliverCardBonus(varMap, varPlayer ) )
		end
		if x304001_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x304001_var_BonusMoney2 )
		end
		if x304001_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x304001_var_BonusMoney3 )
		end
		if x304001_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x304001_var_BonusMoney4 )
		end
		if x304001_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x304001_var_BonusMoney5 )
		end
		if x304001_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x304001_var_BonusMoney6 )
		end

		DeliverTalkRefreshQuest( varMap, varPlayer, MissionId );
end

function x304001_ProcAcceptCheck(varMap, varPlayer, NPCId)


	local Day = GetDayOfYear()
	local Date = GetPlayerGameData( varMap, varPlayer, x304001_var_MissionMdDay[1], x304001_var_MissionMdDay[2], x304001_var_MissionMdDay[3] )

	
	if ( Day == Date ) then
		local DayCnt = GetPlayerGameData( varMap, varPlayer, x304001_var_MissionMdDayCount[1], x304001_var_MissionMdDayCount[2], x304001_var_MissionMdDayCount[3] )
		
		if  DayCnt >= x304001_var_MissionCount  then
			StartTalkTask(varMap)
			TalkAppendString( varMap, "您今天已经完成过【练兵】清扫恶徒任务，无法再次领取" )
			StopTalkTask(varMap)
		  DeliverTalkTips(varMap,varPlayer)
			return 0
			
		end
	end

	return 1
end

--**********************************
function x304001_CheckSubmit( varMap, varPlayer, NPCId)

	local misIndex = GetQuestIndexByID( varMap, varPlayer, x304001_GetMissionId( varMap, varPlayer ) )
	for i = 1, 6 do
			if ( GetQuestParam( varMap, varPlayer, misIndex, i ) >= 3 ) then
				return 1
			end
	end
	return 0
end

--**********************************
function x304001_ProcQuestAccept( varMap, varPlayer, NPCId, MissionId )

	if GetLevel(varMap, varPlayer) < x304001_var_LevelLess then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过低，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过低，不能领取任务",8,2)
		return
	end

	if GetLevel(varMap, varPlayer) > x304001_var_LevelMax then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过高，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过高，不能领取任务",8,2)
		return
	end
	local varLevelMax = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
	if GetLevel(varMap, varPlayer) > ( varLevelMax-5) then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过高，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过高，不能领取任务",8,2)
		return
	end
	
	local IsHaveExp = GetExp(varMap, varPlayer)
	local Selflevel = GetLevel( varMap, varPlayer )
	if IsHaveExp >= x304001_var_ExpTable[Selflevel] then 
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您的剩余经验超过了当前升级所需经验，无法领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您的剩余经验超过了当前升级所需经验，无法领取任务",8,2)	
		return
	end	

	-- 重复任务，只要没有任务就可以接
	if IsQuestFullNM(varMap,varPlayer)==1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		TalkAppendString(varMap,varPlayer)
		return 0
	end

	--检查前置任务
	local FrontMissiontId1, FrontMissiontId2, FrontMissiontId3 = GetFrontQuestIdNM( varMap, varPlayer, x304001_GetMissionId( varMap, varPlayer ) )
	if FrontMissiontId1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId1 ) == 0 then
			return 0
		end
	end
	if FrontMissiontId2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId2 ) == 0 then
			return 0
		end
	end
	if FrontMissiontId3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId3 ) == 0 then
			return 0
		end
	end
--	local IshavePhysicalForce = GetPhysicalForce(varMap, varPlayer)
--	if IshavePhysicalForce < x304001_var_NeedPhysicalForce then
--			Msg2Player( varMap, varPlayer, "您的体力值不足，无法领取任务", 0, 2 )
--			Msg2Player( varMap, varPlayer, "您的体力值不足，无法领取任务", 0, 3 )
--			return 0
--	end
	if x304001_ProcAcceptCheck(varMap, varPlayer, NPCId) > 0 then

		local Ret = AddQuest( varMap, varPlayer, x304001_GetMissionId( varMap, varPlayer ), x304001_var_ScriptId, 1, 0, 0)
		if ( Ret == 0 ) then
			Msg2Player( varMap, varPlayer, "接受任务失败！", 0, 3 )
			return 0
		else
			x304001_Msg2toplayer( varMap, varPlayer, 0 )
			local misIndex = GetQuestIndexByID( varMap, varPlayer, x304001_GetMissionId( varMap, varPlayer ) )
			if x304001_CheckSubmit(varMap, varPlayer, NPCId) > 0 then
				SetQuestByIndex( varMap, varPlayer, misIndex, 0, 1 )
				SetQuestByIndex( varMap, varPlayer, misIndex, 7, 1 )
			else
				local Idx = random(1,2)
				SetQuestByIndex( varMap, varPlayer, misIndex, 0, 0 )
				SetQuestByIndex( varMap, varPlayer, misIndex, 1, 0 )
				SetQuestByIndex( varMap, varPlayer, misIndex, 2, 0 )
				SetQuestByIndex( varMap, varPlayer, misIndex, 3, 0 )
				SetQuestByIndex( varMap, varPlayer, misIndex, 4, 0 )
				SetQuestByIndex( varMap, varPlayer, misIndex, 5, 0 )
				SetQuestByIndex( varMap, varPlayer, misIndex, 6, 0 )
				SetQuestByIndex( varMap, varPlayer, misIndex, 7, 0 )
				local level = GetLevel( varMap, varPlayer )
				if level >= 40 and level < 50 then
					SetQuestByIndex( varMap, varPlayer, misIndex, 1, Idx )
				elseif level >= 50 and level < 60 then
					SetQuestByIndex( varMap, varPlayer, misIndex, 2, Idx )
				elseif level >= 60 and level < 70 then
					SetQuestByIndex( varMap, varPlayer, misIndex, 3, Idx )
				elseif level >= 70 and level < 80 then
					SetQuestByIndex( varMap, varPlayer, misIndex, 4, Idx )
				elseif level >= 80 and level < 90 then
					SetQuestByIndex( varMap, varPlayer, misIndex, 5, Idx )
				elseif level >= 90 then
					SetQuestByIndex( varMap, varPlayer, misIndex, 6, Idx )
				end
			end
		end
	end
end

--**********************************

function x304001_ProcQuestAbandon(varMap, varPlayer, MissionId)

	DelQuestNM( varMap, varPlayer, x304001_GetMissionId( varMap, varPlayer ) )
	local Day = GetDayOfYear()
	local DayCnt = GetPlayerGameData( varMap, varPlayer, x304001_var_MissionMdDayCount[1], x304001_var_MissionMdDayCount[2], x304001_var_MissionMdDayCount[3] )
	SetPlayerGameData( varMap, varPlayer, x304001_var_MissionMdDay[1], x304001_var_MissionMdDay[2], x304001_var_MissionMdDay[3], Day )
	SetPlayerGameData( varMap, varPlayer, x304001_var_MissionMdDayCount[1], x304001_var_MissionMdDayCount[2], x304001_var_MissionMdDayCount[3], DayCnt+1 )
	local message = "您放弃了:"..x304001_var_MissionName
	StartTalkTask(varMap);
		TalkAppendString(varMap, message);
	StopTalkTask();
	TalkAppendString(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 4, 2);

end

--**********************************
function x304001_CheckPlayerBagFull( varMap ,varPlayer,selectRadioId )
	
	local result = 1
	local j = 0
	local bAdd = 0 --是否已经在固定物品奖励添加检测中已经检查出包裹已满
	StartItemTask(varMap)
	for j, item in x304001_var_BonusItem do
		AddItem( varMap, item.item, item.n )
	end
	for j, item in x304001_var_BonusChoiceItem do
		if item.item == selectRadioId then
			AddItem( varMap, item.item, item.n )
			break
		end
	end
	local ret = StopItemTask(varMap,varPlayer)
	if ret <= 0 then
		if result == 1 then
			result = 0
		end
	end
	return result
end

--**********************************
function x304001_ProcQuestSubmit(varMap, varPlayer, NPCId, selectRadioId, MissionId)

	if IsHaveQuest(varMap,varPlayer, x304001_GetMissionId( varMap, varPlayer )) <= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有这个任务！")
		StopTalkTask(varMap)
		TalkAppendString(varMap,varPlayer)
		return 0
	elseif x304001_CheckSubmit( varMap, varPlayer, NPCId) <= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有达到完成条件！")
		StopTalkTask(varMap)
		TalkAppendString(varMap,varPlayer)
		return 0
	elseif x304001_CheckPlayerBagFull( varMap ,varPlayer,selectRadioId ) <= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"包裹已满！")
		StopTalkTask(varMap)
		TalkAppendString(varMap,varPlayer)
		return 0
	elseif DelQuest(varMap, varPlayer, x304001_GetMissionId( varMap, varPlayer )) > 0 then
		local Day = GetDayOfYear()
		local DayCnt = GetPlayerGameData( varMap, varPlayer, x304001_var_MissionMdDayCount[1], x304001_var_MissionMdDayCount[2], x304001_var_MissionMdDayCount[3] )
		SetPlayerGameData( varMap, varPlayer, x304001_var_MissionMdDay[1], x304001_var_MissionMdDay[2], x304001_var_MissionMdDay[3], Day )
		SetPlayerGameData( varMap, varPlayer, x304001_var_MissionMdDayCount[1], x304001_var_MissionMdDayCount[2], x304001_var_MissionMdDayCount[3], DayCnt+1 )
		x304001_Msg2toplayer( varMap, varPlayer,2)
		QuestCom(varMap, varPlayer, x304001_GetMissionId( varMap, varPlayer ))
		x304001_GetBonus( varMap, varPlayer,NPCId)
		StartItemTask(varMap)
			for i, item in x304001_var_BonusItem do
				AddItem( varMap, item.item, item.n )
			end
			for i, item in x304001_var_BonusChoiceItem do
			if item.item == selectRadioId then
				AddItem( varMap, item.item, item.n )
			end
		end
		StopItemTask(varMap,varPlayer)
	end
	LuaCallNoclosure( x304001_var_ScriptIdNext, "ProcEventEntry", varMap, varPlayer, NPCId, x304001_var_MissionIdNext )	
end

function x304001_GetBonus( varMap, varPlayer,NpcID)

	local ExpBonus = x304001_GetMissionExpBonus(varMap, varPlayer )
	if ExpBonus > 0 then
		AddExp(varMap, varPlayer, ExpBonus);
	end
	if x304001_GetSliverCardBonus(varMap, varPlayer ) > 0 then
		AddMoney( varMap, varPlayer, 1, x304001_GetSliverCardBonus(varMap, varPlayer ) )
	end
	if x304001_var_BonusMoney2 > 0 then
		AddMoney( varMap, varPlayer, 0, x304001_var_BonusMoney2 )
	end
	if x304001_var_BonusMoney3 > 0 then
		AddMoney( varMap, varPlayer, 3, x304001_var_BonusMoney3 )
	end
	if x304001_var_BonusMoney4 > 0 then
		local nRongYu = GetRongYu( varMap, varPlayer )
		nRongYu = nRongYu + x304001_var_BonusMoney4
		SetRongYu( varMap, varPlayer, nRongYu )
	end
	if x304001_var_BonusMoney5 > 0 then
		local nShengWang = GetShengWang( varMap, varPlayer )
		nShengWang = nShengWang + x304001_var_BonusMoney5
		SetShengWang( varMap, varPlayer, nShengWang )
	end
	if x304001_var_BonusMoney6 > 0 then
		AddHonor(varMap,varPlayer,x304001_var_BonusMoney6)
	end

end

function x304001_Msg2toplayer( varMap, varPlayer,type)

	local ExpBonus = x304001_GetMissionExpBonus(varMap, varPlayer )
	if type == 0 then
		Msg2Player(varMap, varPlayer, "您接受了任务"..x304001_var_MissionName.."！", 0, 2)
		Msg2Player(varMap, varPlayer, "您接受了任务"..x304001_var_MissionName.."！", 0, 3)
	elseif type == 1 then
		Msg2Player(varMap, varPlayer, "您放弃了任务"..x304001_var_MissionName.."！", 0, 2)
		Msg2Player(varMap, varPlayer, "您放弃了任务"..x304001_var_MissionName.."！", 0, 3)
	elseif type == 2 then
		Msg2Player(varMap, varPlayer, "您完成了任务"..x304001_var_MissionName.."！", 0, 2)
		Msg2Player(varMap, varPlayer, "您完成了任务"..x304001_var_MissionName.."！", 0, 3)
		if ExpBonus > 0 then
			Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..ExpBonus.."#cffcf00的奖励", 0, 2)
		end
		if x304001_GetSliverCardBonus(varMap, varPlayer ) > 0 then
        Msg2Player(varMap, varPlayer , format("获得#G银卡#{_MONEY%d}#cffcf00的奖励", x304001_GetSliverCardBonus(varMap, varPlayer )), 0, 2)
        Msg2Player(varMap, varPlayer , format("获得#G银卡#{_MONEY%d}#cffcf00的奖励", x304001_GetSliverCardBonus(varMap, varPlayer )), 0, 3)
		end
		if x304001_var_BonusMoney2 > 0 then
			Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x304001_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
		end
		if x304001_var_BonusMoney3 > 0 then
			Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x304001_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
		end
		if x304001_var_BonusMoney4 > 0 then
			Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x304001_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
		end
		if x304001_var_BonusMoney5 > 0 then
			Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x304001_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
		end
		if x304001_var_BonusMoney6 > 0 then
			Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x304001_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
		end
		if x304001_GetBanggong(varMap,varPlayer) > 0 then
    	Msg2Player(varMap, varPlayer, "#cffcf00获得#G帮贡"..x304001_GetBanggong(varMap,varPlayer).."#cffcf00的奖励", 0, 2)
    end
	end
end

function x304001_ProcQuestObjectKilled(varMap, varPlayer, objdataId, objId, MissionId)

	local Id = x304001_FindOgreIndex( objdataId )

	if ( Id == -1 ) then
		return
	end
	local CurCountry = GetCurCountry( varMap, varPlayer )
	local CountryID = x304001_GetMapCountry( varMap )
	if ( CountryID == CurCountry ) then

		x304001_ProcQuestNext( varMap, varPlayer, Id )
	end

	-- 查找怪物周围一定范围的玩家，只要满足也完成任务，必须要当前执政国的玩家
	local PosX, PosZ = GetMonsterPosition( varMap, objId )
	local KilledNum = GetNearPlayerCount( varMap, varPlayer, PosX, PosZ, 20 )
	for i = 0, KilledNum-1 do
		local humanObjId = GetNearPlayerMember( varMap, varPlayer, i )
		local HumanCountry = GetCurCountry( varMap, humanObjId )
		if ( CountryID ~= HumanCountry ) then
				break
		end
		if x304001_CheckState(varMap, varPlayer, humanObjId) == 0 then
				break
		end
		if ( humanObjId ~= -1 and humanObjId ~= varPlayer ) then
			if IsPlayerStateNormal( varMap, humanObjId ) > 0  then
				x304001_ProcQuestNext( varMap, humanObjId, Id )
			end
		end
	end
end


function x304001_ProcAreaEntered(varMap, varPlayer, zoneId, MissionId )
	--return CallScriptFunction( MISSION_SCRIPT, "ProcAreaEntered",varMap, varPlayer, zoneId, MissionId )	
end

function x304001_ProcTiming(varMap, varPlayer, ScriptId, MissionId)
	 CallScriptFunction( MISSION_SCRIPT, "ProcTiming",varMap, varPlayer, ScriptId, MissionId )
end

function x304001_ProcAreaLeaved(varMap, varPlayer, ScriptId, MissionId)
	--CallScriptFunction( MISSION_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, ScriptId, MissionId)
end

function x304001_ProcQuestItemChanged(varMap, varPlayer, itemdataId, MissionId)
	CallScriptFunction( MISSION_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, itemdataId, MissionId )
end

function x304001_ProcQuestAttach( varMap, varPlayer, npcId, npcGuid, misIndex, MissionId )
	CallScriptFunction( MISSION_SCRIPT, "ProcQuestAttach",varMap, varPlayer, npcId, npcGuid, misIndex, MissionId)
end

function x304001_MissionComplate( varMap, varPlayer, targetId, selectId, MissionId )
	return CallScriptFunction( MISSION_SCRIPT, "MissionComplate", varMap, varPlayer, targetId, selectId, MissionId  )
end

function x304001_PositionUseItem( varMap, varPlayer, BagIndex, impactId )
	return  CallScriptFunction( MISSION_SCRIPT, "PositionUseItem",varMap, varPlayer, BagIndex, impactId)
end

function x304001_OnOpenItemBox( varMap, varPlayer, targetId, gpType, needItemID )
	return CallScriptFunction( MISSION_SCRIPT, "OnOpenItemBox",varMap, varPlayer, targetId, gpType, needItemID)
end

function x304001_OnRecycle( varMap, varPlayer, targetId, gpType, needItemID )
	return CallScriptFunction( MISSION_SCRIPT, "OnRecycle",varMap, varPlayer, targetId, gpType, needItemID)
end

function x304001_OnProcOver( varMap, varPlayer, targetId )
	CallScriptFunction( MISSION_SCRIPT, "OnProcOver",varMap, varPlayer, targetId)
end

function x304001_OpenCheck( varMap, varPlayer, targetId )
	CallScriptFunction( MISSION_SCRIPT, "OpenCheck", varMap, varPlayer, targetId )
end


function x304001_FindOgreIndex( OgreID )
	for i ,item in x304001_var_KillOgre do
		if item.Type == OgreID then
			return item.Id
			
		end
	end
	return -1
end

function x304001_ProcQuestNext( varMap, varPlayer, Id )

	if IsHaveQuest( varMap, varPlayer, x304001_GetMissionId( varMap, varPlayer ) ) > 0 and GetHp(varMap, varPlayer) > 0 then
		local misIndex = GetQuestIndexByID( varMap, varPlayer, x304001_GetMissionId( varMap, varPlayer ) )
		if ( GetQuestParam( varMap, varPlayer, misIndex, x304001_var_KillOgre[Id].Index ) == x304001_var_KillOgre[Id].IndexId ) then
			SetQuestByIndex( varMap, varPlayer, misIndex, x304001_var_KillOgre[Id].Index, x304001_var_KillOgre[Id].OverId )
			SetQuestByIndex( varMap, varPlayer, misIndex, 0, 1 )
			SetQuestByIndex( varMap, varPlayer, misIndex, 7, 1 )
			Msg2Player( varMap, varPlayer, "  除掉"..x304001_var_KillOgre[Id].Name.." 1/1", 0, 3 )
			x304001_ProcQuestLogRefresh( varMap, varPlayer, x304001_GetMissionId( varMap, varPlayer ) )
		end
	end
end

function x304001_GetMissionExpBonus(varMap, varPlayer )
	local varLevel = GetLevel(varMap, varPlayer)
	local awardexp = 0
	if x304001_var_ExpTable[varLevel] > 0 then
		awardexp = floor(x304001_var_ExpTable[varLevel]/5)
	end
	return awardexp
end

----------------------------------------------------------------------------------------------
--判断杀怪归属
----------------------------------------------------------------------------------------------
function x304001_CheckGuildID(varMap, varPlayer, varObj)
	local TempGuild1 = GetGuildID(varMap, varPlayer)
	local TempGuild2 = GetGuildID(varMap, varObj)
	if TempGuild1 == TempGuild2 then
		return 1
	else
		return 0
	end
end

function x304001_CheckTeamID(varMap, varPlayer, varObj)
	local TempTeam1 = GetTeamId(varMap, varPlayer)
	local TempTeam2 = GetTeamId(varMap, varObj)
	if TempTeam1 == TempTeam2 then
		return 1
	else
		return 0
	end
end

function x304001_CheckState(varMap, varPlayer, varObj)
	if x304001_CheckGuildID(varMap, varPlayer, varObj) + x304001_CheckTeamID(varMap, varPlayer, varObj) == 0 then
		return 0
	else
		return 1
	end
end

function x304001_GetMissionId( varMap, varPlayer )
	local TempCountry = GetCurCountry( varMap, varPlayer )
	for i ,item in x304001_var_MissionIdList do
		if item.Country == TempCountry then
			return item.MissionId
		end
	end
end
----------------------------------------------------------------------------------------------
--获取玩家阵营对应MapId
----------------------------------------------------------------------------------------------
function x304001_GetMapId(varMap, varPlayer)
		TempCountry = GetCurCountry(varMap, varPlayer)
		for i ,item in x304001_var_MapInfo do
				if TempCountry == item.Country then
						return item.MapId
				end
		end
end
----------------------------------------------------------------------------------------------
--获取地图对应阵营
----------------------------------------------------------------------------------------------
function x304001_GetMapCountry(varMap)
		for i ,item in x304001_var_MapInfo do
				if varMap == item.MapId then
						return item.Country
				end
		end
end

----------------------------------------------------------------------------------------------
--判断杀怪归属
----------------------------------------------------------------------------------------------
function x304001_CheckGuildID(varMap, varPlayer, varObj)
	local TempGuild1 = GetGuildID(varMap, varPlayer)
	local TempGuild2 = GetGuildID(varMap, varObj)
	if TempGuild1 == TempGuild2 then
		return 1
	else
		return 0
	end
end

function x304001_CheckTeamID(varMap, varPlayer, varObj)
	local TempTeam1 = GetTeamId(varMap, varPlayer)
	local TempTeam2 = GetTeamId(varMap, varObj)
	if TempTeam1 == TempTeam2 then
		return 1
	else
		return 0
	end
end

function x304001_CheckState(varMap, varPlayer, varObj)
	if x304001_CheckGuildID(varMap, varPlayer, varObj) + x304001_CheckTeamID(varMap, varPlayer, varObj) == 0 then
		return 0
	else
		return 1
	end
end
function x304001_GetBanggong(varMap,varPlayer)
	return 0
end
function x304001_GetSliverCardBonus(varMap, varPlayer )
	local multi = 0 
	local BonusSilver = 0	
	local level = GetLevel( varMap, varPlayer )
	if level >= 10 and level <= 19 then 
		multi = 4000
	elseif level >= 20 and level <= 29 then
		multi = 5000
	elseif level >= 30 and level <= 39 then
		multi = 6000
	elseif level >= 40 and level <= 49 then
		multi = 7000	
	elseif level >= 50 and level <= 59 then
		multi = 8000		
	elseif level >= 60 and level <= 69 then
		multi = 10000		
	elseif level >= 70 and level <= 79 then
		multi = 15000		
	elseif level >= 80 and level <= 89 then
		multi = 20000		
	elseif level >= 90 and level <= 160 then
		multi = 25000						
	end
	
	BonusSilver =4*5/60 * multi
	
	return 0
end
