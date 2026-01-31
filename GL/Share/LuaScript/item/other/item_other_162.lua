





x418162_var_FileId 		= 418162 

x418162_var_LevelMin		=	-1






function x418162_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418162_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418162_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418162_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end











function x418162_GiveBonus( varMap,varPlayer)
	
end








function x418162_ProcActivateOnce( varMap, varPlayer, varImpact )

    local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
    
    local lastUseTime = GetItemParam( varMap, varPlayer, varBagIdx, 8, 2)
    local curTime = GetCurrentTime()
    if lastUseTime > 0 and curTime - lastUseTime < 2592000 then 
        Msg2Player( varMap, varPlayer, "距离上次使用不足30天", 8, 3)
        return
    end
    local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)
	local uMoney = 0
	if curTimes == 4 then
		uMoney = 200*1000
	elseif curTimes==3 then
		uMoney = 250*1000
	elseif curTimes== 2 then
		uMoney = 300*1000
	elseif curTimes== 1 then
		uMoney = 350*1000
	end
	AddMoney(varMap, varPlayer, 3, uMoney)
	GamePlayScriptLog( varMap, varPlayer, 1951)
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







function x418162_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x418162_ProcDeplete( varMap, varPlayer)
	return 1
end
