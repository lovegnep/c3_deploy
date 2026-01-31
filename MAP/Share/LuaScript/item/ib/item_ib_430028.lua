













x430028_var_FileId = 430028 





function x430028_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x430028_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430028_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430028_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end

	if GetPlayerVigor(varMap, varPlayer) >= GetPlayerMaxVigor(varMap, varPlayer) then
		local varText = "您的活力值已满，不需要此物品"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		return 0
	end
	
	
	local day = GetDayOfYear()
	local rday = GetPlayerGameData(varMap,varPlayer,MD_HUOLIDAN_DAY[1],MD_HUOLIDAN_DAY[2],MD_HUOLIDAN_DAY[3])
	if day == rday then
		local varText = "距上次使用时间不到一天，使用失败"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		return 0
	end

	return 1; 
end







function x430028_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x430028_ProcActivateOnce( varMap, varPlayer )
	
	local day = GetDayOfYear()
	local rday = GetPlayerGameData(varMap,varPlayer,MD_HUOLIDAN_DAY[1],MD_HUOLIDAN_DAY[2],MD_HUOLIDAN_DAY[3])
	if day ~= rday then
		SetPlayerVigor(varMap, varPlayer, GetPlayerVigor(varMap, varPlayer) + 10000 )
		SetPlayerGameData(varMap,varPlayer,MD_HUOLIDAN_DAY[1],MD_HUOLIDAN_DAY[2],MD_HUOLIDAN_DAY[3],day)
	end
	return 1;
end







function x430028_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
