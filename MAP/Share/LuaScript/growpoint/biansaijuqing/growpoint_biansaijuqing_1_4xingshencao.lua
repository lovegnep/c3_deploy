

x110011_var_GatherPointTypeId = 1011 
x110011_var_ItemId = 13050007 



function 	x110011_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110011_var_GatherPointTypeId, varMap, 0, x110011_var_ItemId)
end




function	 x110011_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110011_var_GatherPointTypeId, x110011_var_ItemId )
end




function	 x110011_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110011_var_GatherPointTypeId, x110011_var_ItemId )
	 return 0
end





function	x110011_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

