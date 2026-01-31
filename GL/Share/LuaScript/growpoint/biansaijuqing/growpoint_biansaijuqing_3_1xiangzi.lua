

x110024_var_GatherPointTypeId = 1024 
x110024_var_ItemId = 13050004 



function 	x110024_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110024_var_GatherPointTypeId, varMap, 0, x110024_var_ItemId)
end




function	 x110024_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110024_var_GatherPointTypeId, x110024_var_ItemId )
end




function	 x110024_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110024_var_GatherPointTypeId, x110024_var_ItemId )
	 return 0
end





function	x110024_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

