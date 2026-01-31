





x418001_var_FileId 		= 418001 
x418001_var_ItemId 			= 11000200
x418001_var_Item_Count	=	50
x418001_var_LevelMin		=	1






function x418001_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418001_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418001_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418001_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418001_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418001_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418001_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, x418001_var_ItemId, x418001_var_Item_Count )
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







function x418001_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
