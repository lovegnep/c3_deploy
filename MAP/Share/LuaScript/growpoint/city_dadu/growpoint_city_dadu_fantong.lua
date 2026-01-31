

x301016_var_GatherPointTypeId = 17 
x301016_var_ItemId = 13020327 



function 	x301016_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301016_var_GatherPointTypeId, varMap, 0, x301016_var_ItemId)
end




function	 x301016_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301016_var_GatherPointTypeId, x301016_var_ItemId )
end




function	 x301016_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301016_var_GatherPointTypeId, x301016_var_ItemId )
end





function	x301016_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


