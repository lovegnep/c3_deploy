

x301415_var_GatherPointTypeId = 315 
x301415_var_ItemId = 13020411 



function 	x301415_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301415_var_GatherPointTypeId, varMap, 0, x301415_var_ItemId)
end




function	 x301415_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301415_var_GatherPointTypeId, x301415_var_ItemId )
end




function	 x301415_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301415_var_GatherPointTypeId, x301415_var_ItemId )
end





function	x301415_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

