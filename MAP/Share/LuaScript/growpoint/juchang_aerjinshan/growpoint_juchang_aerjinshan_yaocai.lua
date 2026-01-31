

x301049_var_GatherPointTypeId = 194 
x301049_var_ItemId = 13020443 



function 	x301049_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301049_var_GatherPointTypeId, varMap, 0, x301049_var_ItemId)
end




function	 x301049_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301049_var_GatherPointTypeId, x301049_var_ItemId )
end




function	 x301049_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301049_var_GatherPointTypeId, x301049_var_ItemId )
end





function	x301049_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end
