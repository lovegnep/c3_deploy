

x110001_var_GatherPointTypeId = 1001 
x110001_var_ItemId = 13050005 



function 	x110001_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110001_var_GatherPointTypeId, varMap, 0, x110001_var_ItemId)
end




function	 x110001_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110001_var_GatherPointTypeId, x110001_var_ItemId )
end




function	 x110001_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110001_var_GatherPointTypeId, x110001_var_ItemId )
	 return 0
end





function	x110001_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

