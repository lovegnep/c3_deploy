

x110013_var_GatherPointTypeId = 1013 
x110013_var_ItemId = 13050009 



function 	x110013_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110013_var_GatherPointTypeId, varMap, 0, x110013_var_ItemId)
end




function	 x110013_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110013_var_GatherPointTypeId, x110013_var_ItemId )
end




function	 x110013_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110013_var_GatherPointTypeId, x110013_var_ItemId )
	 return 0
end





function	x110013_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

