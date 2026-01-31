





x418326_var_FileId 		= 418326 

x418326_var_LevelMin		=	1






function x418326_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418326_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418326_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418326_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418326_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418326_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418326_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppend( varMap, 12500146, 1 )	--血与沙礼包（20级）
		ItemAppend( varMap, 12500147, 1 )	--血与沙礼包（30级）
		ItemAppend( varMap, 12500148, 1 )	--血与沙礼包（40级）
		ItemAppend( varMap, 12500149, 1 )	--血与沙礼包（50级）
		ItemAppend( varMap, 12500150, 1 )	--血与沙礼包（60级）

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了5个血与沙礼包")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有5个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418326_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
