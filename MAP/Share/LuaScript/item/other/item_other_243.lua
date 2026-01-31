





x418243_var_FileId = 418243
x418243_var_ItemList = {}
x418243_var_LevelMin = 1	






function x418243_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418243_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418243_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418243_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418243_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418243_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418243_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local item =random(12035220,12035227)
	
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, item, 1 )	
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			local str =format("打开特权卡，获得了1个@item_%d",item)
			
			StartTalkTask(varMap)
			TalkAppendString(varMap,str)
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	


end







function x418243_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
