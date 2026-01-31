





x418314_var_FileId 		= 418314

x418314_var_LevelMin		=	60






function x418314_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418314_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418314_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418314_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418314_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418314_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418314_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 11990051, 10 )	--回魂丹
		ItemAppendBind( varMap, 12041101, 10 )	--修行草
		ItemAppendBind( varMap, 12041108, 10 )	--荣誉之星
		ItemAppendBind( varMap, 11990110, 10 )	--募集券
		ItemAppendBind( varMap, 11990115, 8 )	--原生钻石矿
		ItemAppendBind( varMap, 11000300, 9 )	--灵魂印

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开怯薛探马补偿包，获得10个回魂丹、10个修行草、10个荣誉之星等道具")
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
		TalkAppendString(varMap,"背包空间不足，需要6个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418314_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
