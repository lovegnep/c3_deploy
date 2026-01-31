

x110000_var_GatherPointTypeId = 1000 
x110000_var_ItemId = 13050004 



function 	x110000_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110000_var_GatherPointTypeId, varMap, 0, x110000_var_ItemId)
end




function	 x110000_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110000_var_GatherPointTypeId, x110000_var_ItemId )
end




function	 x110000_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110000_var_GatherPointTypeId, x110000_var_ItemId )
	 return 0
end





function	x110000_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

