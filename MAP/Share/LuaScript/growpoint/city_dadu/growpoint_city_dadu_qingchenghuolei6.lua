

x301089_var_GatherPointTypeId = 214 
x301089_var_ItemId = -1 
x301089_var_TargetScriptId = 300576



function 	x301089_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301089_var_GatherPointTypeId, varMap, 0, x301089_var_ItemId)
end




function	 x301089_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301089_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301089_var_GatherPointTypeId, x301089_var_ItemId )
end




function	 x301089_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301089_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301089_var_GatherPointTypeId, x301089_var_ItemId )
end





function	x301089_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301089_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


