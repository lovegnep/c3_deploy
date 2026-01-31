

x301083_var_GatherPointTypeId = 208 
x301083_var_ItemId = -1 
x301083_var_TargetScriptId = 300576



function 	x301083_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301083_var_GatherPointTypeId, varMap, 0, x301083_var_ItemId)
end




function	 x301083_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301083_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301083_var_GatherPointTypeId, x301083_var_ItemId )
end




function	 x301083_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301083_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301083_var_GatherPointTypeId, x301083_var_ItemId )
end





function	x301083_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301083_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


