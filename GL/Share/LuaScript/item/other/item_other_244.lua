





x418244_var_FileId = 418244
x418244_var_ItemList = {}
x418244_var_LevelMin = 1	






function x418244_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418244_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418244_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418244_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418244_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418244_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418244_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000630, 8   )	
		ItemAppendBind( varMap, 11000866, 99  )	
		ItemAppendBind( varMap, 11000871, 99  )	
		ItemAppendBind( varMap, 11000876, 99  )	
		ItemAppendBind( varMap, 11000881, 99  )	
		ItemAppendBind( varMap, 11000886, 99  )	
		ItemAppendBind( varMap, 11000908, 250 )	
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			local str ="打开冥甲大礼包，获得了幽冥之华，单纹水蓝石等道具"
			
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有7个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	


end







function x418244_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
