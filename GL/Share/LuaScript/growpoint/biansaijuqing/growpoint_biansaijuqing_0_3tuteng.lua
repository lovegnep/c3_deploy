

x110002_var_GatherPointTypeId = 1002 
x110002_var_ItemId = 13050006 



function 	x110002_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110002_var_GatherPointTypeId, varMap, 0, x110002_var_ItemId)
end




function	 x110002_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110002_var_GatherPointTypeId, x110002_var_ItemId )
end




function	 x110002_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110002_var_GatherPointTypeId, x110002_var_ItemId )
	 return 0
end





function	x110002_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

