





x418418_var_FileId 		= 418418

x418418_var_LevelMin		=	1






function x418418_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418418_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418418_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418418_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418418_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418418_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 11000936, 25 ) 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,format("打开礼包，获得了%d个@item_%d", 25,11000936),8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2683)
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







function x418418_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
