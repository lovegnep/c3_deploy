





x418360_var_FileId 		= 418360

x418360_var_LevelMin		=	1






function x418360_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418360_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418360_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418360_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418360_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418360_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418360_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 10306015, 1 )--五好少年时装1个
		ItemAppendBind( varMap, 12030031, 1 )--神行符1个
		ItemAppendBind( varMap, 12030016, 2 )--队伍召集令2个
		ItemAppendBind( varMap, 12030320, 1 )--小钱包1个
		ItemAppendBind( varMap, 19010002, 1 )--布袋包1个
		ItemAppendBind( varMap, 12110206, 5 )--钟情一生（玫瑰花）5个
		ItemAppendBind( varMap, 12031011, 10 )--囧（烟花）10个

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开五道杠私奔包，获得1个五好少年时装，1个神行符和2个队伍召集令等。")
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







function x418360_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
