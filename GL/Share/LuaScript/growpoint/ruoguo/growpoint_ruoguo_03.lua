

x301434_var_GatherPointTypeId = 713 
x301434_var_ItemId = -1 
x301434_var_TargetScriptId = 310210



function 	x301434_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301434_var_GatherPointTypeId, varMap, 0, x301434_var_ItemId)
end




function	 x301434_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301434_var_TargetScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301434_var_GatherPointTypeId, x301434_var_ItemId )
end




function	 x301434_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301434_var_TargetScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301434_var_GatherPointTypeId, x301434_var_ItemId )
end





function	x301434_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( x301434_var_TargetScriptId, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


