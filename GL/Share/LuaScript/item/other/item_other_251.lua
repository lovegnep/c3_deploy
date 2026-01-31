





x418251_var_FileId 		= 418251 

x418251_var_LevelMin		=	30






function x418251_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418251_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418251_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418251_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418251_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418251_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418251_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11990011, 7 )	--三番令
		ItemAppendBind( varMap, 12041101, 5 )	--修行草
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了三番令和修行草")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有2个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418251_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
