

x301362_var_GatherPointTypeId = 312 
x301362_var_ItemId = 13010120 



function 	x301362_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301362_var_GatherPointTypeId, varMap, 0, x301362_var_ItemId)
end




function	 x301362_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 202002, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301362_var_GatherPointTypeId, x301362_var_ItemId )
end




function	 x301362_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 202002, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301362_var_GatherPointTypeId, x301362_var_ItemId )
end





function	x301362_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


