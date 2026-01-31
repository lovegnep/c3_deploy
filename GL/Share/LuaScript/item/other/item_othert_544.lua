





x432544_var_FileId = 432544
x432544_var_ItemList = {}
x432544_var_LevelMin = 1	






function x432544_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x432544_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x432544_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x432544_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x432544_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x432544_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x432544_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 12271320, 1 )
	ItemAppendBind( varMap, 12271314, 1 )
	ItemAppendBind( varMap, 12271310, 6 )
	ItemAppendBind( varMap, 12271321, 1 )
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有4个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x432544_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
