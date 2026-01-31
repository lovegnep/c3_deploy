

x110020_var_GatherPointTypeId = 1020 
x110020_var_ItemId = 13050008 



function 	x110020_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110020_var_GatherPointTypeId, varMap, 0, x110020_var_ItemId)
end




function	 x110020_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110020_var_GatherPointTypeId, x110020_var_ItemId )
end




function	 x110020_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110020_var_GatherPointTypeId, x110020_var_ItemId )
	 return 0
end





function	x110020_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

