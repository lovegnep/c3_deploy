

x301436_var_GatherPointTypeId = 715 
x301436_var_ItemId = -1 
x301436_var_TargetScriptId = 310210



function 	x301436_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301436_var_GatherPointTypeId, varMap, 0, x301436_var_ItemId)
end




function	 x301436_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301436_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301436_var_GatherPointTypeId, x301436_var_ItemId )
end




function	 x301436_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301436_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301436_var_GatherPointTypeId, x301436_var_ItemId )
end





function	x301436_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301436_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


