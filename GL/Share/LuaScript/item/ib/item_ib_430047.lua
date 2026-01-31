
--高级体力丹












x430028_var_FileId = 430047 





function x430047_ProcEventEntry( varMap, varPlayer, varBagIdx )
		return 0;
end






function x430047_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430047_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430047_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end

	if GetPlayerPhysicalForce(varMap, varPlayer) >= GetPlayerMaxPhysicalForce(varMap, varPlayer) then
		local varText = "您的体力值已满，不需要此物品"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		return 0
	end
	
	
	local day = GetDayOfYear()
	local rday = GetPlayerGameData(varMap,varPlayer,MD_WUYILINGJIANG_DATE[1],MD_WUYILINGJIANG_DATE[2],MD_WUYILINGJIANG_DATE[3])
	if day == rday then
		local varText = "每天只能使用一个体力丹！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		return 0
	end

	return 1; 
end







function x430047_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x430047_ProcActivateOnce( varMap, varPlayer )
	local day = GetDayOfYear()
	local rday = GetPlayerGameData(varMap,varPlayer,MD_WUYILINGJIANG_DATE[1],MD_WUYILINGJIANG_DATE[2],MD_WUYILINGJIANG_DATE[3])
	if day ~= rday then
		local varTili = GetPlayerPhysicalForce(varMap, varPlayer)+500
		SetPlayerPhysicalForce(varMap, varPlayer,varTili)
		SetPlayerGameData(varMap,varPlayer,MD_WUYILINGJIANG_DATE[1],MD_WUYILINGJIANG_DATE[2],MD_WUYILINGJIANG_DATE[3],day)
		local varText = "您的体力恢复了500点"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
	end
	return 1;
end







function x430047_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
