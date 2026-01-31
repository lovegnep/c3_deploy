

x300832_var_GrowpointId = 726 
x300832_var_ItemIndex = 13011510 
x300832_var_FarScriptId = 300615



function 	x300832_ProcGpCreate(varMap,growPointType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x300832_var_GrowpointId, varMap, 0, x300832_var_ItemIndex)
end




function	 x300832_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x300832_var_FarScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x300832_var_GrowpointId, x300832_var_ItemIndex )
end




function	 x300832_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x300832_var_FarScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x300832_var_GrowpointId, x300832_var_ItemIndex )
end





function	x300832_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x300832_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end
