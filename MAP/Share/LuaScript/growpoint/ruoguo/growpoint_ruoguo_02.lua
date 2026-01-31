

x301433_var_GatherPointTypeId = 712 
x301433_var_ItemId = -1 
x301433_var_TargetScriptId = 310210



function 	x301433_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301433_var_GatherPointTypeId, varMap, 0, x301433_var_ItemId)
end




function	 x301433_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301433_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301433_var_GatherPointTypeId, x301433_var_ItemId )
end




function	 x301433_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301433_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301433_var_GatherPointTypeId, x301433_var_ItemId )
end





function	x301433_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301433_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


