

x301085_var_GatherPointTypeId = 210 
x301085_var_ItemId = -1 
x301085_var_TargetScriptId = 300576



function 	x301085_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301085_var_GatherPointTypeId, varMap, 0, x301085_var_ItemId)
end




function	 x301085_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301085_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301085_var_GatherPointTypeId, x301085_var_ItemId )
end




function	 x301085_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301085_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301085_var_GatherPointTypeId, x301085_var_ItemId )
end





function	x301085_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301085_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


