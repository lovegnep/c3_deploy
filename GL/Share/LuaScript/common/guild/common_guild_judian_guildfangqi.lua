x300939_var_FileId 					= 300939
x300939_var_QuestName				= "【国家】领主战外援管理" 
x300939_var_Leader_Index              = 5


x300939_var_Laird_Signup                  	= 300     
x300939_var_Laird_WaitBattle              	= 301     
x300939_var_Laird_BeginBattle             	= 302     
x300939_var_Laird_EndBattle               	= 303     




function x300939_ProcEnumEvent( varMap, varPlayer, varTalknpc )

	
	local nGuildID = GetGuildID(varMap,varPlayer)
	if nGuildID < 0 then
		return
	end
	
	
	local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= x300939_var_Leader_Index then
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
 
 	
    local nBattleStatus = LuaCallNoclosure(300918,"GetBattleState",varMap)
	if nBattleStatus ~= x300939_var_Laird_Signup then
		return
	end
    
    
    TalkAppendButton(varMap,x300939_var_FileId,x300939_var_QuestName,3,x300939_var_FileId);
    
end




function x300939_ProcEventEntry(varMap, varPlayer,varTalknpc,varScript,idExt )
	
	
    local nBattleStatus = LuaCallNoclosure(300918,"GetBattleState",varMap)
	if nBattleStatus ~= x300939_var_Laird_Signup then
		return
	end
	
	if idExt ==  x300939_var_FileId then

		
		local nGuildID = GetGuildID(varMap,varPlayer)
		if nGuildID < 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "#Y【国家】领主战场外援放弃#W#r\t操作失败,您没有帮会。");
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return
		end
		
		
		local pos = GetGuildOfficial(varMap, varPlayer)
		if pos ~= x300939_var_Leader_Index then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "#Y【国家】领主战场外援放弃#W#r\t操作失败,您不是帮主。");
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	        return
	    end
	    
	    
	    local nHumanGUID = GetPlayerGUID( varMap,varPlayer )
	    local nCountryId,nKingGUID,szKingName,nCountryGold = GetCountrySimpleData( varMap,varPlayer )
	    if nKingGUID <= 0 or nHumanGUID == nKingGUID then
	    	StartTalkTask(varMap)
			TalkAppendString(varMap, "#Y【国家】领主战场外援放弃#W#r\t操作失败,没有国王。");
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	    	return    	
	    end
		
		 
	    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_QINGLONG_LEADER) == 1 then
	    	StartTalkTask(varMap)
			TalkAppendString(varMap, "#Y【国家】领主战场外援放弃#W#r\t操作失败,青龙帮会不能执行。");
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	    	return
	    end
	    
	    
	    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_ZHUQUE_LEADER) == 1 then
	    	StartTalkTask(varMap)
			TalkAppendString(varMap, "#Y【国家】领主战场外援放弃#W#r\t操作失败,朱雀帮会不能执行。");
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	    	return
	    end
	    
	    
	    if IsSpecialCountryOffical(varMap,varPlayer,COUNTRY_POSITION_KING) == 1 then
	    	StartTalkTask(varMap)
			TalkAppendString(varMap, "#Y【国家】领主战场外援放弃#W#r\t操作失败,国王帮会不能执行。");
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	    	return
	    end
		
		
		SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,varTalknpc)
		GameBattleLairdRequestPlayerAidList(varMap,varPlayer,x300939_var_FileId);
		
		return 0
		
	else
		
		
		GameBattleLairdRequestCanclePlayerAidByGuildLeader(varMap,varPlayer,idExt)
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】领主战场外援放弃#W#r\t请求已经完成提交。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		return
		
	end
	
	

end 




function x300939_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end




function x300939_ProcPlayerAidBegin(varMap,nPlayerAidCount )
	
	StartTalkTask(varMap)
	if nPlayerAidCount <= 0 then
		TalkAppendString(varMap, "#Y【国家】领主战场外援列表:#W#r\当前没有外援！");
	else
		TalkAppendString(varMap, "#Y【国家】领主战场外援列表:#W#r");
	end
end




function x300939_ProcAddPlayerAid(varMap,nPlayerAidGUID,strPlayerAidName,nouse1 )
	
	TalkAppendButton(varMap,x300939_var_FileId,"放弃"..strPlayerAidName,3,nPlayerAidGUID);	
end




function x300939_ProcPlayerAidEnd(varMap,varPlayer )

	
	local varTalknpc = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end




function x300939_ProcAccept( varMap, varPlayer )
end




function x300939_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x300939_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x300939_CheckSubmit( varMap, varPlayer )
end




function x300939_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x300939_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x300939_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300939_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
