











x930002_var_FileId = 930002 








function x930002_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930002_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930002_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930002_ProcConditionCheck( varMap, varPlayer )
	
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







function x930002_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x930002_ProcActivateOnce( varMap, varPlayer )
	if DepletingUsedItem(varMap, varPlayer) == 1 then
		local impact = 32002
		--if GetSex(varMap, varPlayer) > 0 then
			--impact = 7661
		--end
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, impact, 0);
	end
	return 1;
end







function x930002_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
