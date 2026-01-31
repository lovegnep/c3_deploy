

x301435_var_GatherPointTypeId = 714 
x301435_var_ItemId = -1 
x301435_var_TargetScriptId = 310210



function 	x301435_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301435_var_GatherPointTypeId, varMap, 0, x301435_var_ItemId)
end




function	 x301435_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301435_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301435_var_GatherPointTypeId, x301435_var_ItemId )
end




function	 x301435_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301435_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301435_var_GatherPointTypeId, x301435_var_ItemId )
end





function	x301435_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301435_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

