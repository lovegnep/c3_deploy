





x418450_var_FileId 		= 418450

x418450_var_LevelMin		=	1






function x418450_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418450_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418450_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418450_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418450_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418450_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 11000936, 10 ) 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,format("打开礼包，获得了%d个@item_%d", 10,11000936),8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 3011)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418450_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
