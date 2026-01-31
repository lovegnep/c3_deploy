













x430006_var_FileId = 430006 





function x430006_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x430006_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430006_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430006_ProcConditionCheck( varMap, varPlayer )
	
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

	return 1; 
end







function x430006_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x430006_ProcActivateOnce( varMap, varPlayer )
	SetPlayerVigor(varMap, varPlayer, GetPlayerVigor(varMap, varPlayer) + 100 )
	return 1;
end







function x430006_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
