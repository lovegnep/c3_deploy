





x418378_var_FileId 		= 418378

x418378_var_LevelMin		=	1






function x418378_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418378_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418378_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418378_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418378_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418378_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418378_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030031, 1 )--神行符1个
		ItemAppendBind( varMap, 12030016, 2 )--队伍召集令2个
		ItemAppendBind( varMap, 12030320, 1 )--小钱包1个
		ItemAppendBind( varMap, 19010002, 1 )--布袋包1个
		ItemAppendBind( varMap, 12110206, 5 )--钟情一生（玫瑰花）5个
		ItemAppendBind( varMap, 12031011, 10 )--囧（烟花）10个
		ItemAppendBind( varMap, 10306015, 1 )--五好少年时装1个
		ItemAppendBind( varMap, 10222011, 1 )--多彩披风1个
		
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开多彩新手卡，获得1个神行符，2个队伍召集令，1个五好少年时装和1个多彩披风等。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 2637)
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







function x418378_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
