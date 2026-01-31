x320018_var_FileId 						= 320018
x320018_var_QuestName					= "【个人】运送寒玉"
x320018_var_QuestInfo					= "\t后花园直接关系到我大元的安危，目前我们势均力敌，谁能启动大玉海召唤来自己的部队，谁就能赢得这场战争。如果我军不胜，大汗就会封住入口，我们和冥王军就会永远被留在这里。\n\t启动大玉海的方法就是用天池寒玉填满玉海窑口，你将这车寒玉火速送到玉海窑口，事不宜迟，快去，快去！"
x320018_var_QuestCompleted		= "\t嗯，真不亏是我大元的栋梁之才！我们离胜利又近了一步。"
x320018_var_QuestTarget		 		= "  护送一车#G天池寒玉#W到@npc_144749"
x320018_var_QuestHelp					= "\t运送寒玉任务在活动时间内不限次接取，在活动时间内完成护送任务将获得个人积分和己方阵营资源，活动结束后将无法提交此任务。"
x320018_var_NPCName						= "@npc_144749"
x320018_var_QuestRuse					= ""
x320018_var_QuestId						= 6653
x320018_var_GameOpenId				= 1086
x320018_var_AcceptNPCGUID			= 144747
x320018_var_AcceptNPCGUID1		= 144748
x320018_var_SubmitNPCGUID			= 144749
x320018_var_SubmitNPCGUID1		= 144750
x320018_var_BusScriptId				= 320017
x320018_var_BonusItem					= {}
x320018_var_BonusChoiceItem				= {}
x320018_var_GetPlayerExp			= 
{
{level = 40, value = 800},
{level = 65, value = 1200},
{level = 85, value = 2160},
}




function x320018_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if x320018_var_GameOpenId > 0 and GetGameOpenById( x320018_var_GameOpenId ) <= 0 then
      return
  end
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	local nlevel = GetLevel( varMap, varPlayer)
	
	if GetWeekcount == 1 then
		return
	end
	
	if varMap ~= 44 then
		return
	end	
	
	if minOfDay < 869 or minOfDay > 900 then
		return
	end

	if weekIdx ~= 6 then
		return
	end	
	
	if nlevel < 40 then
		return
	end

	if GetCurCamp(varMap, varPlayer) ~= 5 then
		return
	end
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if varTalkNpcGUID == x320018_var_AcceptNPCGUID or varTalkNpcGUID == x320018_var_AcceptNPCGUID1 then
		local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x320018_var_QuestId, x320018_var_QuestName, state)
	end
end

function x320018_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varidx)
	if x320018_var_GameOpenId > 0 and GetGameOpenById( x320018_var_GameOpenId ) <= 0 then
      return
  end
--	local varred, varblue = LuaCallNoclosure( 320016, "GetTwoCampResource", varMap, varPlayer)
--	local PlayerValue = x320018_GetMD( varMap, varPlayer, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL)
--		local teamid = GetTeamId(varMap, varPlayer)
--	Msg2Player(varMap, varPlayer, "varblue="..varblue, 8, 1)
--	Msg2Player(varMap, varPlayer, "varred="..varred, 8, 1)
--	Msg2Player(varMap, varPlayer, "GetCurCamp="..GetCurCamp(varMap, varPlayer), 8, 1)
--	Msg2Player(varMap, varPlayer, "GetPlayerResource="..PlayerValue, 8, 1)
--		Msg2Player(varMap, varPlayer,teamid,8,2) 
	if IsHaveQuestNM( varMap, varPlayer, x320018_var_QuestId ) > 0 then	-- 如果有这个任务
		local bDone = x320018_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)
		if(bDone > 0) then

				x320018_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		else

				x320018_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest ) --未完成任务显示

		end
	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		if x320018_var_SubmitNPCGUID ~= varTalkNpcGUID  then
			x320018_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"你没有此任务！")
			StopTalkTask()
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		end
	end	
end


function x320018_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x320018_var_QuestName)
		TalkAppendString(varMap,x320018_var_QuestCompleted)
		TalkAppendString(varMap,"\n#Y奖励内容：  ")

		local level = GetLevel(varMap, varPlayer)

		local ExpBonus = x320018_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end

	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x320018_var_FileId, x320018_var_QuestId)

end

function x320018_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	
	StartTalkTask(varMap)

		--任务继续信息
		TalkAppendString(varMap,"#Y"..x320018_var_QuestName)
		TalkAppendString(varMap,format("%s", x320018_var_QuestInfo))
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成");

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x320018_YunBiaoExp(varMap, varPlayer)
		if ExpBonus> 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end

	StopTalkTask(varMap)
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x320018_var_FileId, varQuest,0);



end

function x320018_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)

	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)

	if x320018_var_SubmitNPCGUID ~= varTalkNpcGUID  then
		return 0
	end

	return 1;

end

function x320018_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end

function x320018_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)

		--任务信息
		TalkAppendString(varMap,"#Y"..x320018_var_QuestName)
		TalkAppendString(varMap,format("%s", x320018_var_QuestInfo))
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y任务目标：")
		TalkAppendString( varMap,format("%s", x320018_var_QuestTarget))
		TalkAppendString( varMap," ")

		--提示信息
		if x320018_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s", x320018_var_QuestHelp))
			TalkAppendString(varMap," ")
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x320018_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x320018_var_FileId, varQuest)
end


function x320018_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	
	--x320018_ProcQuestAccept( varMap, varPlayer, varTalknpc, SelectId,varQuest )
	
	
end

function x320018_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if x320018_var_GameOpenId > 0 and GetGameOpenById( x320018_var_GameOpenId ) <= 0 then
      return
  end
  
	if IsBusMember(varMap,varPlayer) == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您已处于护送/押运状态，无法领取新的押运任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "您已处于护送/押运状态，无法领取新的押运任务！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
	
	
	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end

	if AddQuestNM( varMap, varPlayer, x320018_var_QuestId) == 1 then
		
		--接任务写日志


		StartTalkTask(varMap)
		TalkAppendString(varMap, "你接受了任务：【个人】运送寒玉")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = "你接受了任务：【个人】运送寒玉"
		Msg2Player(varMap,varPlayer,Readme,8,2)
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x320018_var_QuestId);
		SetQuestByIndex( varMap, varPlayer, misIndex, 0, 0 )
	end
	LuaCallNoclosure( x320018_var_BusScriptId, "ProcCreateBus", varMap, varPlayer ,varQuest)
end

function x320018_ProcQuestAbandon( varMap, varPlayer,varQuest )
	
--	if IsHaveQuestNM( varMap, varPlayer, x320018_var_QuestId) == 0 then	-- 如果没有这个任务
--		return
--	end
	local varBusID  =  GetBusId(varMap, varPlayer)	
	DelQuestNM( varMap, varPlayer, x320018_var_QuestId)
	if varBusID ~= -1 then
		DeleteBus(varMap, varBusID,1)
	end
	local Readme = "你放弃了任务：【个人】运送寒玉"
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)

end


function x320018_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,varQuest );
	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								x320018_var_QuestName,			-- 任务名字
								x320018_var_QuestTarget,		--任务目标
								x320018_var_NPCName,				--任务NPC
								x320018_var_QuestRuse,			--任务攻略
								x320018_var_QuestInfo,			--任务描述
								x320018_var_QuestHelp								--任务小提示
								)
		local varExp = 	x320018_YunBiaoExp(varMap, varPlayer)				
	  if varExp > 0 then
        AddQuestExpBonus( varMap, varExp)
    end							
				
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	end

end

function x320018_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)
	if x320018_var_GameOpenId > 0 and GetGameOpenById( x320018_var_GameOpenId ) <= 0 then
      return
  end
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	local nlevel = GetLevel( varMap, varPlayer)
	
	if GetWeekcount == 1 then
		Msg2Player(varMap,varPlayer,"不在活动时间内，无法提交此任务！",8,3)
		return
	end
	
	if varMap ~= 44 then
		Msg2Player(varMap,varPlayer,"不在正确的活动场景，无法提交此任务！",8,3)
		return
	end	
	
	if minOfDay < 869 or minOfDay > 900 then
		Msg2Player(varMap,varPlayer,"不在活动时间内，无法提交此任务！",8,3)
		return
	end

	if weekIdx ~= 6 then
		Msg2Player(varMap,varPlayer,"不在活动时间内，无法提交此任务！",8,3)
		return
	end	
	
	if nlevel < 40 then
		Msg2Player(varMap,varPlayer,"等级过低，无法提交此任务！",8,3)
		return
	end

	if GetCurCamp(varMap, varPlayer) ~= 5 then
		Msg2Player(varMap,varPlayer,"你无法提交此任务！",8,3)
		return
	end
	local redval, blueval = LuaCallNoclosure(320016, "GetTwoCampResource", varMap, varPlayer)

	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);
	if(varHaveQuest <= 0) then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "你没有这个任务，不能提交！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你没有这个任务，不能提交！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0		
	end
--	Msg2Player(varMap,varPlayer,varQuest,8,2)
	
	if IsValidMyselfBus(varMap, varPlayer,varQuest) == 0 then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "镖车离你太远了，不能提交！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "镖车离你太远了，不能提交！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, varQuest);
	if varHaveQuest > 0 then

		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest)

		local result = x320018_CheckPlayerBagFull( varMap ,varPlayer,selectId )
		if result == 1 then
			if DelQuest(varMap, varPlayer, varQuest) ~= 1 then
				return
			end
			

			
			x320018_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
						
			local varBusID  =  GetBusId(varMap, varPlayer)
		  	if varBusID ~= -1  then
		     	
				if GetBusQuestID(varMap, varBusID) == varQuest then
		  			DeleteBus(varMap, varBusID,1)
				end
		  	end 
		else
			StartTalkTask( varMap )
			TalkAppendString( varMap,"包裹已满！")
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer);
		end

	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end		
end


function x320018_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x320018_var_QuestId )

	if varHaveQuest > 0 then
		if varTalkNpcGUID == x320018_var_SubmitNPCGUID  then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x320018_var_QuestId)
			TalkAppendButton(varMap, x320018_var_QuestId, x320018_var_QuestName,7, 1)
		end
	end
end


function x320018_CheckPlayerBagFull( varMap ,varPlayer,selectId )

	local result = 1

	local j = 0

	local bAdd = 0 

	
	StartItemTask(varMap)
	for j, item in x320018_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end

	for j, item in x320018_var_BonusChoiceItem do
		if item.item == selectRadio then
			ItemAppend( varMap, item.item, item.n )
			break
		end
	end

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet <= 0 then
		result = 0
	end

	return result
end


function x320018_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
	if GetCurCamp(varMap, varPlayer) == 5 then
		LuaCallNoclosure(320016, "SetRedCampResource", varMap, varPlayer)
	elseif GetCurCamp(varMap, varPlayer) == 6 then
		LuaCallNoclosure(320016, "SetBlueCampResource", varMap, varPlayer)
	end    
    AddExp(varMap, varPlayer, x320018_YunBiaoExp(varMap, varPlayer))
    
    local PlayerValue = x320018_GetMD( varMap, varPlayer, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL)
    if PlayerValue <= 32767 then
    	x320018_SetMD( varMap, varPlayer, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL, PlayerValue + 1)
    end
    local redcamp1, bluecamp1 = LuaCallNoclosure(320016, "GetTwoCampResource", varMap, varPlayer)
	WriteLog(1, format("x320018_GetBonusWhenOverQuest: Playerid=%s, GetExp=%d, GetRedCampResource=%d, GetBlueCampResource=%d",varPlayer, x320018_YunBiaoExp(varMap, varPlayer), redcamp1, bluecamp1))
    StartTalkTask(varMap)
    TalkAppendString(varMap,"您完成了任务了：【个人】运送寒玉");
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x320018_YunBiaoExp(varMap, varPlayer).."点#o的奖励")
    TalkAppendString(varMap,"为您的所属阵营增加#R5点#o资源积分奖励")
    TalkAppendString(varMap,"为您增加#R1点#o个人积分奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    Msg2Player(varMap,varPlayer,"您完成了任务了：【个人】运送寒玉#r获得#R经验"..x320018_YunBiaoExp(varMap, varPlayer).."点#o的奖励",8,2)
    Msg2Player(varMap,varPlayer,"为您的所属阵营增加#R5点#o资源积分奖励",8,2)
    Msg2Player(varMap,varPlayer,"为您增加#R1点#o个人积分奖励",8,2)

end

function x320018_YunBiaoExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 40 then
		return
	end
	for i, j in x320018_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end

function x320018_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x320018_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
