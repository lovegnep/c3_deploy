





x418417_var_FileId 		= 418417

x418417_var_LevelMin		=	1






function x418417_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418417_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418417_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418417_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418417_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418417_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 10306066, 1 ) 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,format("打开礼包，获得了%d个@item_%d", 1,10306066),8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2682)
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







function x418417_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
