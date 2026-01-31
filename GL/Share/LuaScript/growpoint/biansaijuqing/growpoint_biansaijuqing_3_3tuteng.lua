

x110026_var_GatherPointTypeId = 1026 
x110026_var_ItemId = 13050006 



function 	x110026_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110026_var_GatherPointTypeId, varMap, 0, x110026_var_ItemId)
end




function	 x110026_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110026_var_GatherPointTypeId, x110026_var_ItemId )
end




function	 x110026_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110026_var_GatherPointTypeId, x110026_var_ItemId )
	 return 0
end





function	x110026_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

