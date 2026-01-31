





x418124_var_FileId = 418124
x418124_var_ItemList = {}
x418124_var_LevelMin = 1	






function x418124_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418124_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418124_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418124_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418124_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418124_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418124_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 19010009, 1 )	
		ItemAppendBind( varMap, 10310028, 1 )	
		ItemAppendBind( varMap, 11000501, 50 )	
		ItemAppendBind( varMap, 12054301, 20 )	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)

			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
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







function x418124_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
