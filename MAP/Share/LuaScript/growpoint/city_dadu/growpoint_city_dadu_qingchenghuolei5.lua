

x301088_var_GatherPointTypeId = 213 
x301088_var_ItemId = -1 
x301088_var_TargetScriptId = 300576



function 	x301088_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301088_var_GatherPointTypeId, varMap, 0, x301088_var_ItemId)
end




function	 x301088_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301088_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301088_var_GatherPointTypeId, x301088_var_ItemId )
end




function	 x301088_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301088_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301088_var_GatherPointTypeId, x301088_var_ItemId )
end





function	x301088_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301088_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


