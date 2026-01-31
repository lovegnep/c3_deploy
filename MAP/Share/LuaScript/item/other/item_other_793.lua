





x418793_var_FileId 		= 418793

x418793_var_LevelMin		=	1






function x418793_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418793_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418793_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418793_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418793_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418793_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418793_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000715, 5000 )
		ItemAppendBind( varMap, 12271410, 500  )
		ItemAppendBind( varMap, 11000356, 1000 )		
		ItemAppendBind( varMap, 12271408, 10   )				
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开获得礼包道具。")
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







function x418793_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
