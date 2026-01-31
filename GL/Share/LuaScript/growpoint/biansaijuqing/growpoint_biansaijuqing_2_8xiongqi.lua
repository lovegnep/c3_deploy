

x110023_var_GatherPointTypeId = 1023 
x110023_var_ItemId = 13050011 



function 	x110023_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110023_var_GatherPointTypeId, varMap, 0, x110023_var_ItemId)
end




function	 x110023_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110023_var_GatherPointTypeId, x110023_var_ItemId )
end




function	 x110023_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110023_var_GatherPointTypeId, x110023_var_ItemId )
	 return 0
end





function	x110023_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

