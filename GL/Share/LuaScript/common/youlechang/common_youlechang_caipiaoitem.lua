





x310339_var_FileId = 310339
x310339_var_ItemList = {}
x310339_var_LevelMin = 30






function x310339_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x310339_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x310339_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x310339_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end

	
    local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
    local firstTime = GetItemParam( varMap, varPlayer, varBagIdx, 8, 2)
	local currtime = GetDayOfYear()
	if currtime ~= firstTime then
		Msg2Player( varMap, varPlayer, "一张过期的彩票，毫无价值", 8, 3)
		return 0
	end
	
	Msg2Player( varMap, varPlayer, format("乐透彩票的号码是:%d", GetItemParam( varMap, varPlayer, varBagIdx, 4, 2)), 8, 3)

	return 1; 
end







function x310339_ProcDeplete( varMap, varPlayer )
	
	return 1
end








function x310339_ProcActivateOnce( varMap, varPlayer, varImpact )

end







function x310339_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end







function x310339_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
