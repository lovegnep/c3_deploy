
x300941_var_FileId 					= 300941
x300941_var_QuestName				= "【国家】查询领主战外援" 
x300941_var_Leader_Index              = 5




function x300941_ProcEnumEvent( varMap, varPlayer, varTalknpc )

	
	local nGuildID = GetGuildID(varMap,varPlayer)
	if nGuildID < 0 then
		return
	end
	
	
	local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= x300941_var_Leader_Index then
        return
    end
    
    
    local nHumanGUID = GetPlayerGUID( varMap,varPlayer )
    local nCountryId,nKingGUID,szKingName,nCountryGold = GetCountrySimpleData( varMap,varPlayer )
    if nKingGUID <= 0 or nHumanGUID == nKingGUID then
    	return    	
    end
	
	 
    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_QINGLONG_LEADER) == 1 then
    	return
    end
    
    
    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_ZHUQUE_LEADER) == 1 then
    	return
    end
    
    
    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_KING) == 1 then
    	return
    end
    
    
    TalkAppendButton(varMap,x300941_var_FileId,x300941_var_QuestName,3,x300941_var_FileId);
    
end




function x300941_ProcEventEntry(varMap, varPlayer,varTalknpc,varScript,idExt )
	
	if idExt ~=  x300941_var_FileId then
		return
	end

	
	local nGuildID = GetGuildID(varMap,varPlayer)
	if nGuildID < 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领主战场外援查询#W#r\t操作失败,您没有帮会。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end
	
	
	local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= x300941_var_Leader_Index then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领主战场外援查询#W#r\t操作失败,您不是帮主。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
        return
    end
    
    
    local nHumanGUID = GetPlayerGUID( varMap,varPlayer )
    local nCountryId,nKingGUID,szKingName,nCountryGold = GetCountrySimpleData( varMap,varPlayer )
    if nKingGUID <= 0 or nHumanGUID == nKingGUID then
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领主战场外援查询#W#r\t操作失败,没有国王。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	return    	
    end
	
	 
    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_QINGLONG_LEADER) == 1 then
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领主战场外援查询#W#r\t操作失败,青龙帮会不能执行。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	return
    end
    
    
    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_ZHUQUE_LEADER) == 1 then
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领主战场外援查询#W#r\t操作失败,朱雀帮会不能执行。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	return
    end
    
    
    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_KING) == 1 then
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领主战场外援查询#W#r\t操作失败,国王帮会不能执行。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	return
    end
	
	
	SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,varTalknpc)
	GameBattleLairdRequestPlayerAidList(varMap,varPlayer,x300941_var_FileId);
	
	return 0

end 




function x300941_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end




function x300941_ProcPlayerAidBegin(varMap,nPlayerAidCount )
	
	StartTalkTask(varMap)
	if nPlayerAidCount <= 0 then
		TalkAppendString(varMap, "#Y【国家】领主战场外援列表:#W#r\当前没有外援！");
	else
		TalkAppendString(varMap, "#Y【国家】领主战场外援列表:#W#r");
	end
end




function x300941_ProcAddPlayerAid(varMap,nPlayerAidGUID,strPlayerAidName,nouse1 )
	
	TalkAppendButton(varMap,x300941_var_FileId,strPlayerAidName,3,nPlayerAidGUID);	
end




function x300941_ProcPlayerAidEnd(varMap,varPlayer )

	
	local varTalknpc = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end




function x300941_ProcAccept( varMap, varPlayer )
end




function x300941_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x300941_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x300941_CheckSubmit( varMap, varPlayer )
end




function x300941_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x300941_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x300941_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300941_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
