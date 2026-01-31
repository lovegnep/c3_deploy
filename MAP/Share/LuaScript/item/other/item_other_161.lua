





x418161_var_FileId 		= 418161 

x418161_var_LevelMin		=	-1






function x418161_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418161_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418161_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418161_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end











function x418161_GiveBonus( varMap,varPlayer)
	
end








function x418161_ProcActivateOnce( varMap, varPlayer, varImpact )

    local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
    
    local lastUseTime = GetItemParam( varMap, varPlayer, varBagIdx, 8, 2)
    local curTime = GetCurrentTime()
    if lastUseTime > 0 and curTime - lastUseTime < 2592000 then 
        Msg2Player( varMap, varPlayer, "距离上次使用不足30天", 8, 3)
        return
    end
    local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)
	local uMoney = 100*1000

	AddMoney(varMap, varPlayer, 3, uMoney)
	GamePlayScriptLog( varMap, varPlayer, 1941)
	local varStr = format("获得了#{_MONEY%d}金卡的奖励。", uMoney)
    Msg2Player(varMap,varPlayer,varStr,8,2)
    Msg2Player(varMap,varPlayer,varStr,8,3)
    SetItemParam( varMap, varPlayer, varBagIdx, 8, 2, curTime)
	
	if curTimes <= 1 then
        
        if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
    else
        
        SetBagItemMultTimes( varMap, varPlayer, varBagIdx, curTimes - 1)
    end
end







function x418161_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x418161_ProcDeplete( varMap, varPlayer)
	return 1
end
