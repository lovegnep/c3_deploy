





x418401_var_FileId 		= 418401 

x418401_var_LevelMin		=	1






function x418401_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418401_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418401_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418401_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418401_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418401_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418401_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030016, 3 )	--队伍召集令
		ItemAppendBind( varMap, 12041101, 1 )	--修行草
		ItemAppendBind( varMap, 12030012, 20 )	--路易十三
		ItemAppendBind( varMap, 11010001, 3 )	--一级皇家秘银

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了队伍召集令、修行草、路易十三和一级皇家秘银。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			AddMoney(varMap, varPlayer, 1, 100000)
			GamePlayScriptLog(varMap, varPlayer, 2659) 
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







function x418401_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
