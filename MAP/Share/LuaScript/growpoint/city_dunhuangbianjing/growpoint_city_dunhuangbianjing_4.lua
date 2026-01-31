

x301354_var_GatherPointTypeId = 304 
x301354_var_ItemId = 13020217 



function 	x301354_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301354_var_GatherPointTypeId, varMap, 0, x301354_var_ItemId)
end




function	 x301354_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301354_var_GatherPointTypeId, x301354_var_ItemId )
end




function	 x301354_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301354_var_GatherPointTypeId, x301354_var_ItemId )
end





function	x301354_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

