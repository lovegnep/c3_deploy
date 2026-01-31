





x418773_var_FileId 		= 418773

x418773_var_LevelMin		=	1






function x418773_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418773_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418773_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418773_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418773_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418773_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418773_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030801, 3 )
		ItemAppendBind( varMap, 11990110, 1 )
		ItemAppendBind( varMap, 12030016, 3 )		
		ItemAppendBind( varMap, 12030011, 20 )		
		ItemAppendBind( varMap, 12030012, 20 )		
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"右键点击打开，将获得银卡300两，募集卷1个，队伍召集令3个，4倍经验酒20个等。")
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







function x418773_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
