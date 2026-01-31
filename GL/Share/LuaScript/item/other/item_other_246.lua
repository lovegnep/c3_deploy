





x418246_var_FileId = 418246
x418246_var_ItemList = {}
x418246_var_LevelMin = 1	






function x418246_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418246_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418246_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418246_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418246_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418246_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418246_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000831, 99 )	
		ItemAppendBind( varMap, 11000832, 99 )	
		ItemAppendBind( varMap, 11000834, 99 )	
		ItemAppendBind( varMap, 11000835, 99 )	
		ItemAppendBind( varMap, 11000836, 99 )	
		ItemAppendBind( varMap, 11000837, 99 )	
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			local str ="打开冥甲大礼包，获得了副手图谱，战甲图谱等道具"
			
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有6个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	


end







function x418246_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
