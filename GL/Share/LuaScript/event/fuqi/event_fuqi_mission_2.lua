
--DECLARE_QUEST_INFO_START--
x300351_var_FileId = 300351
x300351_var_LevelLess = 40
--DECLARE_QUEST_INFO_STOP--
x300351_var_BusScriptId = 300354
x300351_var_FatherQuestId = SPOUSE_TASK[1]
x300351_var_FatherQuestName = "【夫妻任务】"
x300351_var_QuestId = SPOUSE_TASK[2]

x300351_var_QuestName ="【夫妻任务】"

function x300351_IsQuestComplete(varMap, varPlayer, varQuest) 
  local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
  return GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
end

function x300351_SetQuestData(varMap, varPlayer)
		SetPlayerGameData(varMap, varPlayer, MD_SPOUSE_MISSION_DATE[1][1], MD_SPOUSE_MISSION_DATE[1][2], MD_SPOUSE_MISSION_DATE[1][3], GetDayOfYear())
end

function x300351_SubmitFatherQuestCheck(varMap, varPlayer, varTalknpc)
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	local varTalknpc = GetTeamSceneMember(varMap, varPlayer, 0);
	
	local week = GetWeek()
	local varToday = GetDayOfYear()
	if week ~=4 and week ~= 6 then
		return "很抱歉，只有周四、周六，才能进行本任务！"   
	end
	
	if HasTeam(varMap, varPlayer) ~= 1 then
		return "很抱歉，您还未进行组队无法提交本任务。"
	end
	
	if (GetTeamSize(varMap, varPlayer) < 2) then
		return "很抱歉，您所在的队伍中成员小于2人，无法提交本任务。";
	end
	
	if (GetTeamSize(varMap, varPlayer) > 2) then
		return "很抱歉，您所在的队伍中成员大于2人，无法提交本任务。";
	end
	
	
		
		
		
		
		
		
		
		
	
	
	if IsInDist(varMap, varPlayer, varTalknpc, 10) ~= 1 then
		return "很抱歉，您与配偶不在有效的距离内，无法进行本任务。";
	end
	
	if IsSpouses(varMap, varPlayer, varTalknpc) ~= 1 then
		return "很抱歉，您所在的队伍中成员不是夫妻关系，无法提交本任务。";
	end		
	
	if IsHaveQuestNM( varMap, varPlayer, x300351_var_FatherQuestId ) ~= 1 then
		return "您没有本任务，无法提交本任务。"
	end
	
	if IsHaveQuestNM( varMap, varTalknpc, x300351_var_FatherQuestId ) ~= 1 then
		return "您的配偶没有本任务，无法提交本任务。"
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300351_var_FatherQuestId )
	if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, x300351_var_FatherQuestId, varQuestIdx ) <= 0 then
		return "您未完成本任务，无法提交本任务。"
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varTalknpc, x300351_var_FatherQuestId )
	if QuestCheckSubmitNM( varMap, varTalknpc, varTalknpc, x300351_var_FatherQuestId, varQuestIdx ) <= 0 then
		return "您的配偶未完成本任务，无法提交本任务。"
	end
	
	return nil
end







function x300351_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300351_var_FatherQuestId )
	if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, x300351_var_FatherQuestId, varQuestIdx ) > 0 then
		local submitRetCode = x300351_SubmitFatherQuestCheck(varMap, varPlayer, varTalknpc)
		if submitRetCode ~= nil then
			Msg2Player(varMap,varPlayer,submitRetCode,8,2)
			StartTalkTask(varMap)
			TalkAppendString(varMap, submitRetCode);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
			
			
			
			
			
		end
		local addNextQuestRetCode = x300351_AcceptCheck(varMap, varPlayer)
		if addNextQuestRetCode ~= nil then
			Msg2Player(varMap,varPlayer,addNextQuestRetCode,8,2)
			StartTalkTask(varMap)
			TalkAppendString(varMap, addNextQuestRetCode);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
			
			
			
			
			
		end
		StartTalkTask(varMap)
	
		
		

		
		TalkAppendString(varMap,"")
		TalkAppendString(varMap,"#Y【夫妻】爱情水晶#W#r\t我需要很多带有爱意的@item_13080009#W来制作爱之槟榔，看来你们已经帮我采到了！#r\t看你们小俩口甜甜蜜蜜的样子，真是羡慕死我了，真不知道何时我也找到疼爱我的娘子？#r\t拜托你们两个帮我把淘气的小孩带到@npc_139818那里吧，他已经很久没见爸爸了。#r\t我会为你们的爱情祈祷，祝福你们幸福美满！")

		StopTalkTask()
	  DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300351_var_FileId, x300351_var_QuestId);
	  return
	end
	
	local varStr = "您或您的另一半还未完成任务，加油啊"
	Msg2Player(varMap,varPlayer,varStr,8,2)
	StartTalkTask(varMap)
	TalkAppendString(varMap, varStr);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)

end









function x300351_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsMarried(varMap, varPlayer) ~= 1 then
		return
	end
	
	if IsHaveQuestNM( varMap, varPlayer, x300351_var_FatherQuestId ) == 1 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300351_var_FatherQuestId )
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x300351_var_FatherQuestId)
		TalkAppendButton(varMap, x300351_var_FileId, x300351_var_FatherQuestName, varState, -1)
		return
	end
	
end









function x300351_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	
		return 1
	
end








function x300351_CheckPushList(varMap, varPlayer, varTalknpc)
	return 1
end

function x300351_CreateBus(varMap, varPlayer)
  local PosX,PosZ = GetWorldPos(varMap, varPlayer)
	local busType = 31
	local AIType = 3
	local AIScript = 3
	local IamGodImpactId = 1210
	local varObj = CreateBus(varMap, busType, PosX, PosZ, AIType, AIScript, x300351_var_BusScriptId, varPlayer, IamGodImpactId,-1,-1)
end

function x300351_DeleteBus(varMap, varPlayer)

	local varBusID  =  GetBusId(varMap, varPlayer)
	if varBusID ~= -1 then
		if (IsObjValid (varMap,varBusID) == 1) and x300351_var_QuestId == GetBusQuestID(varMap, varBusID ) then
			DeleteBus(varMap, varBusID,1)
		end
	end
	
end

function x300351_AcceptCheck(varMap, varPlayer)
	local week = GetWeek()
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	if week ~= 4 and week ~= 6 then
		return "只有周四、周六，才能进行本任务。"
	end
	
	if HasTeam(varMap, varPlayer) ~= 1 then
		return "很抱歉，您还未进行组队无领取本任务。"
	end
	
	if (GetTeamSize(varMap, varPlayer) < 2) then
		return "很抱歉，您所在的队伍中成员小于2人，无法领取本任务。";
	end
	
	if (GetTeamSize(varMap, varPlayer) > 2) then
		return "很抱歉，您所在的队伍中成员大于2人，无法领取本任务。";
	end

	local varTalknpc = GetTeamSceneMember(varMap, varPlayer, 0);
	
	if IsInDist(varMap, varPlayer, varTalknpc, 10) ~= 1 then
		return "很抱歉，您与队友不在有效的距离内，无法领取本任务。";
	end
	
	if IsSpouses(varMap, varPlayer, varTalknpc) ~= 1 then
		return "很抱歉，您所在的队伍中成员不是夫妻关系，无法领取本任务。";
	end		
	
	if GetSex(varMap, varPlayer) == 0 then
		return "很抱歉，请让您的另一半来进行本任务。";
	end
	
	local varHaveQuest = IsHaveQuest(varMap, varTalknpc, x300351_var_QuestId)
	if varHaveQuest == 1 then
		return "您的配偶有" .. x300351_var_QuestName .. "，无法接取本任务。"
	end
	
	varHaveQuest = IsHaveQuest(varMap, varPlayer, x300351_var_QuestId)
	if varHaveQuest == 1 then
		return "您有" .. x300351_var_QuestName .. "，无法接取本任务。"
	end
	
	if IsBusMember(varMap, varPlayer) == 1 then
		return "您正在护送，无法接取本任务。"
	end
			
	return nil
end
	
function x300351_DoAccept( varMap, varPlayer )

	local retCode = x300351_AcceptCheck(varMap, varPlayer)
	if retCode ~= nil then
		return retCode
	end
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	for varI = 0, varTeamSize - 1 do
		local aId = GetNearTeamMember(varMap, varPlayer, varI)
		local aName = GetName(varMap, aId)
		local errorCode = AddQuestNM( varMap, aId, x300351_var_QuestId )
		if errorCode ~= 1 then
			Msg2Player(varMap,aId,"添加任务失败！",8,2)
		end
		
	end
	x300351_CreateBus(varMap, varPlayer)
	
	
	return nil
end






function x300351_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	local varStr = x300351_DoAccept( varMap, varPlayer )
	if varStr ~= nil then
		Msg2Player(varMap,varPlayer,varStr,8,2)
	end
	
end









function x300351_ProcQuestAbandon(varMap, varPlayer, varQuest)
	DelQuestNM( varMap, varPlayer, varQuest )
	
	
	local message = "您放弃了夫妻任务"
	StartTalkTask(varMap);
		TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 4, 2);
	
	x300351_DeleteBus(varMap, varPlayer)
	
	x300351_SetQuestData(varMap, varPlayer)
	
	
	local spouseGuid = GetSpouseGUID( varMap, varPlayer )
	local spouseName = GetFriendName( varMap, varPlayer, tonumber(spouseGuid) )
	SendScriptPost( varMap, spouseName, MAIL_DELETE_MISSION, x300351_var_QuestId, 1, 0, varPlayer )
end









function x300351_CheckSubmit( varMap, varPlayer, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then
		return 0;
	end
	return 1
end








function x300351_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	local submitRetCode = x300351_SubmitFatherQuestCheck(varMap, varPlayer, varTalknpc)
	if submitRetCode ~= nil then
		Msg2Player(varMap,varPlayer,submitRetCode,8,2)
		return
	end
	
	local retCode = x300351_AcceptCheck(varMap, varPlayer)
	if retCode ~= nil then
		Msg2Player(varMap,varPlayer,retCode,8,2)
		return
	end
	local spouseId = GetTeamSceneMember(varMap, varPlayer, 0);
	
	local varRet = x300351_IsQuestComplete( varMap, varPlayer, x300351_var_FatherQuestId )
	if varRet > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您完成了任务:【夫妻】爱情紫晶");
		StopTalkTask();
		Msg2Player(varMap,varPlayer,"您完成了任务:【夫妻】爱情紫晶",8,2)
		DeliverTalkTips(varMap, varPlayer);
		
		DelQuestNM( varMap, varPlayer, x300351_var_FatherQuestId )
		local errorCode = AddQuestNM( varMap, varPlayer, x300351_var_QuestId )
		if errorCode ~= 1 then
			Msg2Player(varMap,varPlayer,"添加任务失败！",8,2)
		end
	end

	varRet = x300351_IsQuestComplete( varMap, spouseId, x300351_var_FatherQuestId )
	if varRet > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您完成了任务:【夫妻】爱情紫晶");
		StopTalkTask();
		Msg2Player(varMap,spouseId,"您完成了任务:【夫妻】爱情紫晶",8,2)
		DeliverTalkTips(varMap, spouseId);
		
		DelQuestNM( varMap, spouseId, x300351_var_FatherQuestId )
		local errorCode = AddQuestNM( varMap, spouseId, x300351_var_QuestId )
		if errorCode ~= 1 then
			Msg2Player(varMap,spouseId,"添加任务失败！",8,2)
		end
	end
	x300351_CreateBus(varMap, varPlayer)
	return 0
	
end







function x300351_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end









function x300351_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x300351_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x300351_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x300351_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
    
    if varQuest == nil or varQuest < 0 then
        return
    end
    
    if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then
        return
    end
    
	local NeedNum, ObjIndex = GetQuestNeedItemNumNM( varMap, varPlayer, varQuest, varItemData )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	
	if NeedNum > 0 then
      	local Num = GetItemCount( varMap, varPlayer, varItemData )
		if Num < NeedNum then 
			StartTalkTask(varMap)
			local varText = format("已得到@itemid_%d: %d/%d", varItemData, Num, NeedNum )
			if varText == nil then
				varText = "";
			end
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
   			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )
  		elseif Num == NeedNum then
			
			StartTalkTask(varMap)
			local varText = format( "已得到足够的@itemid_%d: %d/%d", varItemData, Num, NeedNum )
			if varText == nil then
				varText = "";
			end
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
		end
	end
end
function x300351_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
	
end

function x300351_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x300351_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300351_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300351_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x300351_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x300351_QuestLogRefresh( varMap, varPlayer, varQuest)

	StartTalkTask(varMap)	
		
	AddQuestLogCustomText( varMap,
							"标题",						
							"" .. x300351_var_QuestName,        
							"  将#G淘气的小孩#W护送到@npc_139818处",		
							"@npc_139818",			
							"",               
							"韩山童在等待他的孩子，将小孩安全送到@npc_139818那里。护送途中小孩只会跟随男性玩家移动",	
							"护送过程中，夫妻双方不能离开护送目标过远，或时间过久，否则任务会失败！#r护送孩童只有男性才能提交任务"					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
end

function x300351_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	x300351_QuestLogRefresh( varMap, varPlayer, varQuest );
end

function x300351_CheckSubmitNPC( varMap,varPlayer,idScript,idQuest,varTalkNpcGUID )
	if IsHaveQuestNM( varMap, varPlayer, x300351_var_FatherQuestId ) == 0 then
		
		return 0
	end
	for varI, npcItem in SPOUSE_NPC do
		if npcItem == varTalkNpcGUID then
			return 1
		end
	end
	return 0
end
