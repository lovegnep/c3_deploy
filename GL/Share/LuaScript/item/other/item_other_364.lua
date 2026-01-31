





x418364_var_FileId 		= 418364

x418364_var_LevelMin		=	1






function x418364_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418364_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418364_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418364_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418364_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418364_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418364_var_LevelMin then
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
			ItemAppend( varMap, 20010001, 1 ) --御行甲·苍狼
			message = "获得了御行甲·苍狼"
		elseif varRand <= 2 then
			ItemAppend( varMap, 20010002, 1 ) --御行甲·猛虎
			message = "获得了御行甲·猛虎"
		elseif varRand <= 3 then
			ItemAppend( varMap, 20010003, 1 ) --御行甲·暴熊
			message = "获得了御行甲·暴熊"
		end
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			message = "打开战车御行甲大礼包，"..message
			Msg2Player( varMap, varPlayer, message, 8, 2)
			Msg2Player( varMap, varPlayer, message, 8, 3)
			GamePlayScriptLog( varMap, varPlayer, 2593)
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







function x418364_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
