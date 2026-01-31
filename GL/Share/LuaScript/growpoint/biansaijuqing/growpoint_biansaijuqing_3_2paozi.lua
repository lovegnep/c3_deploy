

x110025_var_GatherPointTypeId = 1025 
x110025_var_ItemId = 13050005 



function 	x110025_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110025_var_GatherPointTypeId, varMap, 0, x110025_var_ItemId)
end




function	 x110025_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110025_var_GatherPointTypeId, x110025_var_ItemId )
end




function	 x110025_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110025_var_GatherPointTypeId, x110025_var_ItemId )
	 return 0
end





function	x110025_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

