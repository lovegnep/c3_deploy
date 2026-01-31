

x302000_var_GatherPointTypeId = 420 
x302000_var_ItemId = 13013700 



function 	x302000_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x302000_var_GatherPointTypeId, varMap, 0, x302000_var_ItemId)
end




function	 x302000_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 300782, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x302000_var_GatherPointTypeId, x302000_var_ItemId )
end




function	 x302000_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 300782, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x302000_var_GatherPointTypeId, x302000_var_ItemId )
end





function	x302000_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( 300782, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



