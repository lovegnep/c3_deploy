





x418299_var_FileId 		= 418299

x418299_var_LevelMin		=	1






function x418299_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418299_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418299_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418299_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418299_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418299_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418299_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030320, 1 )--10两小钱包
		ItemAppendBind( varMap, 11000200, 20 )--世传水晶×20
		ItemAppendBind( varMap, 10222008, 1 ) --安全卫士披风
		ItemAppendBind( varMap, 12110206, 5 ) --钟情一生×5
		ItemAppendBind( varMap, 12041101, 3 )--修行草x3

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开奇虎披风新手包，获得1个小钱包，20个世传水晶，1个安全卫士披风等道具。")
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
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418299_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
