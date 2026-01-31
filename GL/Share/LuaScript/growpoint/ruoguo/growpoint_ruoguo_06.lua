

x301437_var_GatherPointTypeId = 716 
x301437_var_ItemId = -1 
x301437_var_TargetScriptId = 310210



function 	x301437_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301437_var_GatherPointTypeId, varMap, 0, x301437_var_ItemId)
end




function	 x301437_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301437_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301437_var_GatherPointTypeId, x301437_var_ItemId )
end




function	 x301437_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301437_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301437_var_GatherPointTypeId, x301437_var_ItemId )
end





function	x301437_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301437_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


