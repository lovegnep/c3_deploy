

x300833_var_GrowpointId = 727 
x300833_var_ItemIndex = 13011510 
x300833_var_FarScriptId = 300615



function 	x300833_ProcGpCreate(varMap,growPointType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x300833_var_GrowpointId, varMap, 0, x300833_var_ItemIndex)
end




function	 x300833_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x300833_var_FarScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x300833_var_GrowpointId, x300833_var_ItemIndex )
end




function	 x300833_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x300833_var_FarScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x300833_var_GrowpointId, x300833_var_ItemIndex )
end





function	x300833_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x300833_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end
