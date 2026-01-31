





x418747_var_FileId 		= 418747

x418747_var_LevelMin		=	1






function x418747_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418747_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418747_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418747_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418747_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418747_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418747_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030801, 1 )
		ItemAppendBind( varMap, 11990110, 1 )
		ItemAppendBind( varMap, 12030016, 2 )
		ItemAppendBind( varMap, 11990011, 2 )

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包将获得小钱包（100两银卡）、募集卷X1、队伍召集令X2、三番令X2。")
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







function x418747_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
