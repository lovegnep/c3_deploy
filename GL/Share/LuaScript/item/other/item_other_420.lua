





x418420_var_FileId 		= 418420

x418420_var_LevelMin		=	1






function x418420_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418420_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418420_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418420_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418420_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418420_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12250002, 5 )
	ItemAppendBind( varMap, 12030775, 1 )
	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了5个精品芝华士和1个掌门牌碎片",8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2685)
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







function x418420_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
