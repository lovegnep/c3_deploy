

x110017_var_GatherPointTypeId = 1017 
x110017_var_ItemId = 13050005 



function 	x110017_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110017_var_GatherPointTypeId, varMap, 0, x110017_var_ItemId)
end




function	 x110017_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110017_var_GatherPointTypeId, x110017_var_ItemId )
end




function	 x110017_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110017_var_GatherPointTypeId, x110017_var_ItemId )
	 return 0
end





function	x110017_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

