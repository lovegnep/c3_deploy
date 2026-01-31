

x302004_var_GatherPointTypeId = 424 
x302004_var_ItemId = 13013704 



function 	x302004_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x302004_var_GatherPointTypeId, varMap, 0, x302004_var_ItemId)
end




function	 x302004_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 300782, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x302004_var_GatherPointTypeId, x302004_var_ItemId )
end




function	 x302004_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 300782, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x302004_var_GatherPointTypeId, x302004_var_ItemId )
end





function	x302004_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( 300782, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



