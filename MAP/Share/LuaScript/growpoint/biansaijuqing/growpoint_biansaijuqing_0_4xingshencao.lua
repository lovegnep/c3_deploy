

x110003_var_GatherPointTypeId = 1003 
x110003_var_ItemId = 13050007 



function 	x110003_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110003_var_GatherPointTypeId, varMap, 0, x110003_var_ItemId)
end




function	 x110003_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110003_var_GatherPointTypeId, x110003_var_ItemId )
end




function	 x110003_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110003_var_GatherPointTypeId, x110003_var_ItemId )
	 return 0
end





function	x110003_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

