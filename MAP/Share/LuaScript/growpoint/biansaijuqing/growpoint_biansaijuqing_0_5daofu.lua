

x110004_var_GatherPointTypeId = 1004 
x110004_var_ItemId = 13050008 



function 	x110004_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110004_var_GatherPointTypeId, varMap, 0, x110004_var_ItemId)
end




function	 x110004_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110004_var_GatherPointTypeId, x110004_var_ItemId )
end




function	 x110004_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110004_var_GatherPointTypeId, x110004_var_ItemId )
	 return 0
end





function	x110004_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

