

x301086_var_GatherPointTypeId = 211 
x301086_var_ItemId = -1 
x301086_var_TargetScriptId = 300576



function 	x301086_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301086_var_GatherPointTypeId, varMap, 0, x301086_var_ItemId)
end




function	 x301086_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301086_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301086_var_GatherPointTypeId, x301086_var_ItemId )
end




function	 x301086_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301086_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301086_var_GatherPointTypeId, x301086_var_ItemId )
end





function	x301086_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301086_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


