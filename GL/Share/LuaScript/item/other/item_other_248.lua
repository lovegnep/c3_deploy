





x418248_var_FileId 		= 418248 

x418248_var_LevelMin		=	1






function x418248_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418248_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418248_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418248_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418248_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418248_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418248_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppend( varMap, 12030580, 1 )	--大灾变礼包（20级）
		ItemAppend( varMap, 12030581, 1 )	--大灾变礼包（30级）
		ItemAppend( varMap, 12030582, 1 )	--大灾变礼包（40级）
		ItemAppend( varMap, 12030583, 1 )	--大灾变礼包（50级）
		ItemAppend( varMap, 12030584, 1 )	--大灾变礼包（60级）

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了5个大灾变大礼包")
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







function x418248_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
