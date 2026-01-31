

x302001_var_GatherPointTypeId = 421 
x302001_var_ItemId = 13013701 



function 	x302001_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x302001_var_GatherPointTypeId, varMap, 0, x302001_var_ItemId)
end




function	 x302001_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 300782, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x302001_var_GatherPointTypeId, x302001_var_ItemId )
end




function	 x302001_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 300782, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x302001_var_GatherPointTypeId, x302001_var_ItemId )
end





function	x302001_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( 300782, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



