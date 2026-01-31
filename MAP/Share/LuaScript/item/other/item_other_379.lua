





x418379_var_FileId 		= 418379

x418379_var_LevelMin		=	1






function x418379_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418379_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418379_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418379_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418379_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418379_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418379_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030726, 1 )--多彩豆豆虎降世符大礼包1个
		ItemAppendBind( varMap, 12030727, 1 )--多彩掌门牌大礼包1个
		ItemAppendBind( varMap, 10296073, 1 )--多彩手镯1个
		
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开多彩虎威大礼包，获得1个多彩豆豆虎降世符大礼包，1个多彩掌门牌大礼包等。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 2638)
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







function x418379_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
