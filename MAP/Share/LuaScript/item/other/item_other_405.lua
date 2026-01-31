





x418405_var_FileId 		= 418405 

x418405_var_LevelMin		=	1






function x418405_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418405_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418405_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418405_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418405_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418405_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418405_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030266, 1 )	--银龙时装
		ItemAppendBind( varMap, 12030016, 2 )	--队伍召集令
		ItemAppendBind( varMap, 12010020, 1 )	--小生命清露
		ItemAppendBind( varMap, 12041101, 1 )	--修行草
		ItemAppendBind( varMap, 12031002, 10 )	--五彩缤纷

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了银龙时装、队伍召集令、小生命清露、修行草和五彩缤纷。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			AddMoney(varMap, varPlayer, 1, 50000)
			GamePlayScriptLog(varMap, varPlayer, 2663) 
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有5个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418405_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
