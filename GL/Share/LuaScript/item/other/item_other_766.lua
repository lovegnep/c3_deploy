





x418766_var_FileId 		= 418766

x418766_var_LevelMin		=	1






function x418766_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418766_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418766_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418766_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418766_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418766_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418766_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000501, 5 )
		ItemAppendBind( varMap, 11000360, 5 )
		ItemAppendBind( varMap, 11000902, 5 )		
		ItemAppendBind( varMap, 11010001, 5 )		
		ItemAppendBind( varMap, 11000550, 10 )		

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得：紫檀木炭*5、云杉木炭*5、高级洗石剂*5等。")
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
		TalkAppendString(varMap,"背包剩余空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418766_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
