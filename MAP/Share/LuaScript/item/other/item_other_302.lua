





x418302_var_FileId 		= 418302

x418302_var_LevelMin		=	1






function x418302_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418302_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418302_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418302_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418302_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418302_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418302_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000908, 15 )--蓝光珐琅15个
		ItemAppendBind( varMap, 11000606, 1 )--四级冥铁

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开鎏金霞影大礼包，获得15个蓝光珐琅和1个四级冥铁。")
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
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418302_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
