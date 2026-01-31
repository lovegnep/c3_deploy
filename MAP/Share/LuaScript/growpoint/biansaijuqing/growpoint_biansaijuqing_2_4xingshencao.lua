

x110019_var_GatherPointTypeId = 1019 
x110019_var_ItemId = 13050007 



function 	x110019_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110019_var_GatherPointTypeId, varMap, 0, x110019_var_ItemId)
end




function	 x110019_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110019_var_GatherPointTypeId, x110019_var_ItemId )
end




function	 x110019_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110019_var_GatherPointTypeId, x110019_var_ItemId )
	 return 0
end





function	x110019_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

