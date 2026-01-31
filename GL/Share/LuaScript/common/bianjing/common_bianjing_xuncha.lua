--***********************
--Const
--***********************
-------------------------

--QuestHeadBegin

x304002_var_ScriptId 					= 	304002                  --脚本ID
x304002_var_MissionKind 			= 	1                       --任务类型
x304002_var_LevelLess					= 	100                     --场景开放等级  <=0 表示不限制
x304002_var_LevelMax					= 	109  

x304002_var_MissionName				= 	"【练兵】侦查敌情"
x304002_var_MissionTarget			= 	"\t协同边塞御卫仔细侦查境内敌情。"
x304002_var_MissionInfo				= 	"\t由于众多势力在边塞出没，令四国在边塞的友好关系难以维持。为了促进边塞各国和平相处，朝廷下发公文，敦促边塞各国加强巡逻，避免不必要的纷争。据探子来报，最近又有一些奸细妄图逃过我们的防线，与敌人里应外合，此事事关重大，作为王城的勇士，请你协同边塞御卫仔细侦查境内敌情。"
x304002_var_ContinueInfo			= 	""
x304002_var_MissionCompleted	= 	""
x304002_var_MissionHelp				=		"#W\t如果目前拥有的经验超过当前升级所需经验将不能接取此任务。"         --任务提示信息
x304002_var_MissionMsg1				=		"没有发现异常"
x304002_var_MissionMsg2				=		"发现可疑细作，将它除掉！"
x304002_var_MissionMsg3				=		"清除细作(0/1)"
x304002_var_MissionMsg4				=		"清除细作(1/1)"
x304002_var_MissionMdDay			=		MD_QUEST_BAOZANG_DAY1
x304002_var_MissionMdDayCount	=		MD_QUEST_BAOZANG_DAYCOUNT1
x304002_var_MissionCount			=		1		--每天任务限制
x304002_var_MissionLevel1			=		0
x304002_var_MissionLevel2 		=		160
x304002_var_MissionIdList 		= {                     --任务ID
																		{Country=0,MissionId=10608},
																		{Country=1,MissionId=10609},
																		{Country=2,MissionId=10610},
																		{Country=3,MissionId=10611},
															}
--目标

x304002_var_ExtTarget					=	{ {type=20,n=1,target="巡视边塞"}}
x304002_var_AreaInfo					=	{
																{Id = 1, ZoneId = 18,NpcId = 54023},     --ZoneId对应area.iniZoneId,NpcId为寻路NpcObj
																{Id = 2, ZoneId = 19,NpcId = 54024},
																{Id = 3, ZoneId = 20,NpcId = 54025},
																{Id = 4, ZoneId = 21,NpcId = 54026},
																{Id = 5, ZoneId = 22,NpcId = 54027},
																{Id = 6, ZoneId = 23,NpcId = 54028},
																{Id = 7, ZoneId = 24,NpcId = 54029},
																{Id = 8, ZoneId = 25,NpcId = 54030},
																{Id = 9, ZoneId = 26,NpcId = 54031},
																{Id = 10,ZoneId = 27,NpcId = 54032},  
																{Id = 11,ZoneId = 28,NpcId = 54033},  
																{Id = 12,ZoneId = 29,NpcId = 54034},
															}                   
x304002_var_MosterInfo				= {                 
																{Id=1, ZoneId=1, MonsterType=2622,ai=0,aiscript=-1,title="可疑细作",name="可疑细作",TTL=2*60*1000},
																{Id=2, ZoneId=2, MonsterType=2623,ai=0,aiscript=-1,title="可疑细作",name="可疑细作",TTL=2*60*1000},
																{Id=3, ZoneId=3, MonsterType=2624,ai=0,aiscript=-1,title="可疑细作",name="可疑细作",TTL=2*60*1000},
																{Id=4, ZoneId=4, MonsterType=2625,ai=0,aiscript=-1,title="可疑细作",name="可疑细作",TTL=2*60*1000},
																{Id=5, ZoneId=5, MonsterType=2626,ai=0,aiscript=-1,title="可疑细作",name="可疑细作",TTL=2*60*1000},
																{Id=6, ZoneId=6, MonsterType=2627,ai=0,aiscript=-1,title="可疑细作",name="可疑细作",TTL=2*60*1000},
																{Id=7, ZoneId=7, MonsterType=2628,ai=0,aiscript=-1,title="可疑细作",name="可疑细作",TTL=2*60*1000},
																{Id=8, ZoneId=8, MonsterType=2629,ai=0,aiscript=-1,title="可疑细作",name="可疑细作",TTL=2*60*1000},
																{Id=9, ZoneId=9, MonsterType=2630,ai=0,aiscript=-1,title="可疑细作",name="可疑细作",TTL=2*60*1000},
																{Id=10,ZoneId=10,MonsterType=2631,ai=0,aiscript=-1,title="可疑细作",name="可疑细作",TTL=2*60*1000},
																{Id=11,ZoneId=11,MonsterType=2632,ai=0,aiscript=-1,title="可疑细作",name="可疑细作",TTL=2*60*1000},
																{Id=12,ZoneId=12,MonsterType=2633,ai=0,aiscript=-1,title="可疑细作",name="可疑细作",TTL=2*60*1000},
														}
x304002_var_MapInfo						= {
																	{Country = 0,MapId	= 51 },
																	{Country = 1,MapId	= 151},
																	{Country = 2,MapId	= 251},
																	{Country = 3,MapId	= 351},
																}
--奖励

x304002_var_ExpBonus						= 0		--x304002_AddExpAward               	--奖励：经验
x304002_var_BonusMoney1 				= 0        	--银卡
x304002_var_BonusMoney2 				= 0        	--现银
x304002_var_BonusMoney3 				= 0        	--金卡
x304002_var_BonusMoney4 				= 0        	--朝廷声望
x304002_var_BonusMoney5 				= 0        	--声望
x304002_var_BonusMoney6 				= 0        	--荣誉
x304002_var_BonusMoney8 				= 0        	--帮贡
x304002_var_BonusChoiceItem 		=	{}
x304002_var_BonusItem						=	{							--奖励：帮会物品奖励
																}

--QuestHeadEnd

x304002_var_ReplyNpcId 			= {		
																{Country = 0,NpcId = 123838},
																{Country = 1,NpcId = 126138},
																{Country = 2,NpcId = 129740},
																{Country = 3,NpcId = 132164},
														}


x304002_var_ExpTable       ={
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


---------------------------------------------------------------------------------------------------
--SetQuestParam 1:Area1 2:Area2 3:Area3 4:Area4
---------------------------------------------------------------------------------------------------

function x304002_GetMissionId( varMap, varPlayer )
	local TempCountry = GetCurCountry( varMap, varPlayer )
	for i ,item in x304002_var_MissionIdList do
		if item.Country == TempCountry then
			return item.MissionId
		end
	end
end

function x304002_ProcEnumEvent( varMap, varPlayer, targetId)
	if IsHaveQuest( varMap, varPlayer, x304002_GetMissionId( varMap, varPlayer ) ) <= 0 then
		return
	end


	if IsHaveQuest( varMap, varPlayer, x304002_GetMissionId( varMap, varPlayer ) ) <= 0 then
		local level = GetLevel( varMap, varPlayer )
		if level < x304002_var_LevelLess or level > x304002_var_LevelMax then
			return 
		end	
	end
	local myMissionId = x304002_GetMissionId( varMap, varPlayer )	

		local state = GetQuestStateNM(varMap, varPlayer, targetId, myMissionId)
		TalkAppendButton(varMap, myMissionId, x304002_var_MissionName,state,1)

	
end


---------------------------------------------------------------------------------------------------
--向客户端发送任务未完成
---------------------------------------------------------------------------------------------------
function x304002_ProcEventEntry( varMap, varPlayer, targetId, MissionId, nExt )

--	if GetLevel(varMap, varPlayer) < x304002_var_LevelLess then
--		StartTalkTask(varMap);
--		TalkAppendString(varMap, "你等级过低，不能领取任务");
--		StopTalkTask();
--		DeliverTalkTips(varMap, varPlayer);
--		Msg2Player(varMap,varPlayer,"你等级过低，不能领取任务",8,2)
--		return
--	end
--
--	if GetLevel(varMap, varPlayer) > x304002_var_LevelMax then
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
	if IsHaveExp >= x304002_var_ExpTable[Selflevel] then 
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您的剩余经验超过了当前升级所需经验，请升级后再试");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您的剩余经验超过了当前升级所需经验，请升级后再试",8,2)	
		return
	end	

	local Day = GetDayOfYear()
	local Date = GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDay[1], x304002_var_MissionMdDay[2], x304002_var_MissionMdDay[3] )
	if ( Day == Date ) then
		local DayCnt = GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[1], x304002_var_MissionMdDayCount[2], x304002_var_MissionMdDayCount[3] )
		if  DayCnt >= x304002_var_MissionCount  then
			StartTalkTask(varMap)
			TalkAppendString( varMap, "您今天已经完成过【练兵】侦查敌情，无法再次领取" )
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 0
		end
	end  

	local myMissionId = x304002_GetMissionId( varMap, varPlayer )	
	
--	if IsHaveQuestNM( varMap, varPlayer, myMissionId )>0 then
--		if nExt==30 then
--			x304002_GiveQuestion(varMap, varPlayer, targetId, MissionId,2)
--			return
--		end
--	end	
--	
--	if nExt>10 then --跟npc对话时
--		if nExt>=20 then
--			return
--		end
--		local iIndex = nExt-10
--		if IsHaveQuestNM( varMap, varPlayer, myMissionId ) == 0 then
--			return
--		end
--		x304002_DispatchNpcTalkInfo( varMap, varPlayer, targetId,myMissionId,iIndex )	
--	else	
		if IsHaveQuestNM( varMap, varPlayer, myMissionId ) == 0 then
			x304002_DispatchMissionInfo( varMap, varPlayer, targetId, myMissionId, 0 )
		else
			local misIndex = GetQuestIndexByID( varMap, varPlayer, myMissionId )
			if GetQuestParam( varMap, varPlayer, misIndex, 7 )==1 then -- 任务完成
				x304002_DispatchCompletedInfo( varMap, varPlayer, targetId,myMissionId )				
			else				
				x304002_DispatchContinueInfo( varMap, varPlayer, targetId,myMissionId )				
			end
		end
--	end
	    	
end


function x304002_ProcAcceptCheck(varMap, varPlayer, targetId, MissionId )
	
	if  IsHaveQuestNM( varMap, varPlayer, x304002_GetMissionId( varMap, varPlayer )) == 0 then		
		return 0;
	end
	return 1;
end

function x304002_ProcTiming( varMap,uTime )

end

function x304002_CheckRequest(varMap, varPlayer)

	local myMissionId = x304002_GetMissionId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x304002_var_LevelLess then
		x304002_ShowTips(varMap, varPlayer, "你等级不足")
		return 0
	end
	
	if GetLevel(varMap, varPlayer) > x304002_var_LevelMax then
		x304002_ShowTips(varMap, varPlayer, "你等级过高")
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, myMissionId ) > 0 then
		x304002_ShowTips(varMap, varPlayer, "你已经有这个任务，请先完成这个任务")
		return 0;
	end
	local Day = GetDayOfYear()
	local Date = GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDay[1], x304002_var_MissionMdDay[2], x304002_var_MissionMdDay[3] )
	if ( Day == Date ) then
		local DayCnt = GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[1], x304002_var_MissionMdDayCount[2], x304002_var_MissionMdDayCount[3] )
		if  DayCnt >= x304002_var_MissionCount  then
			StartTalkTask(varMap)
			TalkAppendString( varMap, "您今天已经完成过【练兵】侦查敌情，无法再次领取" )
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 0
		end
	end
	return 1;

end

function x304002_ProcQuestAccept(varMap, varPlayer, targetId, MissionId)

	if GetLevel(varMap, varPlayer) < x304002_var_LevelLess then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级过低，不能领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"你等级过低，不能领取任务",8,2)
		return
	end

	if GetLevel(varMap, varPlayer) > x304002_var_LevelMax then
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
	if IsHaveExp >= x304002_var_ExpTable[Selflevel] then 
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您的剩余经验超过了当前升级所需经验，无法领取任务");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您的剩余经验超过了当前升级所需经验，无法领取任务",8,2)	
		return
	end	

	if x304002_CheckRequest(varMap, varPlayer)<=0 then		
		return 0;
	end
	local myMissionId = x304002_GetMissionId( varMap, varPlayer )

	--------------------------- add for Mission full check --------------
	local bFullMission = IsQuestFullNM(varMap,varPlayer)
	
	if bFullMission>0 then
		x304002_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
		return 0
	end
	---------------------------- add end -------------------------------

	--检查前置任务
	local FrontMissiontId1, FrontMissiontId2, FrontMissiontId3 = GetFrontQuestIdNM( varMap, varPlayer,myMissionId  )
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
	local ret = AddQuest( varMap, varPlayer, myMissionId, x304002_var_ScriptId, 1,0,0)-- 给玩家添加任务		
	if ret > 0 then
		local str = "您接受了任务："..x304002_var_MissionName
		x304002_ShowTips(varMap, varPlayer, str)
		Msg2Player(varMap,varPlayer,str,8,2)		
		local myMissionId = x304002_GetMissionId( varMap, varPlayer )
		local misIndex = GetQuestIndexByID( varMap, varPlayer, myMissionId )
		SetQuestByIndex( varMap, varPlayer, misIndex, 5, 0 )
    x304002_RandomArea(varMap, varPlayer, misIndex)
		GamePlayScriptLog(varMap, varPlayer, 911)
		return 1
	else		
		x304002_ShowTips(varMap, varPlayer, "接受任务错误")	
	end

end

--function x304002_GiveQuestion(varMap, varPlayer, targetId, MissionId, nExt)
--	

--	local myMissionId = x304002_GetMissionId( varMap, varPlayer )
--
--	local misIndex = GetQuestIndexByID( varMap, varPlayer, myMissionId )
--	SetQuestByIndex( varMap, varPlayer, misIndex, 7, 0 )
--	SetQuestByIndex( varMap, varPlayer, misIndex, 5, 1 )  --还没有答题
--	SetQuestByIndex( varMap, varPlayer, misIndex, 0, 0 )
--	SetQuestByIndex( varMap, varPlayer, misIndex, 1, 0 )
--	SetQuestByIndex( varMap, varPlayer, misIndex, 2, 0 )
--	SetQuestByIndex( varMap, varPlayer, misIndex, 3, 0 )
--	SetQuestByIndex( varMap, varPlayer, misIndex, 4, 0 )
--
--	x304002_ShowQuestion( varMap, varPlayer, targetId,MissionId )
--
--	x304002_QuestLogRefresh( varMap, varPlayer, myMissionId );
--end

function x304002_ShowTips(varMap, varPlayer, str)
	StartTalkTask(varMap)
		TalkAppendString(varMap,str)
	StopTalkTask()
	DeliverTalkTips(varMap, varPlayer)
end

function x304002_AddTips(varMap, varPlayer, str)
	StartTalkTask(varMap)
		TalkAppendString(varMap,str)
	StopTalkTask(varMap)
	DeliverTalkMenu( varMap, varPlayer, varPlayer)
end	
		
function x304002_ProcQuestAbandon( varMap, varPlayer, MissionId )

	local myMissionId = x304002_GetMissionId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, myMissionId ) <= 0 then	-- 如果没有这个任务直接退出
		return 0
	end

	local ret = DelQuest( varMap, varPlayer, myMissionId )

	if ret>0 then
		local today = GetDayOfYear()
    if GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDay[ 1], x304002_var_MissionMdDay[ 2], x304002_var_MissionMdDay[ 3] ) == today then
        local count = GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[ 1], x304002_var_MissionMdDayCount[ 2], x304002_var_MissionMdDayCount[ 3] )
        if count <=x304002_var_MissionCount then
            SetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[ 1], x304002_var_MissionMdDayCount[ 2], x304002_var_MissionMdDayCount[ 3], count+1)
 				end
    else
        SetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDay[ 1], x304002_var_MissionMdDay[ 2], x304002_var_MissionMdDay[ 3], today )
        SetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[ 1], x304002_var_MissionMdDayCount[ 2], x304002_var_MissionMdDayCount[ 3], 1)
    end   	 	

		local str = "您放弃了任务："..x304002_var_MissionName;
	    x304002_ShowTips(varMap, varPlayer, str)
		Msg2Player(varMap,varPlayer,str,8,2)

	else
		x304002_ShowTips(varMap, varPlayer, "放弃任务失败")
	end
	
end



function x304002_ProcQuestSubmit( varMap, varPlayer, targetId, selectId, MissionId )

	
	local myMissionId = x304002_GetMissionId( varMap, varPlayer )	
	if x304002_CheckSubmit(varMap, varPlayer )>0 then
		if x304002_CheckPlayerBagFull == 0 then
				StartTalkTask(varMap)
        TalkAppendString(varMap,"包裹已满！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return
    end
		local ret = DelQuest( varMap, varPlayer, myMissionId )           
		local today = GetDayOfYear()
    if GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDay[ 1], x304002_var_MissionMdDay[ 2], x304002_var_MissionMdDay[ 3] ) == today then
        local count = GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[ 1], x304002_var_MissionMdDayCount[ 2], x304002_var_MissionMdDayCount[ 3] )
        if count <=x304002_var_MissionCount then
            SetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[ 1], x304002_var_MissionMdDayCount[ 2], x304002_var_MissionMdDayCount[ 3], count+1)
 				end
    else
        SetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDay[ 1], x304002_var_MissionMdDay[ 2], x304002_var_MissionMdDay[ 3], today )
        SetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[ 1], x304002_var_MissionMdDayCount[ 2], x304002_var_MissionMdDayCount[ 3], 1)
    end   	 	
			local ncount = GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[ 1], x304002_var_MissionMdDayCount[ 2], x304002_var_MissionMdDayCount[ 3] )
		--	local str = format("您今天已经完成过%d次任务："..x304002_var_MissionName,ncount)
		--	x304002_ShowTips(varMap, varPlayer, str)
		--	Msg2Player(varMap,varPlayer,str,8,2)
			x304002_GiveReward(varMap,varPlayer,nRet, nRet2,selectId)
			GamePlayScriptLog(varMap, varPlayer, 912)			
		else
			x304002_ShowTips(varMap, varPlayer, "交任务失败")
		end
end

function x304002_GiveRewardTest(varMap,varPlayer)

end

function x304002_GiveReward(varMap,varPlayer, nExt, nExt2, selectRadioId)


		local today = GetDayOfYear()
		local exp =x304002_GetExpBonus(varMap,varPlayer)
    if GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDay[ 1], x304002_var_MissionMdDay[ 2], x304002_var_MissionMdDay[ 3] ) == today then
        local count = GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[ 1], x304002_var_MissionMdDayCount[ 2], x304002_var_MissionMdDayCount[ 3] )
    end
    AddExp( varMap, varPlayer, exp )
  	local nstr = format("获得#G%d点#cffcf00经验值的奖励",exp)
		Msg2Player(varMap,varPlayer,nstr,8,2)
		if x304002_GetSliverCardBonus(varMap, varPlayer ) > 0 then
        AddMoney( varMap, varPlayer, 1, x304002_GetSliverCardBonus(varMap, varPlayer ) )
        Msg2Player(varMap, varPlayer , format("获得#G银卡#{_MONEY%d}#cffcf00的奖励", x304002_GetSliverCardBonus(varMap, varPlayer )), 0, 2)
        Msg2Player(varMap, varPlayer , format("获得#G银卡#{_MONEY%d}#cffcf00的奖励", x304002_GetSliverCardBonus(varMap, varPlayer )), 0, 3)
    end
    if x304002_var_BonusMoney2 > 0 then
        AddMoney( varMap, varPlayer, 0, x304002_var_BonusMoney2 )
        Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x304002_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
    end
    if x304002_var_BonusMoney3 > 0 then
        AddMoney( varMap, varPlayer, 3, x304002_var_BonusMoney3 )
        Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x304002_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
    end
    if x304002_var_BonusMoney4 > 0 then
    local nRongYu = GetRongYu( varMap, varPlayer )
    	nRongYu = nRongYu + x304002_var_BonusMoney4
    	SetRongYu( varMap, varPlayer, nRongYu )
    	Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x304002_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
    end
    if x304002_var_BonusMoney5 > 0 then
    	local nShengWang = GetShengWang( varMap, varPlayer )
    	nShengWang = nShengWang + x304002_var_BonusMoney5
    	SetShengWang( varMap, varPlayer, nShengWang )
    	Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x304002_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
    end
    if x304002_var_BonusMoney6 > 0 then
    	AddHonor(varMap,varPlayer,x304002_var_BonusMoney6)
    	Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x304002_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
    end
    if x304002_GetBanggong(varMap,varPlayer) > 0 then
    	AddGuildUserPoint(varMap,varPlayer,x304002_GetBanggong(varMap,varPlayer))
    	Msg2Player(varMap, varPlayer, "#cffcf00获得#G帮贡"..x304002_GetBanggong(varMap,varPlayer).."#cffcf00的奖励", 0, 2)
    end
		local bHasItem = 0
    StartItemTask(varMap)
    if x304002_CheckReward(varMap, varPlayer) == 1 then
    		for i, item in x304002_var_BonusItem do
    				ItemAppend( varMap, item.item, item.n )
    				bHasItem = 1
    		end
    end
    StopItemTask(varMap,varPlayer)
    if bHasItem == 1 then
        ItemAppendListToPlayer(varMap,varPlayer)
    end
-- 	if GetGuildID(varMap,varPlayer) >= 0 then
--			AddGuildMoney( varMap,varPlayer, 100)
--			StartTalkTask(varMap);
--			TalkAppendString(varMap, "#o帮会基金增加100文");
--			StopTalkTask();
--			DeliverTalkTips(varMap,varPlayer);
--			Msg2Player(varMap,varPlayer,"#o帮会基金增加100文",4,2)
--			AddSubExpToGuild( varMap,varPlayer,4,10 )
--			StartTalkTask(varMap);
--			TalkAppendString(varMap, "#o帮会边塞经验增加10点");
--			StopTalkTask();
--			DeliverTalkTips(varMap,varPlayer);
--			Msg2Player(varMap,varPlayer,"#o帮会边塞经验增加10点",4,2)
--	else 
--	  Msg2Player(varMap, varPlayer, "由于没有加入帮会，无法获得其他丰厚奖励", 0, 2)
--		Msg2Player(varMap, varPlayer, "由于没有加入帮会，无法获得其他丰厚奖励", 0, 3)
--	end
end

function x304002_CheckSubmit(varMap, varPlayer )


	local myMissionId = x304002_GetMissionId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, myMissionId ) <= 0 then	-- 如果没有这个任务直接退出
		return 0
	end

	local misIndex = GetQuestIndexByID( varMap, varPlayer, myMissionId )
	local bCompleted = GetQuestParam( varMap, varPlayer, misIndex, 7 )
	if (bCompleted)<=0 then
		return 0
	end

	return 1;
end

-------------------------------------------------------------------------------
function x304002_CheckPlayerBagFull( varMap ,varPlayer )
	
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	if x304002_CheckReward(varMap, varPlayer) == 1 then
			for j, item in x304002_var_BonusItem do
				ItemAppend( varMap, item.item, item.n )
  		end
  end
  local ret = EndItemAppend(varMap,varPlayer)
  if ret <= 0 then
      if result == 1 then
          result = 0
      end
  end
	return result
end    


---------------------------------------------------------------------------------------------------
--向客户端发送任务信息
---------------------------------------------------------------------------------------------------
function x304002_DispatchMissionInfo( varMap, varPlayer, NPCId, MissionId, nExt )
	
	StartTalkTask(varMap)

	TalkAppendString(varMap,"#Y"..x304002_var_MissionName)
	TalkAppendString(varMap,x304002_var_MissionInfo)
	TalkAppendString( varMap,"#Y任务目标:")	
	TalkAppendString( varMap,x304002_var_MissionTarget)
	TalkAppendString(varMap," ")

	local level = GetLevel(varMap, varPlayer)		
	local today = GetDayOfYear()
  if GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDay[ 1], x304002_var_MissionMdDay[ 2], x304002_var_MissionMdDay[ 3] ) == today then
     local count = GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[ 1], x304002_var_MissionMdDayCount[ 2], x304002_var_MissionMdDayCount[ 3] )
     AddQuestExpBonus(varMap, x304002_GetExpBonus(varMap,varPlayer) )	      
  else
     AddQuestExpBonus(varMap, x304002_GetExpBonus(varMap,varPlayer) )
  end
  if x304002_GetSliverCardBonus(varMap, varPlayer ) > 0 then
		AddQuestMoneyBonus1(varMap, x304002_GetSliverCardBonus(varMap, varPlayer ) )
	end
	if x304002_var_BonusMoney2 > 0 then
		AddQuestMoneyBonus2(varMap, x304002_var_BonusMoney2 )
	end
	if x304002_var_BonusMoney3 > 0 then
		AddQuestMoneyBonus3(varMap, x304002_var_BonusMoney3 )
	end
	if x304002_var_BonusMoney4 > 0 then
		AddQuestMoneyBonus4(varMap, x304002_var_BonusMoney4 )
	end
	if x304002_var_BonusMoney5 > 0 then
		AddQuestMoneyBonus5(varMap, x304002_var_BonusMoney5 )
	end
	if x304002_var_BonusMoney6 > 0 then
		AddQuestMoneyBonus6(varMap, x304002_var_BonusMoney6 )
	end
	if x304002_GetBanggong(varMap,varPlayer) > 0 then
		AddQuestMoneyBonus8(varMap, x304002_GetBanggong(varMap,varPlayer) )
	end
	if x304002_CheckReward(varMap, varPlayer) == 1 then
  	for i, item in x304002_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
  	end
 	end
	for i, item in x304002_var_BonusChoiceItem do
    	AddQuestRadioItemBonus(varMap, item.item, item.n)
  end  
	if x304002_var_MissionHelp ~= "" then
			local today = GetDayOfYear()
			local nCount =GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[1], x304002_var_MissionMdDayCount[2], x304002_var_MissionMdDayCount[3])
			local str =format( x304002_var_MissionHelp, nCount)
			if GetPlayerGameData(varMap, varPlayer, x304002_var_MissionMdDay[1], x304002_var_MissionMdDay[2],x304002_var_MissionMdDay[3] ) == today then
					str =format( x304002_var_MissionHelp, nCount)	
			else
					str =format( x304002_var_MissionHelp, nCount)
			end					
			TalkAppendString(varMap,"#G小提示:#W")
			TalkAppendString(varMap,str )
--			if GetGuildID(varMap, varPlayer) >= 0 then
--				TalkAppendString( varMap,"#Y帮会奖励:#W\n帮会基金：100文\n帮会边塞经验：10点")
--			end	
	end	
	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, NPCId, x304002_var_ScriptId, MissionId,0);
end


---------------------------------------------------------------------------------------------------
--向客户端发送任务未完成
---------------------------------------------------------------------------------------------------
function x304002_DispatchContinueInfo( varMap, varPlayer, NPCId,MissionId )

	local myMissionId = x304002_GetMissionId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, myMissionId ) <= 0 then	-- 如果没有这个任务直接退出
		return 0
	end
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x304002_var_MissionName)
		TalkAppendString(varMap,"你还没有出发么？")		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, NPCId, x304002_var_ScriptId, MissionId,0);

end

---------------------------------------------------------------------------------------------------
--向客户端发送任务完成信息
---------------------------------------------------------------------------------------------------
function x304002_DispatchCompletedInfo( varMap, varPlayer, NPCId,MissionId )
	local myMissionId = x304002_GetMissionId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, myMissionId ) <= 0 then	-- 如果没有这个任务直接退出
		return 0
	end

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x304002_var_MissionName)
		TalkAppendString(varMap,"\t#Y@myname#W，做得不错，边塞安宁才能使国土得以巩固，大元王朝才能不被动摇。")
		TalkAppendString(varMap," ")
--			if GetGuildID(varMap, varPlayer) >= 0 then
--				TalkAppendString( varMap,"#Y帮会奖励:#W\n帮会基金：100文\n帮会边塞经验：10点")
--			end		
		local level = GetLevel(varMap, varPlayer)
		local today = GetDayOfYear()
    if GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDay[ 1], x304002_var_MissionMdDay[ 2], x304002_var_MissionMdDay[ 3] ) == today then
        local count = GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[ 1], x304002_var_MissionMdDayCount[ 2], x304002_var_MissionMdDayCount[ 3] )
        AddQuestExpBonus(varMap, x304002_GetExpBonus(varMap,varPlayer) )	        
    else
       	AddQuestExpBonus(varMap, x304002_GetExpBonus(varMap,varPlayer) )
    end
    if x304002_GetSliverCardBonus(varMap, varPlayer ) > 0 then
			AddQuestMoneyBonus1(varMap, x304002_GetSliverCardBonus(varMap, varPlayer ) )
		end
		if x304002_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x304002_var_BonusMoney2 )
		end
		if x304002_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x304002_var_BonusMoney3 )
		end
		if x304002_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x304002_var_BonusMoney4 )
		end
		if x304002_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x304002_var_BonusMoney5 )
		end
		if x304002_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x304002_var_BonusMoney6 )
		end
		if x304002_GetBanggong(varMap,varPlayer) > 0 then
			AddQuestMoneyBonus8(varMap, x304002_GetBanggong(varMap,varPlayer) )
		end
		if x304002_CheckReward(varMap, varPlayer) == 1 then
  		for i, item in x304002_var_BonusItem do
			   	AddQuestItemBonus(varMap, item.item, item.n)
  		end
  	end
		for i, item in x304002_var_BonusChoiceItem do
  	  	AddQuestRadioItemBonus(varMap, item.item, item.n)
  	end  
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, NPCId, x304002_var_ScriptId, MissionId)

end


---------------------------------------------------------------------------------------------------
--向客户端发送题目
---------------------------------------------------------------------------------------------------
function x304002_ShowQuestion( varMap, varPlayer, NPCId,MissionId )
	
	local myMissionId = x304002_GetMissionId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, myMissionId ) <= 0 then	-- 如果没有这个任务直接退出
		return 0
	end
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x304002_var_MissionName)
		TalkAppendString(varMap,"\t这可气死我了，这些孩子们，还在佛山内贪玩，眼看这饭都快凉了，你快帮我把他们叫回来吃饭吧。")
	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, NPCId, x304002_var_ScriptId, MissionId,0);

end

function x304002_DispatchNpcTalkInfo( varMap, varPlayer, NPCId,MissionId,iIndex )
	local myMissionId = x304002_GetMissionId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, myMissionId ) <= 0 then	-- 如果没有这个任务直接退出
		return 0
	end
	
	local misIndex = GetQuestIndexByID( varMap, varPlayer, myMissionId )	
	local zone1,value1 = GetQuestParam( varMap, varPlayer, misIndex, 1 )
	local zone2,value2 = GetQuestParam( varMap, varPlayer, misIndex, 2 )
	local zone3,value3 = GetQuestParam( varMap, varPlayer, misIndex, 3 )
	local zone4,value4 = GetQuestParam( varMap, varPlayer, misIndex, 4 )
	if value1*value2*value3*value4>0 then
		SetQuestByIndex( varMap, varPlayer, misIndex, 5, 2 ) --完成任务
		SetQuestByIndex( varMap, varPlayer, misIndex, 7, 1 )
	end
	x304002_QuestLogRefresh( varMap, varPlayer, myMissionId );
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x304002_var_MissionName)
	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, NPCId, x304002_var_ScriptId, myMissionId,0);

end

---------------------------------------------------------------------------------------------------
--任务日志刷新
---------------------------------------------------------------------------------------------------
function x304002_QuestLogRefresh( varMap, varPlayer, MissionId)
--	local msg = "\n \n#Y帮会奖励:#W\n帮会基金：100文\n帮会边塞经验：10点"
--		if GetGuildID(varMap, varPlayer) == -1 then
--				 msg = ""
--		end	
	StartTalkTask(varMap)	
	AddQuestLogCustomText( varMap,
							"",						-- 标题
							x304002_GetMissionName(varMap,varPlayer),        	-- 任务名字
							x304002_GetMissionTask(varMap,varPlayer),					--任务目标
							"@npc_"..x304002_GetReplyNpcId(varMap,varPlayer),			--任务NPC
							x304002_GetMissionMethod(varMap,varPlayer),           --任务攻略
							x304002_GetMissionText(varMap,varPlayer),					--任务描述
							x304002_GetMissionHelp(varMap,varPlayer)					--任务小提示
							)
	local level = GetLevel(varMap, varPlayer)
	local today = GetDayOfYear()
    if GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDay[ 1], x304002_var_MissionMdDay[ 2], x304002_var_MissionMdDay[ 3] ) == today then
        local count = GetPlayerGameData( varMap, varPlayer, x304002_var_MissionMdDayCount[ 1], x304002_var_MissionMdDayCount[ 2], x304002_var_MissionMdDayCount[ 3] )
        AddQuestExpBonus(varMap, x304002_GetExpBonus(varMap,varPlayer) )	       
    else
       	AddQuestExpBonus(varMap, x304002_GetExpBonus(varMap,varPlayer) )
    end  
	if x304002_GetSliverCardBonus(varMap, varPlayer ) > 0 then
		AddQuestMoneyBonus1(varMap, x304002_GetSliverCardBonus(varMap, varPlayer ) )
	end
	if x304002_var_BonusMoney2 > 0 then
		AddQuestMoneyBonus2(varMap, x304002_var_BonusMoney2 )
	end
	if x304002_var_BonusMoney3 > 0 then
		AddQuestMoneyBonus3(varMap, x304002_var_BonusMoney3 )
	end
	if x304002_var_BonusMoney4 > 0 then
		AddQuestMoneyBonus4(varMap, x304002_var_BonusMoney4 )
	end
	if x304002_var_BonusMoney5 > 0 then
		AddQuestMoneyBonus5(varMap, x304002_var_BonusMoney5 )
	end
	if x304002_var_BonusMoney6 > 0 then
		AddQuestMoneyBonus6(varMap, x304002_var_BonusMoney6 )
	end
	if x304002_GetBanggong(varMap,varPlayer) > 0 then
		AddQuestMoneyBonus8(varMap, x304002_GetBanggong(varMap,varPlayer) )
	end
	if x304002_CheckReward(varMap, varPlayer) == 1 then
  	for i, item in x304002_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
  	end
 	end
	for i, item in x304002_var_BonusChoiceItem do
    	AddQuestRadioItemBonus(varMap, item.item, item.n)
  end
  StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, MissionId)
end

function x304002_GetMissionName(varMap,varPlayer)
	return x304002_var_MissionName;
end

function x304002_GetMissionTask(varMap,varPlayer)
	local myMissionId = x304002_GetMissionId( varMap, varPlayer )
	local misIndex = GetQuestIndexByID( varMap, varPlayer, myMissionId )
	local nStep = GetQuestParam( varMap, varPlayer, misIndex, 7 )
	
	if nStep==1 then		
		return  "  任务完成，回报@npc_"..x304002_GetReplyNpcId(varMap,varPlayer)
	end
	
	local zone1 = GetQuestParam( varMap, varPlayer, misIndex, 0 )
	local zone2 = GetQuestParam( varMap, varPlayer, misIndex, 1 )
	local zone3 = GetQuestParam( varMap, varPlayer, misIndex, 2 )
	local zone4 = GetQuestParam( varMap, varPlayer, misIndex, 3 )
	local zone5 = GetQuestParam( varMap, varPlayer, misIndex, 4 )
	local zone2,value2 = x304002_GetAreaId(varMap, varPlayer ,zone2)
	local zone3,value3 = x304002_GetAreaId(varMap, varPlayer ,zone3)
	local zone4,value4 = x304002_GetAreaId(varMap, varPlayer ,zone4)
	local zone5,value5 = x304002_GetAreaId(varMap, varPlayer ,zone5)
	TempCountry = GetCurCountry(varMap, varPlayer)*100
	local strTable = "  ";
	local str1 = strTable.."到@npc_"..x304002_var_AreaInfo[zone2].NpcId.."巡查"..format("(%d/1)",value2)
	local str2 = "\n"..strTable.."到@npc_"..x304002_var_AreaInfo[zone3].NpcId.."巡查"..format("(%d/1)",value3)
	local str3 = "\n"..strTable.."到@npc_"..x304002_var_AreaInfo[zone4].NpcId.."巡查"..format("(%d/1)",value4)
	local str4 = "\n"..strTable.."到@npc_"..x304002_var_AreaInfo[zone5].NpcId.."巡查"..format("(%d/1)",value5)
	if value2>=1 then
		str1 = "#G"..str1
	else
		str1 = "#W"..str1
	end
	if value3>=1 then
		str2 = "#G"..str2
	else
		str2 = "#W"..str2
	end
	if value4>=1 then
		str3 = "#G"..str3
	else
		str3 = "#W"..str3
	end
	if value5>=1 then
		str4 = "#G"..str4
	else
		str4 = "#W"..str4
	end
	return str1..str2..str3..str4
end

function x304002_GetReplyNpcId(varMap,varPlayer)
	local TempCountry = GetCurCountry( varMap, varPlayer )
	for i ,item in x304002_var_ReplyNpcId do
		if item.Country == TempCountry then
			return item.NpcId
		end
	end
end

function x304002_GetMissionMethod(varMap,varPlayer)
	return x304002_var_MissionTarget
end

function x304002_GetMissionText(varMap,varPlayer)
	return x304002_var_MissionInfo
end

function x304002_GetMissionHelp(varMap,varPlayer)
	return x304002_var_MissionHelp
end


function x304002_ProcQuestLogRefresh( varMap, varPlayer, MissionId)
	x304002_QuestLogRefresh( varMap, varPlayer, MissionId );
end

function x304002_ProcQuestAttach( varMap, varPlayer, npcId, npcGuid,misIndex, MissionId )

end
function x304002_ProcMapTimerTick( varMap, monsterobjid )

end

----------------------------------------------------------------------------------------------
--区域事件-离开区域事件 
----------------------------------------------------------------------------------------------
function x304002_ProcAreaLeaved(varMap, varPlayer, zoneId, MissionId)
		if x304002_CheckMapId( varMap, varPlayer ) == 0 then
				return
		end
		if IsHaveQuestNM( varMap, varPlayer, x304002_GetMissionId( varMap, varPlayer ) ) < 1 then
				return
		end
		x304002_ProcQuestLogRefresh( varMap, varPlayer, MissionId)
end

----------------------------------------------------------------------------------------------
--区域事件-进入区域事件 
----------------------------------------------------------------------------------------------
function x304002_ProcAreaEntered( varMap, varPlayer, zoneId, MissionId )
		if x304002_CheckMapId( varMap, varPlayer ) == 0 then
				return
		end
		if IsHaveQuestNM( varMap, varPlayer, x304002_GetMissionId( varMap, varPlayer ) ) < 1 then	
				return
		end
		zoneId = x304002_GetAreaZoneId(varMap, varPlayer, zoneId)
		local misIndex = GetQuestIndexByID( varMap, varPlayer, x304002_GetMissionId( varMap, varPlayer ) )
		local TempArea1 = GetQuestParam(varMap, varPlayer, misIndex, 1)
		local TempArea2 = GetQuestParam(varMap, varPlayer, misIndex, 2)
		local TempArea3 = GetQuestParam(varMap, varPlayer, misIndex, 3)
		local TempArea4 = GetQuestParam(varMap, varPlayer, misIndex, 4)
		if zoneId == TempArea1 - 20 then
				SetQuestByIndex(varMap, varPlayer, misIndex, 1, zoneId)
				x304002_ShowTips( varMap, varPlayer,x304002_var_MissionMsg1)
				x304002_ShowTips( varMap, varPlayer,"到@npc_"..x304002_var_AreaInfo[zoneId].NpcId.."巡查(1/1)")
				x304002_ProcQuestLogRefresh( varMap, varPlayer, x304002_GetMissionId( varMap, varPlayer ))
		elseif zoneId == TempArea2 - 20 then
				SetQuestByIndex(varMap, varPlayer, misIndex, 2, zoneId)
				x304002_ShowTips( varMap, varPlayer,x304002_var_MissionMsg1)
				x304002_ShowTips( varMap, varPlayer,"到@npc_"..x304002_var_AreaInfo[zoneId].NpcId.."巡查(1/1)")
				x304002_ProcQuestLogRefresh( varMap, varPlayer, x304002_GetMissionId( varMap, varPlayer ))
		elseif zoneId == TempArea3 - 20 then
				SetQuestByIndex(varMap, varPlayer, misIndex, 3, zoneId)
				x304002_ShowTips( varMap, varPlayer,x304002_var_MissionMsg1)
				x304002_ShowTips( varMap, varPlayer,"到@npc_"..x304002_var_AreaInfo[zoneId].NpcId.."巡查(1/1)")
				x304002_ProcQuestLogRefresh( varMap, varPlayer, x304002_GetMissionId( varMap, varPlayer ))
		elseif zoneId == TempArea4 - 20 then
				SetQuestByIndex(varMap, varPlayer, misIndex, 4, zoneId)
				x304002_ShowTips( varMap, varPlayer,x304002_var_MissionMsg1)
				x304002_ShowTips( varMap, varPlayer,"到@npc_"..x304002_var_AreaInfo[zoneId].NpcId.."巡查(1/1)")
				x304002_ProcQuestLogRefresh( varMap, varPlayer, x304002_GetMissionId( varMap, varPlayer ))
		elseif zoneId == TempArea1 - 40 then
				x304002_ShowTips( varMap, varPlayer,x304002_var_MissionMsg2)
				x304002_ShowTips( varMap, varPlayer,x304002_var_MissionMsg3)
				x304002_AreaCreateMonster(varMap, varPlayer, zoneId, MissionId)
		elseif zoneId == TempArea2 - 40 then
				x304002_ShowTips( varMap, varPlayer,x304002_var_MissionMsg2)
				x304002_ShowTips( varMap, varPlayer,x304002_var_MissionMsg3)
				x304002_AreaCreateMonster(varMap, varPlayer, zoneId, MissionId)
		elseif zoneId == TempArea3 - 40 then
				x304002_ShowTips( varMap, varPlayer,x304002_var_MissionMsg2)
				x304002_ShowTips( varMap, varPlayer,x304002_var_MissionMsg3)
				x304002_AreaCreateMonster(varMap, varPlayer, zoneId, MissionId)
		elseif zoneId == TempArea4 - 40 then
				x304002_ShowTips( varMap, varPlayer,x304002_var_MissionMsg2)
				x304002_ShowTips( varMap, varPlayer,x304002_var_MissionMsg3)
				x304002_AreaCreateMonster(varMap, varPlayer, zoneId, MissionId)
		end
		x304002_CheckAttach(varMap, varPlayer, misIndex)
		x304002_ProcQuestLogRefresh( varMap, varPlayer, x304002_GetMissionId( varMap, varPlayer ))
end

----------------------------------------------------------------------------------------------
--区域事件-创建Monster
----------------------------------------------------------------------------------------------
function x304002_AreaCreateMonster( varMap, varPlayer, zoneId, MissionId )
		local x, z = GetWorldPos(varMap, varPlayer)
		local item = x304002_var_MosterInfo[zoneId]
		local Create = 1
	  local count = GetNearObjCount( varMap, varPlayer, 12, 0, varPlayer)
		  for i = 0, count - 1 do
	     local objid = GetNearMonster( varMap, varPlayer, i)
				for j =1 , getn(x304002_var_MosterInfo) do	  
	     		if GetMonsterDataID(varMap, objid) == x304002_var_MosterInfo[j].MonsterType then
						Create = 0
						break
					else 	
	     		end
	     	end
	     	if Create == 0 then 
	     		break
	     	end	
			end
		if Create ==1 then 
			CreateMonster( varMap, item.MonsterType, x, z, item.ai, item.aiscript, x304002_var_ScriptId, -1, 21, item.TTL, 0, item.name)		
		end 
end

---------------------------------------------------------------------------------------------------
--杀怪
---------------------------------------------------------------------------------------------------
function x304002_ProcDie( varMap, varObj, varKiller )
	local zoneId = 0
	local objdataId = GetMonsterDataID(varMap,varObj)
	for i ,item in x304002_var_MosterInfo do
				if objdataId == item.MonsterType then
						zoneId = item.Id
						break
				end
	end
	local x, z = GetMonsterPosition( varMap, varObj)
  local humancount = GetNearPlayerCount( varMap, varKiller, x, z, 20)
  for	i = 0, humancount - 1 do
      local humanId = GetNearPlayerMember( varMap, varKiller, i)
      if x304002_CheckState(varMap, humanId, varKiller) == 0 then
      		break
      end
      local humanMissionId = x304002_GetMissionId( varMap, humanId )
      if IsHaveQuestNM( varMap, humanId, humanMissionId ) == 1 then
          local misIndex = GetQuestIndexByID( varMap, humanId, x304002_GetMissionId( varMap, humanId ) )
          for j = 1, 4 do
          		if  GetQuestParam(varMap, humanId, misIndex, j) == zoneId + 40 then
          				x304002_ShowTips( varMap, humanId,x304002_var_MissionMsg4)
          				SetQuestByIndex(varMap, humanId, misIndex, j, zoneId)
									x304002_CheckAttach(varMap, humanId, misIndex)
									x304002_ProcQuestLogRefresh( varMap, humanId, humanMissionId)
									break
          		end
          end
          x304002_ProcQuestLogRefresh( varMap, humanId, humanMissionId)
      end
  end
  
  local humanMissionId = x304002_GetMissionId( varMap, varKiller )
  if IsHaveQuestNM( varMap, varKiller, humanMissionId ) == 1 then
      local misIndex = GetQuestIndexByID( varMap, varKiller, x304002_GetMissionId( varMap, varKiller ) ) 
      for j = 1, 4 do
      		if  GetQuestParam(varMap, varKiller, misIndex, j) == zoneId + 40 then
      				x304002_ShowTips( varMap, varKiller,x304002_var_MissionMsg4)
      				SetQuestByIndex(varMap, varKiller, misIndex, j, zoneId)
							x304002_CheckAttach(varMap, varKiller, misIndex)
							x304002_ProcQuestLogRefresh( varMap, varKiller, humanMissionId)
							break
      		end
      end
      x304002_ProcQuestLogRefresh( varMap, varKiller, humanMissionId)
  end
end

function x304002_ProcQuestObjectKilled(varMap, varPlayer, objdataId, objId, MissionId)

end

---------------------------------------------------------------------------------------------------
--获取区域信息
---------------------------------------------------------------------------------------------------

function x304002_GetAreaZoneId( varMap, varPlayer ,ZoneId)
		for i ,item in x304002_var_AreaInfo do
				if ZoneId == item.ZoneId then
						return item.Id
				end
		end
end

function x304002_GetAreaId( varMap, varPlayer ,ZoneId)
		for i ,item in x304002_var_AreaInfo do
				if ZoneId == item.Id then
						return item.Id,1
				elseif ZoneId == item.Id + 20 then
						return item.Id,0
				elseif ZoneId == item.Id + 40 then
						return item.Id,0
				end
		end
		return -1,-1
end
----------------------------------------------------------------------------------------------
--随机选择目标区域（算法有待改善）
----------------------------------------------------------------------------------------------
function x304002_RandomArea(varMap, varPlayer, misIndex)
		local level = GetLevel( varMap,varPlayer )
		local value = {0,0,0,0}
		if level >= x304002_var_MissionLevel1 and level < x304002_var_MissionLevel2 then
				for k = 1, 4 do
					local i = 0
						while i == value[1] or i == value[2] or i == value[3] or i == value[4] do
							i = random(1, 10)
						end    
					value[k] = i
					SetQuestByIndex( varMap, varPlayer, misIndex, k, value[k] + random(1,2)*20 )
				end
--		elseif level >= x304002_var_MissionLevel2 then
--				for k = 1, 4 do
--					local i = 0
--						while i == value[1] or i == value[2] or i == value[3] or i == value[4] do
--						  i = random(11, 20)
--						end    
--					value[k] = i
--					SetQuestByIndex( varMap, varPlayer, misIndex, k, value[k] + random(1,2)*20 )
				
		end
end

----------------------------------------------------------------------------------------------
--获取玩家阵营对应MapId
----------------------------------------------------------------------------------------------
function x304002_GetMapId(varMap, varPlayer)
		TempCountry = GetCurCountry(varMap, varPlayer)
		for i ,item in x304002_var_MapInfo do
				if TempCountry == item.Country then
						return item.MapId
				end
		end
end

----------------------------------------------------------------------------------------------
--判断玩家阵营对应MapId
----------------------------------------------------------------------------------------------
function x304002_CheckMapId(varMap, varPlayer)
    if	x304002_GetMapId( varMap,varPlayer ) == varMap then
    		return 1
    else
    		return 0
    end
end
----------------------------------------------------------------------------------------------
--判断是否可获得物品奖励
----------------------------------------------------------------------------------------------
function x304002_CheckReward(varMap, varPlayer)
		return 1
end
----------------------------------------------------------------------------------------------
--判断任务是否完成
----------------------------------------------------------------------------------------------
function x304002_CheckAttach(varMap, varPlayer ,misIndex)
	local zone1 = GetQuestParam( varMap, varPlayer, misIndex, 1 )
	local zone2 = GetQuestParam( varMap, varPlayer, misIndex, 2 )
	local zone3 = GetQuestParam( varMap, varPlayer, misIndex, 3 )
	local zone4 = GetQuestParam( varMap, varPlayer, misIndex, 4 )
	local zone1,value1 = x304002_GetAreaId(varMap, varPlayer ,zone1)
	local zone2,value2 = x304002_GetAreaId(varMap, varPlayer ,zone2)
	local zone3,value3 = x304002_GetAreaId(varMap, varPlayer ,zone3)
	local zone4,value4 = x304002_GetAreaId(varMap, varPlayer ,zone4)
	if value1*value2*value3*value4>0 then
			SetQuestByIndex( varMap, varPlayer, misIndex, 5, 2 ) --完成任务
			SetQuestByIndex( varMap, varPlayer, misIndex, 0, 1 )
			SetQuestByIndex( varMap, varPlayer, misIndex, 7, 1 )
	end
end
----------------------------------------------------------------------------------------------
--判断杀怪归属
----------------------------------------------------------------------------------------------
function x304002_CheckGuildID(varMap, varPlayer, varObj)
	local TempGuild1 = GetGuildID(varMap, varPlayer)
	local TempGuild2 = GetGuildID(varMap, varObj)
	if TempGuild1 == TempGuild2 then
		return 1
	else
		return 0
	end
end

function x304002_CheckTeamID(varMap, varPlayer, varObj)
	local TempTeam1 = GetTeamId(varMap, varPlayer)
	local TempTeam2 = GetTeamId(varMap, varObj)
	if TempTeam1 == TempTeam2 then
		return 1
	else
		return 0
	end
end

function x304002_CheckState(varMap, varPlayer, varObj)
	if x304002_CheckGuildID(varMap, varPlayer, varObj) + x304002_CheckTeamID(varMap, varPlayer, varObj) == 0 then
		return 0
	else
		return 1
	end
end
function x304002_GetExpBonus(varMap,varPlayer)
	local varLevel = GetLevel(varMap, varPlayer)
	local awardexp = 0
	if x304002_var_ExpTable[varLevel] > 0 then
		awardexp = floor(x304002_var_ExpTable[varLevel]/7)
	end
	return awardexp
end
function x304002_GetBanggong(varMap,varPlayer)
	local level = GetLevel( varMap,varPlayer )
	local banggong = 0
		if GetGuildID(varMap, varPlayer) == -1 then
				return 0
		end
	if level >=30 and level <40 then
			banggong = floor(600*5/60*1)
			
	elseif level >=40 and level <50 then
			banggong = floor(700*5/60*1)
  
	elseif level >=50 and level <60 then
			banggong = floor(800*5/60*1)
  
	elseif level >=60 and level <70 then
			banggong = floor(1000*5/60*1)
	
	elseif level >=70 and level <80 then
			banggong = floor(1500*5/60*1)
  
	elseif level >=80 and level <90 then
			banggong = floor(2000*5/60*1)
  
	elseif level >=90 then
			banggong = floor(2500*5/60*1)
	end
	return 0
end

function x304002_GetSliverCardBonus(varMap, varPlayer )
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
