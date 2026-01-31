

x301091_var_GatherPointTypeId = 216 
x301091_var_ItemId = -1 
x301091_var_TargetScriptId = 300576



function 	x301091_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301091_var_GatherPointTypeId, varMap, 0, x301091_var_ItemId)
end




function	 x301091_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301091_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301091_var_GatherPointTypeId, x301091_var_ItemId )
end




function	 x301091_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301091_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301091_var_GatherPointTypeId, x301091_var_ItemId )
end





function	x301091_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301091_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


