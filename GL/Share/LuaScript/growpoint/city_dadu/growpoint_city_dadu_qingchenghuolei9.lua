

x301092_var_GatherPointTypeId = 217 
x301092_var_ItemId = -1 
x301092_var_TargetScriptId = 300576



function 	x301092_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301092_var_GatherPointTypeId, varMap, 0, x301092_var_ItemId)
end




function	 x301092_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301092_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301092_var_GatherPointTypeId, x301092_var_ItemId )
end




function	 x301092_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301092_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301092_var_GatherPointTypeId, x301092_var_ItemId )
end





function	x301092_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301092_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


