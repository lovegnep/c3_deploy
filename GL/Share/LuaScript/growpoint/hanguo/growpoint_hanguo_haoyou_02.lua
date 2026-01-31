

x302002_var_GatherPointTypeId = 422 
x302002_var_ItemId = 13013702 



function 	x302002_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x302002_var_GatherPointTypeId, varMap, 0, x302002_var_ItemId)
end




function	 x302002_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 300782, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x302002_var_GatherPointTypeId, x302002_var_ItemId )
end




function	 x302002_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 300782, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x302002_var_GatherPointTypeId, x302002_var_ItemId )
end





function	x302002_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( 300782, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



