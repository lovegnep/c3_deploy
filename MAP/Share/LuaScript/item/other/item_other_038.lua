





x418038_var_FileId = 418038
x418038_var_ItemList = {}
x418038_var_LevelMin = 30	






function x418038_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418038_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418038_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418038_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418038_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418038_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418038_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 12030321, 1 )	
	ItemAppendBind( varMap, 11000200, 5 )	
	ItemAppendBind( varMap, 11050001, 5 )	
	
	ItemAppendBind( varMap, 14040001, 1 )	
	ItemAppendBind( varMap, 11000100, 1 )
	ItemAppendBind( varMap, 12010200, 3 )
	ItemAppendBind( varMap, 12050000, 1 )

	local HorseNum = GetHorseCount(varMap,varPlayer)
	local nLevel = GetLevel(varMap,varPlayer)
	local tHNum = 0
	local settrue = 0

	if nLevel < 10 then 
		tHNum = 1
	elseif nLevel >= 10 and nLevel < 20 then
		tHNum = 2
	elseif nLevel >= 20 and nLevel < 30 then
		tHNum = 3
	elseif nLevel >= 30 and nLevel < 40 then
		tHNum = 4
	elseif nLevel >= 40 and nLevel < 50 then
		tHNum = 5
	elseif nLevel >= 50 then
		tHNum = 6
	end

	if tHNum > HorseNum then
		settrue = 1
	else
		settrue = 0
	end

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 and settrue > 0 then
		
		local a = CreateHorseToPlayer(varMap,varPlayer,3630,-1)
		
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具！")
			TalkAppendString(varMap,"恭喜您获得喜鹊坐骑！")
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
		TalkAppendString(varMap,"背包或者坐骑已满，无法得到物品！您需要至少有7个背包空间和1个坐骑空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418038_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
