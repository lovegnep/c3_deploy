





x418366_var_FileId 		= 418366

x418366_var_LevelMin		=	1






function x418366_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418366_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418366_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418366_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418366_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418366_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418366_var_LevelMin then
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
			ItemAppend( varMap, 20030001, 1 ) --机枢·苍狼
			message = "获得了机枢·苍狼"
		elseif varRand <= 2 then
			ItemAppend( varMap, 20030002, 1 ) --机枢·猛虎
			message = "获得了机枢·猛虎"
		elseif varRand <= 3 then
			ItemAppend( varMap, 20030003, 1 ) --机枢·暴熊
			message = "获得了机枢·暴熊"
		end
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			message = "打开战车机枢大礼包，"..message
			Msg2Player( varMap, varPlayer, message, 8, 2)
			Msg2Player( varMap, varPlayer, message, 8, 3)
			GamePlayScriptLog( varMap, varPlayer, 2595)
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







function x418366_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
