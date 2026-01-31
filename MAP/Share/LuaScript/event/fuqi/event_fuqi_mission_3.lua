
--DECLARE_QUEST_INFO_START--
x300352_var_FileId = 300352
x300352_var_LevelLess = 40
--DECLARE_QUEST_INFO_STOP--

x300352_var_FatherQuestId = SPOUSE_TASK[2]
x300352_var_FatherQuestName = "【夫妻任务】"
x300352_var_QuestId = SPOUSE_TASK[3]
x300352_var_QuestName ="【夫妻任务】"
x300352_var_QuestItem = 13080010

function x300352_IsQuestComplete(varMap, varPlayer, varQuest) 
  local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
  return GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
end

function x300352_SetQuestComplete(varMap, varPlayer, varQuest) 
  local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
  SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
end


function x300352_SetQuestData(varMap, varPlayer)
		SetPlayerGameData(varMap, varPlayer, MD_SPOUSE_MISSION_DATE[1][1], MD_SPOUSE_MISSION_DATE[1][2], MD_SPOUSE_MISSION_DATE[1][3], GetDayOfYear())
end

function x300352_SubmitFatherQuestCheck(varMap, varPlayer, varTalknpc)
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	local varTalknpc = GetTeamSceneMember(varMap, varPlayer, 0);
	
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
	
	if IsHaveQuestNM( varMap, varPlayer, x300352_var_FatherQuestId ) ~= 1 then
		return "您没有本任务，无法提交本任务。"
	end
	
	if IsHaveQuestNM( varMap, varTalknpc, x300352_var_FatherQuestId ) ~= 1 then
		return "您的配偶没有本任务，无法提交本任务。"
	end
	
	if GetSex(varMap, varPlayer) == 0 then
		return "很抱歉，只有男性才能提交本任务。";
	end
	
	local varBusID  =  GetBusId(varMap, varPlayer)
	if varBusID == -1 then
		return "您的配偶负责护送，请让您的配偶来提交。";
	end
	if IsInDist(varMap, varPlayer, varBusID, 10) ~= 1 then
		return "您距离您护送的孩童太远了，他迷路了，正在原地等您！";
	end
		
	return nil
end

function x300352_DoUseItem( varMap, varPlayer )
	if HasTeam(varMap, varPlayer) ~= 1 then
		return "很抱歉，您还未和您的配偶组队无法使用本物品。"
	end
	
	if (GetTeamSize(varMap, varPlayer) < 2) then
		return "很抱歉，您所在的队伍中成员小于2人，无法使用本物品。";
	end
	
	if (GetTeamSize(varMap, varPlayer) > 2) then
		return "很抱歉，您所在的队伍中成员大于2人，无法使用本物品。";
	end

	local varTalknpc = GetTeamSceneMember(varMap, varPlayer, 0);
	
	if IsInDist(varMap, varPlayer, varTalknpc, 10) ~= 1 then
		return "很抱歉，您的另一半不在附近，不能使用该物品。";
	end
	
	if IsSpouses(varMap, varPlayer, varTalknpc) ~= 1 then
		return "很抱歉，您所在的队伍中成员不是夫妻关系，无法使用本物品。";
	end		
	
	return nil
end

function x300352_AcceptCheck( varMap, varPlayer )
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
		return "很抱歉，您与配偶不在有效的距离内，无法进行本任务。";
	end
	
	if IsSpouses(varMap, varPlayer, varTalknpc) ~= 1 then
		return "很抱歉，您所在的队伍中成员不是夫妻关系，无法领取本任务。";
	end		
	
	local varHaveQuest = IsHaveQuest(varMap, varTalknpc, x300352_var_QuestId)
	if varHaveQuest == 1 then
		return "您的配偶有" .. x300352_var_QuestName .. "，无法接取本任务。"
	end
	
	varHaveQuest = IsHaveQuest(varMap, varPlayer, x300352_var_QuestId)
	if varHaveQuest == 1 then
		return "您有" .. x300352_var_QuestName .. "，无法接取本任务。"
	end
	
	local varBusID  =  GetBusId(varMap, varPlayer)
	if varBusID == -1 then
		return "您不负责护送，所以无法领取任务：" .. x300352_var_QuestName
	else
		if 0 >= IsValidMyselfBus(varMap, varPlayer, x300352_var_FatherQuestId) then
			return "您护送的目标不在附近，无法接取本任务。"
		end
	end
	
	
	
	
	
	StartItemTask(varMap)
  ItemAppend( varMap, x300352_var_QuestItem, 1 )
  local varRet = StopItemTask(varMap,varPlayer)
  if varRet <= 0 then
  		return "您物品栏已满，请整理。"
  end
  
  StartItemTask(varMap)
  ItemAppend( varMap, x300352_var_QuestItem, 1 )
  varRet = StopItemTask(varMap,varTalknpc)
  if varRet <= 0 then
  		return "您配偶的物品栏已满，您的配偶需要整理物品栏。"
  end                 
  
	return nil
end

function x300352_DoAccept( varMap, varPlayer )
	
	local week = GetWeek()
	
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
		return "很抱歉，您与配偶不在有效的距离内，无法进行本任务。";
	end
	
	if IsSpouses(varMap, varPlayer, varTalknpc) ~= 1 then
		return "很抱歉，您所在的队伍中成员不是夫妻关系，无法领取本任务。";
	end		
	
	local varToday = GetDayOfYear()
	
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetNearTeamMember(varMap, varPlayer, varI)
		local completeDay = GetPlayerGameData(varMap, varTalknpc, MD_SPOUSE_MISSION_DATE[1][1], MD_SPOUSE_MISSION_DATE[1][2],MD_SPOUSE_MISSION_DATE[1][3])
		if( completeDay == varToday) then
			return "您队伍中有人领取了本任务，今天无法接取本任务。"
		end
	end
	
	local varHaveQuest = IsHaveQuest(varMap, varPlayer, x300352_var_QuestId)
	if varHaveQuest == 1 then
		return "您已经接取了本任务，快去完成吧。"
	end
	
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetNearTeamMember(varMap, varPlayer, varI)
		local varHaveQuest = IsHaveQuest(varMap, varTalknpc, x300352_var_QuestId)
		if varHaveQuest == 1 then
			return "您队伍中有人有本任务，无法接取本任务。"
		end
	end

	for varI = 0, varTeamSize - 1 do
		local aId = GetNearTeamMember(varMap, varPlayer, varI)
		local aName = GetName(varMap, aId)
		local errorCode = AddQuestNM( varMap, aId, x300352_var_QuestId )
		if errorCode ~= 1 then
			Msg2Player(varMap,varPlayer,"添加任务失败！",8,2)
		end
	end

	return nil
end







function x300352_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )
	local retCode = x300352_SubmitFatherQuestCheck(varMap, varPlayer, varTalknpc)
	if retCode ~= nil then
		Msg2Player(varMap,varPlayer,retCode,8,2)
		StartTalkTask(varMap)
		TalkAppendString(varMap, retCode);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
		
		
		
		
		
	end
	
	StartTalkTask(varMap)

	TalkAppendString(varMap,"")
	TalkAppendString(varMap,"")

	
	TalkAppendString(varMap,"")
	TalkAppendString(varMap,"#Y【夫妻】护送孩童#W#r\t谢谢你们把阿离送回来，一路上辛苦了。#r\t我这里没有什么稀罕东西，这是我从波斯带来的：@item_13080010#W。拿着它去大都中间点燃，您的另一半一定会喜欢的！")

	StopTalkTask()
  DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300352_var_FileId, x300352_var_QuestId);
end









function x300352_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsMarried(varMap, varPlayer) ~= 1 then
		return
	end
	if IsHaveQuestNM( varMap, varPlayer, x300352_var_FatherQuestId ) == 1 then
		TalkAppendButton(varMap, x300352_var_FileId, x300352_var_FatherQuestName, 7, -1)
	end
	
end









function x300352_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	
		return 1
	
end






function x300352_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	local varStr = x300352_DoAccept( varMap, varPlayer )
	if varStr ~= nil then
		Msg2Player(varMap,varPlayer,varStr,8,2)
	end
	
end









function x300352_ProcQuestAbandon(varMap, varPlayer, varQuest)
	DelQuestNM( varMap, varPlayer, varQuest )
	
	
	local message = "您放弃了夫妻任务"
	StartTalkTask(varMap);
		TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 4, 2);
	
	if DelItem(varMap, varPlayer,x300352_var_QuestItem,1) ~= 1 then return 0 end
	
	x300352_SetQuestData(varMap, varPlayer)
	
	
	local spouseGuid = GetSpouseGUID( varMap, varPlayer )
	local spouseName = GetFriendName( varMap, varPlayer, tonumber(spouseGuid) )
	SendScriptPost( varMap, spouseName, MAIL_DELETE_MISSION, x300352_var_QuestId, 0, 0, varPlayer )
	
end









function x300352_CheckSubmit( varMap, varPlayer, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then
		return 0;
	end
	return 1
end








function x300352_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	local submitRetCode = x300352_SubmitFatherQuestCheck(varMap, varPlayer, varTalknpc)
	if submitRetCode ~= nil then
		Msg2Player(varMap,varPlayer,submitRetCode,8,2)
		return
	end
	
	local retCode = x300352_AcceptCheck(varMap, varPlayer)
	if retCode ~= nil then
		Msg2Player(varMap,varPlayer,retCode,8,2)
		return
	end

	local spouseId = GetTeamSceneMember(varMap, varPlayer, 0);
	
	x300352_SetQuestComplete(varMap, varPlayer, x300352_var_FatherQuestId )
	x300352_SetQuestComplete(varMap, spouseId, x300352_var_FatherQuestId )
	local varRet = x300352_IsQuestComplete( varMap, varPlayer, x300352_var_FatherQuestId )
	if varRet > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您完成了任务:【夫妻】护送孩童");
		StopTalkTask();
		Msg2Player(varMap,varPlayer,"您完成了任务:【夫妻】护送孩童",8,2)
		DeliverTalkTips(varMap, varPlayer);
		
		DelQuestNM( varMap, varPlayer, x300352_var_FatherQuestId )
		local errorCode = AddQuestNM( varMap, varPlayer, x300352_var_QuestId )
		if errorCode ~= 1 then
			Msg2Player(varMap,varPlayer,"添加任务失败！",8,2)
		end
	end

	varRet = x300352_IsQuestComplete( varMap, spouseId, x300352_var_FatherQuestId )
	if varRet > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您完成了任务:【夫妻】护送孩童");
		StopTalkTask();
		Msg2Player(varMap,spouseId,"您完成了任务:【夫妻】护送孩童",8,2)
		DeliverTalkTips(varMap, spouseId);
		
		DelQuestNM( varMap, spouseId, x300352_var_FatherQuestId )
		local errorCode = AddQuestNM( varMap, spouseId, x300352_var_QuestId )
		if errorCode ~= 1 then
			Msg2Player(varMap,spouseId,"添加任务失败！",8,2)
		end
	end

	local varBusID  =  GetBusId(varMap, varPlayer)
	if varBusID ~= -1 then
		if (IsObjValid (varMap,varBusID) == 1) and x300352_var_FatherQuestId == GetBusQuestID(varMap, varBusID ) then
			DeleteBus(varMap, varBusID,1)
		end
	end

	StartItemTask(varMap)
  ItemAppend( varMap, x300352_var_QuestItem, 1 )
  local varRet = StopItemTask(varMap,varPlayer)
  if varRet > 0 then
      DeliverItemListSendToPlayer(varMap,varPlayer)
  end
  
  StartItemTask(varMap)
  ItemAppend( varMap, x300352_var_QuestItem, 1 )
  varRet = StopItemTask(varMap,spouseId)
  if varRet > 0 then
      DeliverItemListSendToPlayer(varMap,spouseId)
  end
  
	return 0
	
end









function x300352_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end







function x300352_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
end

function x300352_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
	
end

function x300352_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	if IsHaveQuestNM( varMap, varPlayer, x300352_var_QuestId ) == 0 then	
		return 0
	end
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300352_var_QuestId )
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 1 ) == 1 then
		return 0
	end
	
	local scene = 0
	local posx = 254
	local posz = 272
	local radii = 10
	if scene == -1 or varMap ~= scene then 
		return 0
	end
	
	if posx > 0 then 
		local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )

		local distanceRet = radii * radii - (posx - PlayerPosX) * (posx - PlayerPosX) - (posz - PlayerPosZ) * (posz - PlayerPosZ)
		if distanceRet <= 0 then
			local varText = format("很抱歉，这里不能使用该物品，请到@sceneid_%d(%d,%d)处使用!", scene, posx, posz )
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap, varPlayer)
			return 0
		end
	end
	
	local retCode = x300352_DoUseItem(varMap, varPlayer)
	if retCode ~= nil then
			StartTalkTask(varMap)
			TalkAppendString(varMap, retCode)
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			return
	end

	StartTalkTask(varMap)
	TalkAppendString(varMap, "天空绽放出美丽的烟花")
	StopTalkTask(varMap)
	DeliverTalkTips(varMap, varPlayer)
	
	
	if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end

	
	if varImpact ~= -1 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, varImpact, 0);
	end
	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, 1 )
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300352_var_QuestId )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )

	return 1
	
end

function x300352_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300352_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300352_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x300352_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x300352_QuestLogRefresh( varMap, varPlayer, varQuest)

	StartTalkTask(varMap)	
	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = 1000 *0.4*10* varLevel
	    if varExpBonus > 0 then
			AddQuestExpBonus(varMap,  varExpBonus);
		end	
	AddQuestLogCustomText( varMap,
							"标题",						
							"" .. x300352_var_QuestName,        
							"  去@npc_72049点燃礼花",		
							"@npc_139117",			
							"",               
							"到达大都@npc_72049处，和您的爱人一起观赏心心相映礼花后，到@npc_139117那里领取任务奖励",	
							""					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
end

function x300352_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	x300352_QuestLogRefresh( varMap, varPlayer, varQuest );
end

function x300352_CheckSubmitNPC( varMap,varPlayer,idScript,idQuest,varTalkNpcGUID )
	if IsHaveQuestNM( varMap, varPlayer, x300352_var_FatherQuestId ) == 0 then
		
		return 0
	end
	for varI, npcItem in SPOUSE_NPC do
		if npcItem == varTalkNpcGUID then
			return 1
		end
	end
	return 0
end
