

x302005_var_GatherPointTypeId = 425 
x302005_var_ItemId = 13013705 



function 	x302005_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x302005_var_GatherPointTypeId, varMap, 0, x302005_var_ItemId)
end




function	 x302005_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 300782, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x302005_var_GatherPointTypeId, x302005_var_ItemId )
end




function	 x302005_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 300782, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x302005_var_GatherPointTypeId, x302005_var_ItemId )
end





function	x302005_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( 300782, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



