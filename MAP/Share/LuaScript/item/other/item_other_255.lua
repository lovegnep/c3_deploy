





x418255_var_FileId 		= 418255 

x418255_var_LevelMin		=	1






function x418255_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418255_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418255_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418255_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418255_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418255_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418255_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030586, 1 )	--大灾变回归包（60级）
		ItemAppendBind( varMap, 12030587, 1 )	--大灾变回归包（65级）
		ItemAppendBind( varMap, 12030588, 1 )	--大灾变回归包（70级）
		ItemAppendBind( varMap, 12030589, 1 )	--大灾变回归包（75级）
		ItemAppendBind( varMap, 12030590, 1 )	--大灾变回归包（80级）
		ItemAppendBind( varMap, 12030591, 1 )	--大灾变回归包（85级）
    ItemAppendBind( varMap, 12030592, 1 )	--大灾变回归包（90级）
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了7个大灾变大礼包")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有7个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418255_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
