

x302003_var_GatherPointTypeId = 423 
x302003_var_ItemId = 13013703 



function 	x302003_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x302003_var_GatherPointTypeId, varMap, 0, x302003_var_ItemId)
end




function	 x302003_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 300782, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x302003_var_GatherPointTypeId, x302003_var_ItemId )
end




function	 x302003_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 300782, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x302003_var_GatherPointTypeId, x302003_var_ItemId )
end





function	x302003_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( 300782, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



