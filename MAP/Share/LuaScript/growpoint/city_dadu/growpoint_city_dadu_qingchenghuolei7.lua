

x301090_var_GatherPointTypeId = 215 
x301090_var_ItemId = -1 
x301090_var_TargetScriptId = 300576



function 	x301090_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301090_var_GatherPointTypeId, varMap, 0, x301090_var_ItemId)
end




function	 x301090_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301090_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301090_var_GatherPointTypeId, x301090_var_ItemId )
end




function	 x301090_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301090_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301090_var_GatherPointTypeId, x301090_var_ItemId )
end





function	x301090_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301090_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


