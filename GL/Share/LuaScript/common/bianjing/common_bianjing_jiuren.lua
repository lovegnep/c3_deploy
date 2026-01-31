--【练兵】营救巡卫

--DECLARE_QUEST_INFO_START--
x304000_var_ScriptId 					= 304000
x304000_var_MissionIdList 		= {                     --任务ID
																		{Country=0,MissionId=10600},
																		{Country=1,MissionId=10601},
																		{Country=2,MissionId=10602},
																		{Country=3,MissionId=10603},

															}
x304000_var_LevelLess 				= 90 
x304000_var_LevelMax					= 99
x304000_var_MissionLevel1			= 90
x304000_var_MissionLevel2 		=	93
x304000_var_MissionLevel3 		=	96
x304000_var_Name							=	{}
x304000_var_GatherPointTypeId = 939
x304000_var_ExtTarget					=	{
																{type=20,n=1,target="@npc_123838"},
																{type=20,n=1,target="@npc_126138"},
																{type=20,n=1,target="@npc_129740"},
																{type=20,n=1,target="@npc_132164"},

															}
x304000_var_MissionName				=	"【练兵】营救巡卫"
x304000_var_MissionInfo				=	"\t边境自古便是纷争聚集之地。各种势力聚集于此，鱼龙混杂。听说有人散布谣言说边塞的藏宝洞已被发现，于是有心人士纠结了大批不法之徒乔装来此。为了宝藏不断挑起事端，妄图借机搅乱边塞防御阵地，暗杀边塞巡逻士兵，很多士兵惨遭毒手。请你协助我们营救受伤的将士吧。"	--任务描述
x304000_var_MissionTarget			=	"营救边塞受伤的巡卫"
x304000_var_MissionCompleted	=	"\t朝廷已经下令捉拿这些贼人了，不杀他们不足以平民愤。多谢你的搭救，这些受伤的士兵我们一定会妥善安置的。"	--完成任务npc说话的话
x304000_var_MissionUncompleted=	"\t速速动身，还在这里闲逛什么。"
x304000_var_ContinueInfo			=	""
x304000_var_MissionHelp 			=	"#W\t如果目前拥有的经验超过当前升级所需经验将不能接取此任务。" 
x304000_var_DemandItem 				=	{}
x304000_var_ExpBonus 					= 0
x304000_var_BonusMoney1 			=	0
x304000_var_BonusMoney2 			=	0
x304000_var_BonusMoney3 			=	0
x304000_var_BonusMoney4 			=	0
x304000_var_BonusMoney5 			=	0
x304000_var_BonusMoney6 			=	0
x304000_var_BonusMoney8 			=	0 --帮贡
x304000_var_BonusItem					=	{}
x304000_var_BonusChoiceItem 	=	{}
x304000_var_MissionCount			=	1		--每天任务限制
--x304000_var_NeedPhysicalForce = 6
--设置采集点特效
x304000_var_GroupPoint				=	{
															{type=10,id =939,target = "这个参数貌似没用"},
													
															}
--DECLARE_QUEST_INFO_STOP-- 
x304000_var_ScriptIdNext 			= -1
x304000_var_KillOgre 					= {
															{NpcType=21075, NpcID1="@npcsp_受伤的巡卫_125552", NpcID2="@npcsp_受伤的巡卫_125552", NpcID3="@npcsp_受伤的巡卫_125552", Country=0, TTL=5*1000, PatrolId=0, Name="受伤的巡卫"},
															{NpcType=21075, NpcID1="@npcsp_受伤的巡卫_125552", NpcID2="@npcsp_受伤的巡卫_125552", NpcID3="@npcsp_受伤的巡卫_125552", Country=1, TTL=5*1000, PatrolId=0, Name="受伤的巡卫"},
															{NpcType=21075, NpcID1="@npcsp_受伤的巡卫_125552", NpcID2="@npcsp_受伤的巡卫_125552", NpcID3="@npcsp_受伤的巡卫_125552", Country=2, TTL=5*1000, PatrolId=0, Name="受伤的巡卫"},
															{NpcType=21075, NpcID1="@npcsp_受伤的巡卫_125552", NpcID2="@npcsp_受伤的巡卫_125552", NpcID3="@npcsp_受伤的巡卫_125552", Country=3, TTL=5*1000, PatrolId=0, Name="受伤的巡卫"},

															}
x304000_var_ConfirmGather 		= 0
x304000_var_GatherSel 				= {}
x304000_var_GatherAreaIndex 	= {1,2,3,4,5,6,7}
x304000_var_GameId 						= 1053
x304000_var_MissionMdDay			=	MD_QUEST_BAOZANG_DAY2
x304000_var_MissionMdDayCount	=	MD_QUEST_BAOZANG_DAYCOUNT2

x304000_var_MapInfo						= {
																{Country = 0,MapId	= 51 },
																{Country = 1,MapId	= 151},
																{Country = 2,MapId	= 251},
																{Country = 3,MapId	= 351},

														}
x304000_BuffId = 8712														
														
x304000_var_ExpTable       ={
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

function x304000_ProcEnumEvent(varMap, varPlayer, NPCId, MissionId)
	if IsHaveQuest( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) ) <= 0 then
		return
	end
	if IsHaveQuest( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) ) <= 0 then
		local level = GetLevel( varMap, varPlayer )
		if level < x304000_var_LevelLess or level > x304000_var_LevelMax then
			return 
		end	
	end
	local state = GetQuestStateNM( varMap, varPlayer, NPCId, x304000_GetMissionId( varMap, varPlayer ) )
	TalkAppendButtonNM( varMap, varPlayer, NPCId, x304000_GetMissionId( varMap, varPlayer ), state, -1 )
end

function x304000_DispatchMissionInfo( varMap, varPlayer, NPCId )
	local ExpBonus = x304000_GetMissionExpBonus(varMap, varPlayer )
	if ExpBonus> 0 then
		AddQuestExpBonus(varMap, ExpBonus )
	end
	if x304000_GetSliverCardBonus(varMap, varPlayer ) > 0 then
		AddQuestMoneyBonus1(varMap, x304000_GetSliverCardBonus(varMap, varPlayer ) )
	end
	if x304000_var_BonusMoney2 > 0 then
		AddQuestMoneyBonus2(varMap, x304000_var_BonusMoney2 )
	end
	if x304000_var_BonusMoney3 > 0 then
		AddQuestMoneyBonus3(varMap, x304000_var_BonusMoney3 )
	end
	if x304000_var_BonusMoney4 > 0 then
		AddQuestMoneyBonus4(varMap, x304000_var_BonusMoney4 )
	end
	if x304000_var_BonusMoney5 > 0 then
		AddQuestMoneyBonus5(varMap, x304000_var_BonusMoney5 )
	end
	if x304000_var_BonusMoney6 > 0 then
		AddQuestMoneyBonus6(varMap, x304000_var_BonusMoney6 )
	end
	if x304000_GetBanggong(varMap,varPlayer) > 0 then
		AddQuestMoneyBonus8(varMap, x304000_GetBanggong(varMap,varPlayer) )
	end
	for i, item in x304000_var_BonusItem do
		AddQuestItemBonus(varMap, item.item, item.n)
	end
	for i, item in x304000_var_BonusChoiceItem do
		AddQuestRadioItemBonus(varMap, item.item, item.n)
	end
end
--**********************************

function x304000_ProcEventEntry(varMap, varPlayer, NPCId, MissionId)	--点击该任务后执行此脚本

--	if GetLevel(varMap, varPlayer) < x304000_var_LevelLess then
--		StartTalkTask(varMap);
--		TalkAppendString(varMap, "你等级过低，不能领取任务");
--		StopTalkTask();
--		DeliverTalkTips(varMap, varPlayer);
--		Msg2Player(varMap,varPlayer,"你等级过低，不能领取任务",8,2)
--		return
--	end
--
--	if GetLevel(varMap, varPlayer) > x304000_var_LevelMax then
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
	if IsHaveExp >= x304000_var_ExpTable[Selflevel] then 
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您的剩余经验超过了当前升级所需经验，请升级后再试");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您的剩余经验超过了当前升级所需经验，请升级后再试",8,2)	
		return
	end	

	if IsHaveQuest(varMap,varPlayer, x304000_GetMissionId( varMap, varPlayer )) > 0 then
		if x304000_CheckSubmit(varMap, varPlayer, NPCId) <= 0 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x304000_var_MissionName)
				TalkAppendString(varMap,x304000_var_MissionUncompleted)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, NPCId, x304000_var_ScriptId, x304000_GetMissionId( varMap, varPlayer ));
		else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x304000_var_MissionName)
				TalkAppendString(varMap,x304000_var_MissionCompleted)
				TalkAppendString(varMap," ")
--			if GetGuildID(varMap, varPlayer) >= 0 then
--				TalkAppendString( varMap,"#Y帮会奖励:#W\n帮会基金：100文\n帮会宝藏经验：10点")
--			end			
			x304000_DispatchMissionInfo( varMap, varPlayer, NPCId )
			StopTalkTask()
			DeliverTalkContinueNM(varMap, varPlayer, NPCId, x304000_var_ScriptId, x304000_GetMissionId( varMap, varPlayer ));
		end
	elseif x304000_ProcAcceptCheck(varMap, varPlayer, NPCId) > 0 then
		local CountryID = GetCountrySimpleData( varMap, varPlayer )
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x304000_var_MissionName)
			TalkAppendString(varMap,x304000_var_MissionInfo)
			TalkAppendString( varMap,"#Y任务目标：")

			local strTarget = "\t营救边塞受伤的巡卫。"

			TalkAppendString( varMap, strTarget )

			if x304000_var_MissionHelp ~= "" then
				local today = GetDayOfYear()
				local nCount =GetPlayerGameData( varMap, varPlayer, x304000_var_MissionMdDayCount[1], x304000_var_MissionMdDayCount[2], x304000_var_MissionMdDayCount[3])				
				TalkAppendString(varMap,"#G小提示:#W")
				TalkAppendString(varMap,format( x304000_var_MissionHelp, nCount ))
			end		
--			if GetGuildID(varMap, varPlayer) >= 0 then
--				TalkAppendString( varMap,"#Y帮会奖励:#W\n帮会基金：100文\n帮会宝藏经验：10点")
--			end	
			x304000_DispatchMissionInfo( varMap, varPlayer, NPCId )
		StopTalkTask()
		DeliverTalkInfoNM(varMap, varPlayer, NPCId, x304000_var_ScriptId, x304000_GetMissionId( varMap, varPlayer ));
	end
end
--**********************************

function x304000_ProcQuestLogRefresh( varMap, varPlayer, MissionId )
	local ExpBonus = x304000_GetMissionExpBonus(varMap, varPlayer )
	local misIndex = GetQuestIndexByID( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) )
--	local msg = "\n \n#Y帮会奖励:#W\n帮会基金：100文\n帮会宝藏经验：10点"
--		if GetGuildID(varMap, varPlayer) == -1 then
--				 msg = ""
--		end	
	local today = GetDayOfYear()
	local nCount =GetPlayerGameData( varMap, varPlayer, x304000_var_MissionMdDayCount[1], x304000_var_MissionMdDayCount[2], x304000_var_MissionMdDayCount[3])
	

	
	
	if x304000_CheckSubmit(varMap, varPlayer, -1) > 0 then
		local CountryID = GetCountrySimpleData( varMap, varPlayer )
		local strTarget = x304000_var_ExtTarget[CountryID+1].target
		SetQuestByIndex( varMap, varPlayer, misIndex, 5, 2 ) --完成任务
		SetQuestByIndex( varMap, varPlayer, misIndex, 7, 1 )
		StartTalkTask( varMap )
		AddQuestLogCustomText( varMap,
					"",                             -- 标题
					x304000_var_MissionName,          -- 任务名字
					strTarget,
					""..x304000_var_ExtTarget[CountryID+1].target,                       --任务NPC
					x304000_var_MissionTarget,
					x304000_var_MissionInfo,
					x304000_var_MissionHelp
					)
		StopTalkTask()
	else
		SetQuestByIndex( varMap, varPlayer, misIndex, 7, 0 )
		local CountryID = GetCountrySimpleData( varMap, varPlayer )
		local Idx = GetQuestParam( varMap, varPlayer, misIndex, 1 )
		local Type= GetQuestParam( varMap, varPlayer, misIndex, 2 )
		local strTarget = "  "
		if Type == 0 then
				if ( Idx == 0 ) then
					strTarget = strTarget.."营救"..x304000_var_KillOgre[CountryID+1].NpcID1.."（0/3）"
				elseif ( Idx == 1 ) then
					strTarget = strTarget.."营救"..x304000_var_KillOgre[CountryID+1].NpcID1.."（1/3）"
				elseif ( Idx == 2 ) then
					strTarget = strTarget.."营救"..x304000_var_KillOgre[CountryID+1].NpcID1.."（2/3）"
				elseif ( Idx == 3 ) then
					strTarget = strTarget.."#G营救"..x304000_var_KillOgre[CountryID+1].NpcID1.."（3/3）"
				end  
		elseif Type == 1 then
				if ( Idx == 0 ) then
					strTarget = strTarget.."营救"..x304000_var_KillOgre[CountryID+1].NpcID2.."（0/3）"
				elseif ( Idx == 1 ) then
					strTarget = strTarget.."营救"..x304000_var_KillOgre[CountryID+1].NpcID2.."（1/3）"
				elseif ( Idx == 2 ) then
					strTarget = strTarget.."营救"..x304000_var_KillOgre[CountryID+1].NpcID2.."（2/3）"
				elseif ( Idx == 3 ) then
					strTarget = strTarget.."#G营救"..x304000_var_KillOgre[CountryID+1].NpcID2.."（3/3）"
				end
		elseif Type == 2 then
				if ( Idx == 0 ) then
					strTarget = strTarget.."营救"..x304000_var_KillOgre[CountryID+1].NpcID3.."（0/3）"
				elseif ( Idx == 1 ) then
					strTarget = strTarget.."营救"..x304000_var_KillOgre[CountryID+1].NpcID3.."（1/3）"
				elseif ( Idx == 2 ) then
					strTarget = strTarget.."营救"..x304000_var_KillOgre[CountryID+1].NpcID3.."（2/3）"
				elseif ( Idx == 3 ) then
					strTarget = strTarget.."#G营救"..x304000_var_KillOgre[CountryID+1].NpcID3.."（3/3）"
				end
		end

		StartTalkTask( varMap )
		AddQuestLogCustomText( varMap,
					"",                             -- 标题
					x304000_var_MissionName,          -- 任务名字
					strTarget,
					""..x304000_var_ExtTarget[CountryID+1].target,                             --任务NPC
					x304000_var_MissionTarget,
					x304000_var_MissionInfo,
					x304000_var_MissionHelp
					)
		StopTalkTask()
	end
		if ExpBonus> 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
		if x304000_GetSliverCardBonus(varMap, varPlayer ) > 0 then
			AddQuestMoneyBonus1(varMap, x304000_GetSliverCardBonus(varMap, varPlayer ) )
		end
		if x304000_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x304000_var_BonusMoney2 )
		end
		if x304000_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x304000_var_BonusMoney3 )
		end
		if x304000_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x304000_var_BonusMoney4 )
		end
		if x304000_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x304000_var_BonusMoney5 )
		end
		if x304000_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x304000_var_BonusMoney6 )
		end
		if x304000_GetBanggong(varMap,varPlayer) > 0 then
			AddQuestMoneyBonus8(varMap, x304000_GetBanggong(varMap,varPlayer) )
		end
		DeliverTalkRefreshQuest( varMap, varPlayer, MissionId );
end

function x304000_ProcAcceptCheck(varMap, varPlayer, NPCId)

	if ( GetGameOpenById( x304000_var_GameId ) <= 0 ) then
		StartTalkTask(varMap)
			TalkAppendString( varMap, "此活动今天不开放" )
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	local Day = GetDayOfYear()
	local LastDay = GetPlayerGameData( varMap, varPlayer, x304000_var_MissionMdDay[1], x304000_var_MissionMdDay[2], x304000_var_MissionMdDay[3] )
	if ( Day == LastDay ) then
		local Count = GetPlayerGameData( varMap, varPlayer, x304000_var_MissionMdDayCount[1], x304000_var_MissionMdDayCount[2], x304000_var_MissionMdDayCount[3] )
		if  Count >= x304000_var_MissionCount  then
			StartTalkTask(varMap)
			TalkAppendString( varMap, "您今天已经完成过【练兵】营救巡卫任务，无法再次领取" )
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 0
		end
	end
	return 1
end

--**********************************
function x304000_CheckSubmit( varMap, varPlayer, NPCId )

	local misIndex = GetQuestIndexByID( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) )
	local Idx = GetQuestParam( varMap, varPlayer, misIndex, 1 )
	if ( Idx == 3) then
		return 1
	end
	return 0
end

--**********************************
function x304000_ProcQuestAccept( varMap, varPlayer, NPCId, MissionId )

	if GetLevel(varMap, varPlayer) < x304000_var_LevelLess then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过低，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过低，不能领取任务",8,2)
		return
	end

	if GetLevel(varMap, varPlayer) > x304000_var_LevelMax then
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
	if IsHaveExp >= x304000_var_ExpTable[Selflevel] then 
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
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

	--检查前置任务
	local FrontMissiontId1, FrontMissiontId2, FrontMissiontId3 = GetFrontQuestIdNM( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) )
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

	if x304000_ProcAcceptCheck(varMap, varPlayer, NPCId) > 0 then
		local Ret = AddQuest( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ), x304000_var_ScriptId, 1, 0, 1 )
		if ( Ret == 0 ) then
			Msg2Player( varMap, varPlayer, "接受任务失败！", 0, 3 )
			return 0
		else

			x304000_Msg2toplayer( varMap, varPlayer, 0 )
			local misIndex = GetQuestIndexByID( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) )

			SetQuestByIndex( varMap, varPlayer, misIndex, 1, 0 )
			level = GetLevel( varMap, varPlayer )
			if level >= x304000_var_MissionLevel1 and level < x304000_var_MissionLevel2 then
					SetQuestByIndex( varMap, varPlayer, misIndex, 2, 0 )
			elseif level >= x304000_var_MissionLevel2 and level < x304000_var_MissionLevel3 then
					SetQuestByIndex( varMap, varPlayer, misIndex, 2, 1 )
			elseif level >= x304000_var_MissionLevel3 then
					SetQuestByIndex( varMap, varPlayer, misIndex, 2, 2 )
			end
			SetQuestByIndex( varMap, varPlayer, misIndex, 3, 0 ) 
			SetQuestByIndex( varMap, varPlayer, misIndex, 4, 0 )
			SetQuestByIndex( varMap, varPlayer, misIndex, 5, 0 )
			SetQuestByIndex( varMap, varPlayer, misIndex, 7, 0 )

			if ( x304000_CheckSubmit( varMap, varPlayer, NPCId ) == 1 ) then
				SetQuestByIndex( varMap, varPlayer, misIndex, 5, 2 ) --完成任务
				SetQuestByIndex( varMap, varPlayer, misIndex, 7, 1 )
			end
		end
	end
end

--**********************************

function x304000_ProcQuestAbandon(varMap, varPlayer, MissionId)

	if IsHaveQuest( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) ) > 0 then
		local misIndex = GetQuestIndexByID( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) )

		local Idx = GetQuestParam( varMap, varPlayer, misIndex, 1 )

		if ( DelQuestNM( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) ) == 1 ) then
		local Day = GetDayOfYear()
		local nCount =GetPlayerGameData( varMap, varPlayer, x304000_var_MissionMdDayCount[1], x304000_var_MissionMdDayCount[2], x304000_var_MissionMdDayCount[3])
		SetPlayerGameData( varMap, varPlayer, x304000_var_MissionMdDay[1], x304000_var_MissionMdDay[2], x304000_var_MissionMdDay[3], Day )
		SetPlayerGameData( varMap, varPlayer, x304000_var_MissionMdDayCount[1], x304000_var_MissionMdDayCount[2], x304000_var_MissionMdDayCount[3], nCount+1 )
			local message = "您放弃了:"..x304000_var_MissionName
			StartTalkTask(varMap);
			TalkAppendString(varMap, message)
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			Msg2Player(varMap, varPlayer, message, 4, 2)
		end
	end
end

--**********************************
function x304000_CheckPlayerBagFull( varMap ,varPlayer,selectRadioId )
	
	local result = 1
	local j = 0
	local bAdd = 0 --是否已经在固定物品奖励添加检测中已经检查出包裹已满
	StartItemTask(varMap)
	for j, item in x304000_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
	end
	for j, item in x304000_var_BonusChoiceItem do
		if item.item == selectRadioId then
			ItemAppend( varMap, item.item, item.n )
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
function x304000_ProcQuestSubmit(varMap, varPlayer, NPCId, selectRadioId, MissionId)

	local misIndex = -1
	misIndex = GetQuestIndexByID( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) )
	local Idx1 = 0
	local Idx2 = 0
	local Idx3 = 0
	if IsHaveQuest(varMap,varPlayer, x304000_GetMissionId( varMap, varPlayer )) > 0 then
		misIndex = GetQuestIndexByID( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) )
		Idx1 = GetQuestParam( varMap, varPlayer, misIndex, 0 )
		Idx2 = GetQuestParam( varMap, varPlayer, misIndex, 1 )
		Idx3 = GetQuestParam( varMap, varPlayer, misIndex, 2 )
	end
	if IsHaveQuest(varMap,varPlayer, x304000_GetMissionId( varMap, varPlayer )) <= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有这个任务！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	elseif x304000_CheckSubmit( varMap, varPlayer, NPCId) <= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有达到完成条件！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	elseif x304000_CheckPlayerBagFull( varMap ,varPlayer,selectRadioId ) <= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"包裹已满！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	elseif DelQuest(varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer )) > 0 then
		local Day = GetDayOfYear()
		local nCount =GetPlayerGameData( varMap, varPlayer, x304000_var_MissionMdDayCount[1], x304000_var_MissionMdDayCount[2], x304000_var_MissionMdDayCount[3])
		SetPlayerGameData( varMap, varPlayer, x304000_var_MissionMdDay[1], x304000_var_MissionMdDay[2], x304000_var_MissionMdDay[3], Day )
		SetPlayerGameData( varMap, varPlayer, x304000_var_MissionMdDayCount[1], x304000_var_MissionMdDayCount[2], x304000_var_MissionMdDayCount[3], nCount+1 )
		x304000_Msg2toplayer( varMap, varPlayer,2)
		QuestCom(varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ))
		x304000_GetBonus( varMap, varPlayer,NPCId)
		StartItemTask(varMap)
			for i, item in x304000_var_BonusItem do
				ItemAppend( varMap, item.item, item.n )
			end
			for i, item in x304000_var_BonusChoiceItem do
			if item.item == selectRadioId then
				ItemAppend( varMap, item.item, item.n )
			end
		end
		StopItemTask(varMap,varPlayer)
	end
	LuaCallNoclosure( x304000_var_ScriptIdNext, "ProcEventEntry", varMap, varPlayer, NPCId, x304000_var_MissionIdNext )	
end

function x304000_GetBonus( varMap, varPlayer,NpcID)
	local ExpBonus = x304000_GetMissionExpBonus(varMap, varPlayer )
	if ExpBonus > 0 then
		AddExp(varMap, varPlayer, ExpBonus);
	end
	if x304000_GetSliverCardBonus(varMap, varPlayer ) > 0 then
		AddMoney( varMap, varPlayer, 1, x304000_GetSliverCardBonus(varMap, varPlayer ) )
	end
	if x304000_var_BonusMoney2 > 0 then
		AddMoney( varMap, varPlayer, 0, x304000_var_BonusMoney2 )
	end
	if x304000_var_BonusMoney3 > 0 then
		AddMoney( varMap, varPlayer, 3, x304000_var_BonusMoney3 )
	end
	if x304000_var_BonusMoney4 > 0 then
		local nRongYu = GetRongYu( varMap, varPlayer )
		nRongYu = nRongYu + x304000_var_BonusMoney4
		SetRongYu( varMap, varPlayer, nRongYu )
	end
	if x304000_var_BonusMoney5 > 0 then
		local nShengWang = GetShengWang( varMap, varPlayer )
		nShengWang = nShengWang + x304000_var_BonusMoney5
		SetShengWang( varMap, varPlayer, nShengWang )
	end
	if x304000_var_BonusMoney6 > 0 then
		AddHonor(varMap,varPlayer,x304000_var_BonusMoney6)
	end
	if x304000_GetBanggong(varMap,varPlayer) > 0 then
		AddGuildUserPoint(varMap,varPlayer,x304000_GetBanggong(varMap,varPlayer))
	end

end

function x304000_Msg2toplayer( varMap, varPlayer,type)
	local ExpBonus = x304000_GetMissionExpBonus(varMap, varPlayer )
	local CountryID = GetCountrySimpleData( varMap, varPlayer )
	Flag1 = 0 --判断玩家是否在帮会
	Flag2 = 0 --判断帮会资源
	if type == 0 then
		Msg2Player(varMap, varPlayer, "您接受了任务"..x304000_var_MissionName.."！", 0, 2)
		Msg2Player(varMap, varPlayer, "您接受了任务"..x304000_var_MissionName.."！", 0, 3)
	elseif type == 1 then
		Msg2Player(varMap, varPlayer, "您放弃了任务"..x304000_var_MissionName.."！", 0, 2)
		Msg2Player(varMap, varPlayer, "您放弃了任务"..x304000_var_MissionName.."！", 0, 3)
	elseif type == 2 then
		Msg2Player(varMap, varPlayer, "您完成了任务"..x304000_var_MissionName.."！", 0, 2)
		Msg2Player(varMap, varPlayer, "您完成了任务"..x304000_var_MissionName.."！", 0, 3)

		if x304000_GetSliverCardBonus(varMap, varPlayer ) > 0 then
        Msg2Player(varMap, varPlayer , format("获得#G银卡#{_MONEY%d}#cffcf00的奖励", x304000_GetSliverCardBonus(varMap, varPlayer )), 0, 2)
        Msg2Player(varMap, varPlayer , format("获得#G银卡#{_MONEY%d}#cffcf00的奖励", x304000_GetSliverCardBonus(varMap, varPlayer )), 0, 3)
		end
		if x304000_var_BonusMoney2 > 0 then
			Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x304000_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
		end
		if x304000_var_BonusMoney3 > 0 then
			Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x304000_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
		end
		if x304000_var_BonusMoney4 > 0 then
			Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x304000_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
		end
		if x304000_var_BonusMoney5 > 0 then
			Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x304000_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
		end
		if x304000_var_BonusMoney6 > 0 then
			Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x304000_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
		end
		if x304000_GetBanggong(varMap,varPlayer) > 0 then
			Msg2Player(varMap, varPlayer, "#cffcf00获得#G帮贡"..x304000_GetBanggong(varMap,varPlayer).."点#cffcf00的奖励", 0, 2)
		end
	end
end

function x304000_ProcQuestObjectKilled(varMap, varPlayer, objdataId, objId, MissionId)

end

function x304000_ProcAreaEntered(varMap, varPlayer, zoneId, MissionId )
	--return LuaCallNoclosure( MISSION_SCRIPT, "ProcAreaEntered",varMap, varPlayer, zoneId, MissionId )	
end

function x304000_ProcTiming(varMap, varPlayer, ScriptId, MissionId)
	LuaCallNoclosure( MISSION_SCRIPT, "ProcTiming",varMap, varPlayer, ScriptId, MissionId )
end

function x304000_ProcAreaLeaved(varMap, varPlayer, ScriptId, MissionId)
	--LuaCallNoclosure( MISSION_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, ScriptId, MissionId)
end

function x304000_ProcQuestItemChanged(varMap, varPlayer, itemdataId, MissionId)

	if IsHaveQuest( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) ) > 0 then
		local misIndex = GetQuestIndexByID( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) )
		local CountryID = GetCountrySimpleData( varMap, varPlayer )
		local Idx = GetQuestParam( varMap, varPlayer, misIndex, 1 )
		local Refresh = 0
		if ( Refresh == 1 ) then
			x304000_ProcQuestLogRefresh( varMap, varPlayer, x304000_GetMissionId( varMap, varPlayer ) )
		end
	end
	return 0
end

function x304000_ProcQuestAttach( varMap, varPlayer, npcId, npcGuid, misIndex, MissionId )
	LuaCallNoclosure( MISSION_SCRIPT, "ProcQuestAttach",varMap, varPlayer, npcId, npcGuid, misIndex, MissionId)
end

function x304000_MissionComplate( varMap, varPlayer, targetId, selectId, MissionId )
	return LuaCallNoclosure( MISSION_SCRIPT, "MissionComplate", varMap, varPlayer, targetId, selectId, MissionId  )
end

function x304000_PositionUseItem( varMap, varPlayer, BagIndex, impactId )
	return  LuaCallNoclosure( MISSION_SCRIPT, "PositionUseItem",varMap, varPlayer, BagIndex, impactId)
end

function x304000_OnOpenItemBox( varMap, varPlayer, targetId, gpType, needItemID )
	return LuaCallNoclosure( MISSION_SCRIPT, "OnOpenItemBox",varMap, varPlayer, targetId, gpType, needItemID)
end

function x304000_OnProcOver( varMap, varPlayer, targetId )
	LuaCallNoclosure( MISSION_SCRIPT, "OnProcOver",varMap, varPlayer, targetId)
end

function x304000_OpenCheck( varMap, varPlayer, targetId )
	LuaCallNoclosure( MISSION_SCRIPT, "OpenCheck", varMap, varPlayer, targetId )
end

function x304000_ClearConfirmGather( varMap )

	x304000_var_ConfirmGather = 0
end

-- 以下为采集部分
-- 采集点生成

function 	x304000_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x304000_var_GatherPointTypeId, varMap, 0, -1)
end



function x304000_ProcCreateBus( varMap, growPointType, x, y )
end



-- 采集打开前
function x304000_ProcGpOpen(varMap,varPlayer,targetId)
     
      if x304000_GetMapId(varMap,varPlayer)~=varMap then
	      Msg2Player( varMap, varPlayer, "你不能救助非本国的巡卫", 8, 3 )
	      return 1
      end
      
			if x304000_CheckSubmit( varMap, varPlayer, NPCId )>0 then
			
			      StartTalkTask(varMap)
						TalkAppendString( varMap, "#cffcf00已经完成任务" )
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varPlayer)
			
			return 1
			end



	-- 0 是开始采集
	for i ,item in x304000_var_MissionIdList do
		local Ret = x304000_CanGather( varMap, varPlayer, item.MissionId )
		if ( Ret == 0 ) then
			-- 表示有任务，且不满足采集条件，可以退出了，不用继续循环
			return 1
		elseif ( Ret == 1 ) then
			return 0
		end
	end

	-- 这里能走到，说明一个任务都没有
	Msg2Player( varMap, varPlayer, "你没有【练兵】营救巡卫任务。", 8, 3 )
	return 1
end

-- 采集回收
function x304000_ProcGpRecycle(varMap,varPlayer,targetId)

	for i ,item in x304000_var_MissionIdList do
		local Ret = x304000_GatherSucc( varMap, varPlayer, targetId, item.MissionId )
		if ( Ret == 1 or Ret == 0 ) then
			return 1
		end
	end
	-- 这里能走到，说明一个任务都没有
	Msg2Player( varMap, varPlayer, "你没有【练兵】营救巡卫任务，无法操作。", 8, 3 )
	return 0
end

function x304000_ProcGpProcOver(varMap,varPlayer,targetId)
	
end
function x304000_CanGather( varMap, varPlayer, taskId )
		
	local CountryID = GetCountrySimpleData( varMap, varPlayer )
	local taskId = 0
		
	taskId =x304000_var_MissionIdList[CountryID+1].MissionId



	if IsHaveQuest( varMap, varPlayer, taskId ) > 0 then
		local misIndex = GetQuestIndexByID( varMap, varPlayer, taskId )
		local Idx = GetQuestParam( varMap, varPlayer, misIndex, 0 )
		if ( Idx >= 3 ) then
			Msg2Player( varMap, varPlayer, "你已经完成任务。", 8, 3 )
			return 0
		end
		return 1
	end
	return -1
end

function x304000_GatherSucc( varMap, varPlayer, objId, taskId )
	if IsHaveQuest( varMap, varPlayer, taskId ) > 0 then
		local TempCountry = GetCurCountry( varMap, varPlayer ) + 1
		local misIndex = GetQuestIndexByID( varMap, varPlayer, taskId )
		local Idx = GetQuestParam( varMap, varPlayer, misIndex, 1 )
		local Type= GetQuestParam( varMap, varPlayer, misIndex, 2 )
		if ( Idx >= 3 ) then
			StartTalkTask(varMap)
				TalkAppendString( varMap, "#cffcf00已经完成任务" )
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 0
		end
		if Type == 0 then 
			Msg2Player( varMap, varPlayer, "营救受伤的巡卫完成", 0, 3 )
		elseif Type == 1 then
			Msg2Player( varMap, varPlayer, "营救受伤的巡卫完成", 0, 3 )
		elseif Type == 2 then
			Msg2Player( varMap, varPlayer, "营救受伤的巡卫完成", 0, 3 )
		end
		
		SetQuestByIndex( varMap, varPlayer, misIndex, 1, Idx+1 )
		local MissionId=x304000_GetMissionId( varMap, varPlayer )
  	x304000_ProcQuestLogRefresh( varMap, varPlayer, MissionId )
		x304000_NpcBack( varMap, varPlayer, objId, taskId )
		return 1
	end
	return -1
end

function x304000_GetMissionExpBonus(varMap, varPlayer )
	local varLevel = GetLevel(varMap, varPlayer)
	local awardexp = 0
	if x304000_var_ExpTable[varLevel] > 0 then
		awardexp = floor(x304000_var_ExpTable[varLevel]/6)
	end
	return awardexp
end

function x304000_GetMissionId( varMap, varPlayer )
	local TempCountry = GetCurCountry( varMap, varPlayer )
	for i ,item in x304000_var_MissionIdList do
		if item.Country == TempCountry then
			return item.MissionId
		end
	end
end
----------------------------------------------------------------------------------------------
--获取玩家阵营对应MapId
----------------------------------------------------------------------------------------------
function x304000_GetMapId(varMap, varPlayer)
		TempCountry = GetCurCountry(varMap, varPlayer)
		for i ,item in x304000_var_MapInfo do
				if TempCountry == item.Country then
						return item.MapId
				end
		end
end
----------------------------------------------------------------------------------------------
--获取地图对应阵营
----------------------------------------------------------------------------------------------
function x304000_GetMapCountry(varMap)
		for i ,item in x304000_var_MapInfo do
				if varMap == item.MapId then
						return item.Country
				end
		end
end
----------------------------------------------------------------------------------------------
--创建NPC
----------------------------------------------------------------------------------------------
function x304000_NpcBack( varMap, varPlayer, objId, taskId )
		local TempCountry = GetCurCountry( varMap, varPlayer )
		local PosX = GetPlayerWorldX( varMap, varPlayer )+1
		local PosZ = GetPlayerWorldZ( varMap, varPlayer )+1
	
		item = x304000_var_KillOgre[TempCountry+1]
		
		local varObj =CreateMonster( varMap, item.NpcType, PosX, PosZ, 1, -1, -1, -1, 12, item.TTL, 0, item.Name, "")
	  if varObj > 0 then
			SendSpecificImpactToUnit(varMap, varObj, varObj, varObj, x304000_BuffId, 0)
		end


end

function x304000_SetPatrol(varMap, varPlayer)
	for i, item in x304000_var_KillOgre do
			if GetMonsterDataID(varMap, varPlayer) == item.NpcType then
					SetPatrolId(varMap,varPlayer,item.PatrolId)
			end
  end
end

function x304000_GetBanggong(varMap,varPlayer)
	local level = GetLevel( varMap,varPlayer )
	local banggong = 0
		if GetGuildID(varMap, varPlayer) == -1 then
			 return 0
		end
		if level >=30 and level <40 then
				banggong = floor(600*4/60*1)
				
		elseif level >=40 and level <50 then
				banggong = floor(700*4/60*1)

		elseif level >=50 and level <60 then
				banggong = floor(800*4/60*1)

		elseif level >=60 and level <70 then
				banggong = floor(1000*4/60*1)
	
		elseif level >=70 and level <80 then
				banggong = floor(1500*4/60*1)

		elseif level >=80 and level <90 then
				banggong = floor(2000*4/60*1)

		elseif level >=90 then
				banggong = floor(2500*4/60*1)
		end     
	return 0
end
function x304000_GetSliverCardBonus(varMap, varPlayer )
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
	
	BonusSilver =4*4/60 * multi
	
	return 0
end
