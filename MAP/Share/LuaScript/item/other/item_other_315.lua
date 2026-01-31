





x418315_var_FileId 		= 418315

x418315_var_LevelMin		=	60






function x418315_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418315_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418315_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418315_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418315_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418315_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418315_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11990051, 5 )	--回魂丹
		ItemAppendBind( varMap, 12041101, 5 )	--修行草
		ItemAppendBind( varMap, 12041108, 5 )	--荣誉之星
		ItemAppendBind( varMap, 11990110, 5 )	--募集券
		ItemAppendBind( varMap, 11990115, 1 )	--原生钻石矿

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开探马军饷大礼包，获得5个回魂丹、5个修行草、5个荣誉之星等道具")
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
		TalkAppendString(varMap,"背包空间不足，需要5个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418315_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
