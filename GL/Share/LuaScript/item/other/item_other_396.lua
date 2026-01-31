





x418396_var_FileId 		= 418396 

x418396_var_LevelMin		=	50






function x418396_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418396_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418396_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418396_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418396_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418396_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418396_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了银卡400两，金卡10两")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			--DeliverItemListSendToPlayer(varMap,varPlayer)
			
			local uMoney = 400000
			AddMoney(varMap, varPlayer, 1, uMoney)
			GamePlayScriptLog( varMap, varPlayer, 1951)
			local str = format("获得了#{_MONEY%d}银卡的奖励。", uMoney)
		    Msg2Player(varMap,varPlayer,str,8,2)
		    Msg2Player(varMap,varPlayer,str,8,3)
		    
		    local uMoney = 10000
			AddMoney(varMap, varPlayer, 3, uMoney)
			GamePlayScriptLog( varMap, varPlayer, 1951)
			local str = format("获得了#{_MONEY%d}金卡的奖励。", uMoney)
		    Msg2Player(varMap,varPlayer,str,8,2)
		    Msg2Player(varMap,varPlayer,str,8,3)
		    
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418396_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
