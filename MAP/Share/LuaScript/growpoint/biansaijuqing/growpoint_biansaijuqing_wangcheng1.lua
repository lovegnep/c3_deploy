

x110032_var_GatherPointTypeId = 1032 
x110032_var_ItemId = 13050016 



function 	x110032_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110032_var_GatherPointTypeId, varMap, 0, x110032_var_ItemId)
end




function	 x110032_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110032_var_GatherPointTypeId, x110032_var_ItemId )
end




function	 x110032_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110032_var_GatherPointTypeId, x110032_var_ItemId )
	 return 0
end





function	x110032_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

