

x301504_var_GatherPointTypeId = 414
x301504_var_ItemId = 13010138 



function 	x301504_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301504_var_GatherPointTypeId, varMap, 0, x301504_var_ItemId)
end




function	 x301504_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301504_var_GatherPointTypeId, x301504_var_ItemId )
end




function	 x301504_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301504_var_GatherPointTypeId, x301504_var_ItemId )
	 return 1
end





function	x301504_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end




