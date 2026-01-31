

x110015_var_GatherPointTypeId = 1015 
x110015_var_ItemId = 13050011 



function 	x110015_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110015_var_GatherPointTypeId, varMap, 0, x110015_var_ItemId)
end




function	 x110015_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110015_var_GatherPointTypeId, x110015_var_ItemId )
end




function	 x110015_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110015_var_GatherPointTypeId, x110015_var_ItemId )
	 return 0
end





function	x110015_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

