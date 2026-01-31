




x430013_var_FileId 		= 430013 





function x430013_ProcEventEntry( varMap, varPlayer, varBagIdx)

end






function x430013_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430013_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end






function x430013_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end
	return 1; 
end







function x430013_ProcDeplete( varMap, varPlayer)
    
    
   	
	local playerName = GetFindPlayerItemName(varMap, varPlayer)

	if GetName(varMap, varPlayer) == playerName then	
		Msg2Player(varMap, varPlayer,"不能查找自己。", 8, 3)	
		Msg2Player(varMap, varPlayer,"不能查找自己。", 8, 2)	
		return 0
	end
	
	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
	local bLock = IsItemLocked(varMap, varPlayer, varBagIdx)
	if bLock > 0 then
		return 0
	end
	
    local bFlag = GetItemParam( varMap, varPlayer, varBagIdx, 8, 2)
    if bFlag == 1 then
    	return 0
	end
	
    SetItemParam( varMap, varPlayer, varBagIdx, 8, 2, 1)
    LockItem(varMap, varPlayer, varBagIdx)
    
	UseFindPlayerItem(varMap, varPlayer, playerName)
	
	GamePlayScriptLog(varMap, varPlayer, 1471)
    return 1
end








function x430013_ProcActivateOnce( varMap, varPlayer, varImpact)
   return 1
end







function x430013_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
