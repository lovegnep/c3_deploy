

x301368_var_GatherPointTypeId = 332 
x301368_var_ItemId = 13060034 



function 	x301368_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301368_var_GatherPointTypeId, varMap, 0, x301368_var_ItemId)
end




function	 x301368_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301368_var_GatherPointTypeId, x301368_var_ItemId )
end




function	 x301368_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301368_var_GatherPointTypeId, x301368_var_ItemId )
end





function	x301368_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



