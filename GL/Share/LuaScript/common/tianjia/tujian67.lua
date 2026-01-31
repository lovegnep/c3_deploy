











x587066_var_FileId = 587066 







function x587066_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x587066_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x587066_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x587066_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	
	local varMsg = nil
	local varBusID  =  GetBusId(varMap, varPlayer)
	if varBusID ~= -1 then
		varMsg = "很抱歉，乘坐公车或护送状态不能使用图鉴。"
	elseif 14 == varMap then
		varMsg = "很抱歉，在舞厅不能使用图鉴。"
	elseif 2 == GetSceneType(varMap) then
		varMsg = "很抱歉，当前地图不能使用图鉴。"
	end
	
	if varMsg ~= nil then
		StartTalkTask(varMap)
		TalkAppendString(varMap,varMsg)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	return 1; 
end







function x587066_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x587066_ProcActivateOnce( varMap, varPlayer )
	if DepletingUsedItem(varMap, varPlayer) == 1 then
		local impact = 22393
		if GetSex(varMap, varPlayer) > 0 then
			impact = 22392
		end
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, impact, 0);
	end
	return 1;
end







function x587066_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
