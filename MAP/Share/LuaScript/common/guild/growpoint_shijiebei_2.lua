

x300834_var_GrowpointId = 728 
x300834_var_ItemIndex = 13080024 
x300834_var_FarScriptId = 300615



function 	x300834_ProcGpCreate(varMap,growPointType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x300834_var_GrowpointId, varMap, 0, x300834_var_ItemIndex)
end




function	 x300834_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x300834_var_FarScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x300834_var_GrowpointId, x300834_var_ItemIndex)
end




function	 x300834_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x300834_var_FarScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x300834_var_GrowpointId, x300834_var_ItemIndex)
end





function	x300834_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x300834_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end
