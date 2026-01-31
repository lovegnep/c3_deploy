





x418400_var_FileId 		= 418400 

x418400_var_LevelMin		=	1






function x418400_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418400_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418400_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418400_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418400_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418400_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418400_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030759, 1 )	--新浪披风
		ItemAppendBind( varMap, 11000302, 2 )	--国传灵魂印
		ItemAppendBind( varMap, 12054300, 5 )	--还童书
		ItemAppendBind( varMap, 12030758, 1 )	--五道杠时装

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了新浪披风、国传灵魂印、还童书和五道杠时装。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			AddMoney(varMap, varPlayer, 1, 100000)
			GamePlayScriptLog(varMap, varPlayer, 2658) 
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有4个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418400_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
