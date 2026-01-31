





x418390_var_FileId 		= 418390 

x418390_var_LevelMin		=	1






function x418390_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418390_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418390_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418390_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418390_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418390_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418390_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppend( varMap, 12030667, 1 )	--回归感恩礼包（20级）
		ItemAppend( varMap, 12030668, 1 )	--回归感恩礼包（30级）
		ItemAppend( varMap, 12030669, 1 )	--回归感恩礼包（40级）
		ItemAppend( varMap, 12030670, 1 )	--回归感恩礼包（50级）
		ItemAppend( varMap, 12030671, 1 )	--回归感恩礼包（60级）

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了5个回归感恩礼包")
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







function x418390_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
