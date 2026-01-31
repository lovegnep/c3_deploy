

x301084_var_GatherPointTypeId = 209 
x301084_var_ItemId = -1 
x301084_var_TargetScriptId = 300576



function 	x301084_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301084_var_GatherPointTypeId, varMap, 0, x301084_var_ItemId)
end




function	 x301084_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301084_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301084_var_GatherPointTypeId, x301084_var_ItemId )
end




function	 x301084_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301084_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301084_var_GatherPointTypeId, x301084_var_ItemId )
end





function	x301084_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301084_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


