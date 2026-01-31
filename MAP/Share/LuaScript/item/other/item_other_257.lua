





x418257_var_FileId 		= 418257 

x418257_var_LevelMin		=	65






function x418257_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418257_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418257_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418257_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418257_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418257_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418257_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000503, 1 )	--黄紫晕光水银
		ItemAppendBind( varMap, 12030254, 20 )	--六味月饼
		ItemAppendBind( varMap, 12041101, 20 )	--修行草

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了黄紫晕光水银、六味月饼和修行草")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418257_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
