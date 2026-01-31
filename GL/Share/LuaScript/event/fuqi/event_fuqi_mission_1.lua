
--DECLARE_QUEST_INFO_START--
x300350_var_FileId = 300350
x300350_var_LevelLess = 40
--DECLARE_QUEST_INFO_STOP--

x300350_var_QuestId = SPOUSE_TASK[1]
x300350_var_FatherQuestId = SPOUSE_TASK[3]
x300350_var_FatherQuestName = "【夫妻任务】"
x300350_var_QuestName ="【夫妻任务】"
x300350_var_QuestItem = 13080009

function x300350_IsQuestComplete(varMap, varPlayer, varQuest) 
  local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
  return GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
end
function x300350_SetQuestData(varMap, varPlayer)
		SetPlayerGameData(varMap, varPlayer, MD_SPOUSE_MISSION_DATE[1][1], MD_SPOUSE_MISSION_DATE[1][2], MD_SPOUSE_MISSION_DATE[1][3], GetDayOfYear())
end

function x300350_SubmitFatherQuestCheck(varMap, varPlayer, varTalknpc)
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
	
	if GetSex(varMap, varPlayer) == 0 then
		return "很抱歉，只有男性才能提交本任务。";
	end
	
	if IsHaveQuestNM( varMap, varPlayer, x300350_var_FatherQuestId ) ~= 1 then
		return "您没有本任务，无法提交本任务。"
	end
	
	if IsHaveQuestNM( varMap, varTalknpc, x300350_var_FatherQuestId ) ~= 1 then
		return "您的配偶没有本任务，无法提交本任务。"
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300350_var_FatherQuestId )
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )  <= 0 then
		return "您未完成本任务，无法提交本任务。"
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varTalknpc, x300350_var_FatherQuestId )
	if GetQuestParam( varMap, varTalknpc, varQuestIdx, 1 ) <= 0 then
		return "您的配偶未完成本任务，无法提交本任务。"
	end
	
	return nil
end






function x300350_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )
	if IsHaveQuestNM( varMap, varPlayer, x300350_var_FatherQuestId ) == 1 then
		
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300350_var_FatherQuestId )
		if GetQuestParam( varMap, varPlayer, varQuestIdx, 1 ) == 1 then
			local submitRetCode = x300350_SubmitFatherQuestCheck(varMap, varPlayer, varTalknpc)
			if submitRetCode ~= nil then
				Msg2Player(varMap,varPlayer,submitRetCode,8,2)
				StartTalkTask(varMap)
				TalkAppendString(varMap, submitRetCode);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return
				
				
				
				
				
			end
			StartTalkTask(varMap)
		
			TalkAppendString(varMap,"")
			TalkAppendString(varMap,"")
	
			
			TalkAppendString(varMap,"")
			TalkAppendString(varMap,"#Y【夫妻】心心相映#W#r\t恭喜您，出色的完成了【夫妻任务】，祝福您夫妻二人白头偕老，永不分离！这是给你们的奖励，请收下！#r")
	
			local varLevel = GetLevel(varMap, varPlayer)
			local varExpBonus = 1000 *0.4*varLevel*10
			
				AddQuestExpBonus(varMap, varExpBonus);
			
			
			StopTalkTask()
		  DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300350_var_FileId, x300350_var_QuestId);
		  return
		else
			local varStr = "任务还没有完成 您还需要加把劲啊 ..."
			Msg2Player(varMap,varPlayer,varStr,8,2)
			return
			
			
			
			
			
		end
	end
	if IsHaveQuestNM( varMap, varTalknpc, x300350_var_QuestId ) ~= 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【夫妻】爱情紫晶")
		TalkAppendString(varMap,"\t您好，每周的周四，周六您可以在我这里进行【夫妻任务】。【夫妻任务】一共由三个任务组成。您必须完成全部三个任务才能够获得奖励。#r\t在大都的东门附近，生长着一种紫色的水晶。#r\t据说得到紫水晶的情侣会受到爱的祝福。#r\t到达大都@npc_72044，采集5个紫水晶回来交给@npc_140006，他正在收集带有爱意的紫水晶，将紫水晶交给他，就可以得到他对你们爱的祝福。")
		local varLevel = GetLevel(varMap, varPlayer)
		local varExpBonus = 1000 *0.4*10* varLevel
		TalkAppendString(varMap,"#Y奖励内容：#W#r经验值：" .. varExpBonus.."点")
		StopTalkTask(varMap)   
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300350_var_QuestId, x300350_var_FileId)
	end
	
end









function x300350_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if IsMarried(varMap, varPlayer) ~= 1 then
		return
	end
	local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x300350_var_QuestId)
	if IsHaveQuestNM( varMap, varPlayer, x300350_var_QuestId ) == 1 then
		return
	end
	if IsHaveQuestNM( varMap, varPlayer, SPOUSE_TASK[2] ) == 1 then
		return
	end
	
	if IsHaveQuestNM( varMap, varPlayer, x300350_var_FatherQuestId ) == 1 then
		varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x300350_var_FatherQuestId)
		TalkAppendButton(varMap, varQuest, x300350_var_FatherQuestName, varState, -1)
		return
	end
	TalkAppendButton(varMap, varQuest, x300350_var_QuestName, varState, -1)
	
end









function x300350_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	
		return 1
	
end








function x300350_CheckPushList(varMap, varPlayer, varTalknpc)
	return 1
end

function x300350_SendAcceptQuestMsg(varMap, varPlayer, varQuest)
	local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
	local message = format("您接受了任务：【夫妻】爱情紫晶", varQuestName);
	StartTalkTask(varMap);
		TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 4, 2);
end

function x300350_DoAccept( varMap, varPlayer )

	local week = GetWeek()
	local varToday = GetDayOfYear()
	if week ~= 4 and week ~= 6 then
		return"很抱歉，只有周四、周六，才能进行本任务！"    
	end
	
	if 1 == IsQuestFullNM(varMap, varPlayer) then
			return "很抱歉，您的任务已经满了，无法领取本任务。"
	end
	if HasTeam(varMap, varPlayer) ~= 1 then
		return "很抱歉，您还未进行组队无法领取本任务。"
	end
	
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	
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
	
	if 1 == IsQuestFullNM(varMap, varTalknpc) then
			return "很抱歉，您配偶的任务已经满了，无法领取本任务。"
	end
	
	local completeDay = GetPlayerGameData(varMap, varPlayer, MD_SPOUSE_MISSION_DATE[1][1], MD_SPOUSE_MISSION_DATE[1][2],MD_SPOUSE_MISSION_DATE[1][3])
	if completeDay == varToday then
		return "很抱歉，您今天已经顺利领取"
	end
	
	completeDay = GetPlayerGameData(varMap, varTalknpc, MD_SPOUSE_MISSION_DATE[1][1], MD_SPOUSE_MISSION_DATE[1][2],MD_SPOUSE_MISSION_DATE[1][3])
	if completeDay == varToday then
		return "您的配偶领取了本任务，今天无法接取本任务。"
	end
	
	
	
	local varHaveQuest = IsHaveQuest(varMap, varTalknpc, x300350_var_QuestId)
	if varHaveQuest == 1 then
		return "您的配偶有本任务，无法接取本任务。"
	end
		
	if AddQuestNM( varMap, varPlayer, x300350_var_QuestId ) ~= 1 then
		return "您添加任务失败，无法接取本任务。"
	end
	x300350_SetQuestData(varMap, varPlayer)
	x300350_SendAcceptQuestMsg( varMap, varPlayer, x300350_var_QuestId )
	
	if AddQuestNM( varMap, varTalknpc, x300350_var_QuestId ) ~= 1 then
		return "您的配偶添加任务失败，无法接取本任务。"
	end
	x300350_SetQuestData(varMap, varTalknpc)
	x300350_SendAcceptQuestMsg( varMap, varTalknpc, x300350_var_QuestId )
	
	return nil
end






function x300350_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	local varStr = x300350_DoAccept( varMap, varPlayer )
	if varStr ~= nil then
		Msg2Player(varMap,varPlayer,varStr,8,2)
		StartTalkTask(varMap)
		TalkAppendString(varMap,varStr);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		
	end
	
end









function x300350_ProcQuestAbandon(varMap, varPlayer, varQuest)
	DelQuestNM( varMap, varPlayer, varQuest )
	
	
	local message = "您放弃了夫妻任务"
	StartTalkTask(varMap);
		TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 4, 2);
	
	x300350_SetQuestData(varMap, varPlayer)
	
	
	local spouseGuid = GetSpouseGUID( varMap, varPlayer )
	local spouseName = GetFriendName( varMap, varPlayer, tonumber(spouseGuid) )
	SendScriptPost( varMap, spouseName, MAIL_DELETE_MISSION, x300350_var_QuestId, 0, 0, varPlayer )
end









function x300350_CheckSubmit( varMap, varPlayer, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then
		return 0;
	end
	return 1
end


function x300350_CalculateEXP(varLevel)
	local varExpBonus = 1000 *0.4*10* varLevel
	if varExpBonus > 0 then
		return varExpBonus
	end
	return 0
end





function x300350_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	local retCode = x300350_SubmitFatherQuestCheck(varMap, varPlayer, varTalknpc)
	if retCode ~= nil then
		Msg2Player(varMap,varPlayer,retCode,8,2)
		return
	end
	local spouseId = GetTeamSceneMember(varMap, varPlayer, 0);
	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = x300350_CalculateEXP(varLevel)
	local varRet = x300350_IsQuestComplete( varMap, varPlayer, x300350_var_FatherQuestId )
	if varRet > 0 then
		AddExp(varMap, varPlayer, varExpBonus);	
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您完成了任务：【夫妻任务】");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		local varReadme ="您完成了任务：【夫妻任务】#r获得#R经验"..varExpBonus.."点#o的奖励"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		DelQuestNM( varMap, varPlayer, x300350_var_FatherQuestId )
		x300350_SetQuestData(varMap, varPlayer)
	end

	local varRet = x300350_IsQuestComplete( varMap, spouseId, x300350_var_FatherQuestId )
	if varRet > 0 then
		local varLevel = GetLevel(varMap, spouseId)
		local varExpBonus = x300350_CalculateEXP(varLevel)
		AddExp(varMap, spouseId, varExpBonus);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您完成了任务：【夫妻任务】");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, spouseId);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, spouseId);
		local varReadme ="您完成了任务：【夫妻任务】#r获得#R经验"..varExpBonus.."点#o的奖励"
		Msg2Player(varMap,spouseId,varReadme,8,2)
		DelQuestNM( varMap, spouseId, x300350_var_FatherQuestId )
		x300350_SetQuestData(varMap, spouseId)
	end
	
end









function x300350_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end









function x300350_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x300350_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x300350_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x300350_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest, nChangeType)
    
  if varQuest == nil or varQuest < 0 then
      return
  end
  
  if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then
      return
  end
  
  if varItemData ~= x300350_var_QuestItem then
  	return
  end
    
	local NeedNum, ObjIndex = GetQuestNeedItemNumNM( varMap, varPlayer, varQuest, varItemData )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	
	if 1 == nChangeType then 
		local Num = GetItemCount( varMap, varPlayer, varItemData )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )
		if Num < NeedNum then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
		end
		x300350_RefreshItemNum( varMap, varPlayer, varQuest)
		return
	end
	
	if NeedNum > 0 then
		local Num = GetItemCount( varMap, varPlayer, varItemData )
		if Num < NeedNum then 
            if nChangeType == 0 then 
                StartTalkTask(varMap)
                local varText = format("#Y获得物品#G#{_ITEM%d}#Y: %d/%d", varItemData, Num, NeedNum )
                if varText == nil then
                    varText = "";
                end
                TalkAppendString( varMap, varText )
                StopTalkTask( varMap )
                DeliverTalkTips( varMap, varPlayer )
            end
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )         
		elseif Num == NeedNum then
			
            if nChangeType == 0 then 
                StartTalkTask(varMap)
                local varText = format( "#Y已完成获得物品#G#{_ITEM%d}#Y: %d/%d", varItemData, Num, NeedNum )
                if varText == nil then
                    varText = "";
                end
                TalkAppendString( varMap, varText )
                StopTalkTask( varMap )
                DeliverTalkTips( varMap, varPlayer )
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
            end
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )         
		end
	x300350_RefreshItemNum( varMap, varPlayer, varQuest)
	end
end
function x300350_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
	
end

function x300350_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x300350_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300350_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300350_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x300350_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x300350_RefreshItemNum( varMap, varPlayer, varQuest)
	x300350_QuestLogRefresh( varMap, varPlayer, varQuest)
end

function x300350_QuestLogRefresh( varMap, varPlayer, varQuest)
	StartTalkTask(varMap)
	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = 1000 *0.4*10* varLevel
    if varExpBonus > 0 then
		AddQuestExpBonus(varMap,  varExpBonus);
	end
		
	if varQuest == nil or varQuest < 0 then
        return
    end
    
    if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then
        return
    end
    
	local NeedNum, ObjIndex = GetQuestNeedItemNumNM( varMap, varPlayer, varQuest, x300350_var_QuestItem )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	local curNum = GetQuestParam(varMap, varPlayer, varQuestIdx, ObjIndex)
	local szTarget = "(" .. curNum .. "/" .. NeedNum .. ")"
	AddQuestLogCustomText( varMap,
							"标题",						
							"" .. x300350_var_QuestName,        
							"  去@npc_72044采集@item_13080009，交给@npc_140006" .. szTarget,		
							"@npc_140006",			
							"",               
							"\t在大都的东南普清寺附近，生长着一种紫色的水晶。#r\t据说得到紫水晶的情侣会受到爱的祝福。#r\t到达大都@npc_72044，采集5个紫水晶回来交给@npc_140006，他正在收集带有爱意的紫水晶，将紫水晶交给他，就可以得到他对您们爱的祝福。",	
							"【夫妻任务】进行的整个过程中，您必须与配偶形影不离，否则您将不能领取或提交任务！"					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
end

function x300350_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	x300350_QuestLogRefresh( varMap, varPlayer, varQuest );
end

function x300350_CheckSubmitNPC( varMap,varPlayer,idScript,idQuest,varTalkNpcGUID )
	if IsHaveQuestNM( varMap, varPlayer, x300350_var_FatherQuestId ) == 0 then
		
		return 0
	end
	for varI, npcItem in SPOUSE_NPC do
		if npcItem == varTalkNpcGUID then
			return 1
		end
	end
	return 0
end
