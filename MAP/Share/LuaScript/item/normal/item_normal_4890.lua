





x404890_var_FileId = 404890
x404890_var_ItemList = {}
x404890_var_LevelMin = 30






function x404890_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404890_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404890_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404890_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end

    
    if GetPlayerGameData( varMap, varPlayer, MD_YUEBING_BOX_DATE[ 1], MD_YUEBING_BOX_DATE[ 2], MD_YUEBING_BOX_DATE[ 3] ) == GetDayOfYear() then
        Msg2Player( varMap, varPlayer, "距上次开启礼盒时间不到一天，使用失败", 8, 3)
		return 0
    end

    
	if GetLevel(varMap, varPlayer)< x404890_var_LevelMin then
        Msg2Player( varMap, varPlayer, format( "等级不足#R%d#cffcc00级，无法使用此物品", x404890_var_LevelMin), 8, 3)
		return 0
	end

	
    local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
    local firstTime = GetItemParam( varMap, varPlayer, varBagIdx, 8, 2)
	local currtime = GetCurrentTime()
	if firstTime ~= 0 and currtime - firstTime > 604800 then 
		Msg2Player( varMap, varPlayer, "已过保存期限无法使用", 8, 3)
		return 0
	end

	local varItem =  x404890_Yuebing(varMap,varPlayer)	

	StartItemTask(varMap)
		if varItem ~= -1 then
			ItemAppendBind( varMap,varItem,1 )	
		end	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
	else
		Msg2Player( varMap, varPlayer, "背包已满，无法得到物品！您需要至少有1个背包空间！", 8, 3)
		return 0
	end

	SetPlayerGameData( varMap, varPlayer, MD_YUEBING_BOX_DATE[ 1], MD_YUEBING_BOX_DATE[ 2], MD_YUEBING_BOX_DATE[ 3], GetDayOfYear() )

	return 1; 
end







function x404890_ProcDeplete( varMap, varPlayer)
    local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
    local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)
    local result = 1

    
    if curTimes == 7 then
        SetItemParam( varMap, varPlayer, varBagIdx, 8, 2, GetCurrentTime() )
    end

    if curTimes <= 1 then
        
        if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
    else
        
        SetBagItemMultTimes( varMap, varPlayer, varBagIdx, curTimes - 1)
        result = 0
    end

	return result
end








function x404890_ProcActivateOnce( varMap, varPlayer, varImpact )

end







function x404890_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x404890_Yuebing(varMap,varPlayer)
	
	local nLevel = GetLevel(varMap,varPlayer)
	local yuebing = -1
	if nLevel < 40  then
		yuebing = 12030251
	elseif nLevel >=40 and nLevel < 50 then
		yuebing = 12030252
	elseif nLevel >=50 and nLevel < 60 then	
		yuebing = 12030253
	elseif nLevel >=60 and nLevel < 70 then
		yuebing = 12030254
	elseif nLevel >=70 and nLevel < 80 then
		yuebing = 12030255
	elseif nLevel >=80 and nLevel < 90 then
		yuebing = 12030256
	elseif nLevel >=90 then
		yuebing = 12030257	
	end
	
	return yuebing

end







function x404890_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

