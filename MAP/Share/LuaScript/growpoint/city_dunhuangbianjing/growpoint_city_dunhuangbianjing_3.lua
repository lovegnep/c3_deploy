

x301353_var_GatherPointTypeId = 303 
x301353_var_ItemId = 13020210 



function 	x301353_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301353_var_GatherPointTypeId, varMap, 0, x301353_var_ItemId)
end




function	 x301353_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301353_var_GatherPointTypeId, x301353_var_ItemId )
end




function	 x301353_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301353_var_GatherPointTypeId, x301353_var_ItemId )
end





function	x301353_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


