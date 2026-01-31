

x301432_var_GatherPointTypeId = 711 
x301432_var_ItemId = -1 
x301432_var_TargetScriptId = 310210



function 	x301432_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301432_var_GatherPointTypeId, varMap, 0, x301432_var_ItemId)
end




function	 x301432_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301432_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301432_var_GatherPointTypeId, x301432_var_ItemId )
end




function	 x301432_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301432_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301432_var_GatherPointTypeId, x301432_var_ItemId )
end





function	x301432_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301432_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


