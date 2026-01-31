





x432518_var_FileId = 432518
x432518_var_ItemList = {}
x432518_var_LevelMin = 1	






function x432518_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x432518_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x432518_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x432518_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x432518_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x432518_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x432518_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
	StartItemTask(varMap)
		if IsItemBind(varMap,varPlayer,varBagIdx) == 0 then
		ItemAppend( varMap,10306016, 1 )	
	else
		ItemAppendBind( varMap,10306016, 1 )
	end	
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x432518_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
