

x110008_var_GatherPointTypeId = 1008 
x110008_var_ItemId = 13050004 



function 	x110008_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110008_var_GatherPointTypeId, varMap, 0, x110008_var_ItemId)
end




function	 x110008_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110008_var_GatherPointTypeId, x110008_var_ItemId )
end




function	 x110008_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110008_var_GatherPointTypeId, x110008_var_ItemId )
	 return 0
end





function	x110008_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

