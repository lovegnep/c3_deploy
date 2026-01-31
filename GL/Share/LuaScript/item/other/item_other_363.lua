





x418363_var_FileId 		= 418363

x418363_var_LevelMin		=	1






function x418363_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418363_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418363_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418363_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418363_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418363_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418363_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		local varRand = random (1,4)
		local message = ""
		if varRand <= 1 then
			ItemAppend( varMap, 20000001, 1 ) --车身·风翼战车
			message = "获得了车身·风翼战车"
		elseif varRand <= 2 then
			ItemAppend( varMap, 20000002, 1 ) --车身·独冲战车
			message = "获得了车身·独冲战车"
		elseif varRand <= 3 then
			ItemAppend( varMap, 20000003, 1 ) --车身·奎甲战车
			message = "获得了车身·奎甲战车"
		elseif varRand <= 4 then
			ItemAppend( varMap, 20000004, 1 ) --车身·雷爪战车
			message = "获得了车身·雷爪战车"
		end
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			message = "打开战车车身大礼包，"..message
			Msg2Player( varMap, varPlayer, message, 8, 2)
			Msg2Player( varMap, varPlayer, message, 8, 3)
			GamePlayScriptLog( varMap, varPlayer, 2592)
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







function x418363_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
