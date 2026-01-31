

x110021_var_GatherPointTypeId = 1021 
x110021_var_ItemId = 13050009 



function 	x110021_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110021_var_GatherPointTypeId, varMap, 0, x110021_var_ItemId)
end




function	 x110021_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110021_var_GatherPointTypeId, x110021_var_ItemId )
end




function	 x110021_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110021_var_GatherPointTypeId, x110021_var_ItemId )
	 return 0
end





function	x110021_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

