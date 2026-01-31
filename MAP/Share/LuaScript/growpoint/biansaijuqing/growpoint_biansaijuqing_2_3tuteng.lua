

x110018_var_GatherPointTypeId = 1018 
x110018_var_ItemId = 13050006 



function 	x110018_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110018_var_GatherPointTypeId, varMap, 0, x110018_var_ItemId)
end




function	 x110018_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110018_var_GatherPointTypeId, x110018_var_ItemId )
end




function	 x110018_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110018_var_GatherPointTypeId, x110018_var_ItemId )
	 return 0
end





function	x110018_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

