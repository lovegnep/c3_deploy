

x300838_var_GrowpointId = 729 
x300838_var_ItemIndex = 13080024 
x300838_var_FarScriptId = 300615



function 	x300838_ProcGpCreate(varMap,growPointType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x300838_var_GrowpointId, varMap, 0, x300838_var_ItemIndex)
end




function	 x300838_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x300838_var_FarScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x300838_var_GrowpointId, x300838_var_ItemIndex)
end




function	 x300838_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x300838_var_FarScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x300838_var_GrowpointId, x300838_var_ItemIndex)
end





function	x300838_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x300838_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end
