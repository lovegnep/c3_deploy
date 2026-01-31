





x418371_var_FileId 		= 418371

x418371_var_LevelMin		=	1






function x418371_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418371_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418371_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418371_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418371_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418371_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418371_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 10310005, 1 )--掌门牌：碰碰胡(永不磨损)

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开掌门牌：碰碰胡礼包，获得1个掌门牌：碰碰胡(永不磨损)。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 2620)
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







function x418371_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
