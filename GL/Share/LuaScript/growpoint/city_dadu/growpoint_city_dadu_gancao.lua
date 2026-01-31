

x301011_var_GatherPointTypeId = 12 
x301011_var_ItemId = 13020304 



function 	x301011_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301011_var_GatherPointTypeId, varMap, 0, x301011_var_ItemId)
end




function	 x301011_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301011_var_GatherPointTypeId, x301011_var_ItemId )
end




function	 x301011_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301011_var_GatherPointTypeId, x301011_var_ItemId )
end





function	x301011_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


