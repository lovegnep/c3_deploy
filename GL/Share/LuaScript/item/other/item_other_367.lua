





x418367_var_FileId 		= 418367

x418367_var_LevelMin		=	1






function x418367_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418367_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418367_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418367_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418367_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418367_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418367_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		local varRand = random (1,3)
		local message = ""
		if varRand <= 1 then
			ItemAppend( varMap, 20050001, 1 ) --龙击炮·冰冻
			message = "获得了龙击炮·冰冻"
		elseif varRand <= 2 then
			ItemAppend( varMap, 20050002, 1 ) --龙击炮·毒疫
			message = "获得了龙击炮·毒疫"
		elseif varRand <= 3 then
			ItemAppend( varMap, 20050003, 1 ) --龙击炮·碎甲
			message = "获得了龙击炮·碎甲"
		end
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			message = "打开战车龙击炮大礼包，"..message
			Msg2Player( varMap, varPlayer, message, 8, 2)
			Msg2Player( varMap, varPlayer, message, 8, 3)
			GamePlayScriptLog( varMap, varPlayer, 2596)
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







function x418367_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
