





x418523_var_FileId 		= 418523

x418523_var_LevelMin		=	1






function x418523_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418523_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418523_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418523_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418523_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418523_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418523_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000205, 5 )	--11000210	精致的世传水晶	5
		ItemAppendBind( varMap, 10210010, 1 ) --10210010	新手徽章	1

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开前辈的馈赠（六），获得5个精致的世传水晶和1个新手徽章。")
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







function x418523_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
