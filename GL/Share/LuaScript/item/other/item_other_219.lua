





x418219_var_FileId = 418219
x418219_var_ItemList = {}
x418219_var_LevelMin = 1	






function x418219_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418219_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418219_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418219_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418219_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418219_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418219_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030012, 2 )	
		ItemAppendBind( varMap, 12050289, 1 )
		ItemAppendBind( varMap, 10300153, 1 )
		ItemAppendBind( varMap, 12030540, 1 )
		ItemAppendBind( varMap, 19010007, 1 )
		ItemAppendBind( varMap, 11000200, 10 )
		ItemAppendBind( varMap, 11050001, 10 )
		ItemAppendBind( varMap, 12031001, 10 )
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了路易十三2个，神马降世符1个，真爱一生礼服1个，贺岁红包1个，布袋包1个，世传水晶10个，初级龙眼石10个，单凤求凰10个")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有8个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	


end







function x418219_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
