





x418003_var_FileId 		= 418003 
x418003_var_ItemId 			= 11000201
x418003_var_Item_Count	=	100
x418003_var_LevelMin		=	40






function x418003_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418003_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418003_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418003_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418003_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418003_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418003_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, x418003_var_ItemId, x418003_var_Item_Count )
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

			
		
		
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418003_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
