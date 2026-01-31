





x418195_var_FileId 		= 418195

x418195_var_LevelMin		=	1






function x418195_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418195_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418195_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418195_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418195_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418195_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418195_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 19010007, 1 )--布袋包
		ItemAppendBind( varMap, 12010020, 1 )--小生命清露
		ItemAppendBind( varMap, 12041101, 1 )--修行草
		ItemAppendBind( varMap, 12030031, 1 )--神行符

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开新星麒麟大礼包，获得1个布袋包，1个小生命清露，1个修行草和1个神行符。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 2623)
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







function x418195_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
