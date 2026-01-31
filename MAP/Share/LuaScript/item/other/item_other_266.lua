





x418266_var_FileId 		= 418266

x418266_var_LevelMin		=	1






function x418266_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418266_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418266_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418266_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418266_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418266_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418266_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12050241, 1 )	--喜鹊降世符
		ItemAppendBind( varMap, 11990011, 2 )	--三番令
		ItemAppendBind( varMap, 11000200, 3 )	--世传水晶
		ItemAppendBind( varMap, 12266785, 1 )	--小钱包

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开特权卡，获得喜鹊降世符1个、三番令2个、世传水晶3个、小钱包1个")
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
		TalkAppendString(varMap,"背包空间不足，需要4个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418266_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
