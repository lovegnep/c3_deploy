





x418600_var_FileId 		= 418600

x418600_var_LevelMin		=	1






function x418600_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418600_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418600_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418600_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418600_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418600_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418600_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030319, 1 )	
		ItemAppendBind( varMap, 11000200, 10 )
    ItemAppendBind( varMap, 12110206, 5 )
    ItemAppendBind( varMap, 11990011, 5 )
    ItemAppendBind( varMap, 12041101, 3 )
    ItemAppendBind( varMap, 12030952, 1 )


	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得小钱包、世传水晶*10、钟情一生*5、三番令*5、修行草*3、草原之星时装。")
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







function x418600_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
