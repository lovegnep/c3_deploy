

x110005_var_GatherPointTypeId = 1005 
x110005_var_ItemId = 13050009



function 	x110005_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110005_var_GatherPointTypeId, varMap, 0, x110005_var_ItemId)
end




function	 x110005_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110005_var_GatherPointTypeId, x110005_var_ItemId )
end




function	 x110005_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110005_var_GatherPointTypeId, x110005_var_ItemId )
	 return 0
end





function	x110005_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

