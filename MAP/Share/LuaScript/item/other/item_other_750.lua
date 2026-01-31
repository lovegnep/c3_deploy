





x418750_var_FileId 		= 418750

x418750_var_LevelMin		=	1






function x418750_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418750_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418750_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418750_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418750_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418750_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418750_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030202, 1 )
		ItemAppendBind( varMap, 12030200, 1 )
		ItemAppendBind( varMap, 12035282, 1 )
		ItemAppendBind( varMap, 12035281, 1 )

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包将获得江湖请柬X1、小喇叭X1、无限极乐草（7天）、修理神铁（7天）。")
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
		TalkAppendString(varMap,"背包剩余空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418750_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
