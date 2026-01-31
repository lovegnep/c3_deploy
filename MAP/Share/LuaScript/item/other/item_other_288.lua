





x418288_var_FileId 		= 418288

x418288_var_LevelMin		=	1






function x418288_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418288_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418288_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418288_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418288_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418288_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418288_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000503, 1 )	--黄紫晕光水银
		ItemAppendBind( varMap, 11000504, 1 ) --黄紫炫彩水银

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开黄紫水银包，获得1个黄紫晕光水银和1个黄紫炫彩水银。")
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







function x418288_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
