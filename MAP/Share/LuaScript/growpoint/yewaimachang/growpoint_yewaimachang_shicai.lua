
x301520_var_GatherPointTypeId = 938

x301520_var_ItemId = 13810450 



function 	x301520_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301520_var_GatherPointTypeId, varMap, 0, x301520_var_ItemId)
end




function	 x301520_ProcGpOpen(varMap,varPlayer,varTalknpc)
	 if IsPlayerStateNormal( varMap, varPlayer) ~= 1 then
        return 1
    end
    
    --没有任务
    if IsHaveQuest( varMap, varPlayer, x301520_GetvarQuest( varMap, varPlayer )) <= 0 then
        return 1
    end
    
    --任务已完成
    local misIndex = GetQuestIndexByID( varMap, varPlayer, x301520_GetvarQuest( varMap, varPlayer )) 
    if GetQuestParam( varMap, varPlayer, misIndex, 7) == 1 then
        return 1
    end

	return 0
end




function	 x301520_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 if IsPlayerStateNormal( varMap, varPlayer) ~= 1 then
        return 1
    end
    
    --没有任务
    if IsHaveQuest( varMap, varPlayer, x301520_GetvarQuest( varMap, varPlayer )) <= 0 then
        return 1
    end
    
    --任务已完成
    local misIndex = GetQuestIndexByID( varMap, varPlayer, x301520_GetvarQuest( varMap, varPlayer )) 
    if GetQuestParam( varMap, varPlayer, misIndex, 7) == 1 then
        return 1
    end
	StartItemTask(varMap)
	ItemAppend( varMap, x301520_var_ItemId, 1 )	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,format("获得@item_%d！",x301520_var_ItemId))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		DeliverItemListSendToPlayer( varMap, varPlayer)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	return 0
end





function	x301520_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

function x301520_GetvarQuest( varMap, varPlayer )
	local varQuest = {10280,10281,10282,10283}
    local country = GetCurCountry( varMap, varPlayer )
    return varQuest[country+1]
end
