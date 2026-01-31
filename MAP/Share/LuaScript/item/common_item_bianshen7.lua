











x930006_var_FileId = 930006 








function x930006_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930006_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930006_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930006_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	
	local varMsg = nil
	local varBusID  =  GetBusId(varMap, varPlayer)
	if varBusID ~= -1 then
		varMsg = "很抱歉，乘坐公车或护送状态不能使用蒙面巾。"
	elseif 14 == varMap then
		varMsg = "很抱歉，在舞厅不能使用蒙面巾。"
	elseif 2 == GetSceneType(varMap) then
		varMsg = "很抱歉，当前地图不能使用蒙面巾。"
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







function x930006_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x930006_ProcActivateOnce( varMap, varPlayer )
	if DepletingUsedItem(varMap, varPlayer) == 1 then
		local impact = 32006
		--if GetSex(varMap, varPlayer) > 0 then
			--impact = 7661
		--end
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, impact, 0);
	end
	return 1;
end







function x930006_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
