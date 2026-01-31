

x301087_var_GatherPointTypeId = 212 
x301087_var_ItemId = -1 
x301087_var_TargetScriptId = 300576



function 	x301087_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301087_var_GatherPointTypeId, varMap, 0, x301087_var_ItemId)
end




function	 x301087_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301087_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301087_var_GatherPointTypeId, x301087_var_ItemId )
end




function	 x301087_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301087_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301087_var_GatherPointTypeId, x301087_var_ItemId )
end





function	x301087_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301087_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

