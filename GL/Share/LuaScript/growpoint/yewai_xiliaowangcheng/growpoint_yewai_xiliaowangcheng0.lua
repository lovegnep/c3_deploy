

x301413_var_GatherPointTypeId = 313 
x301413_var_ItemId = 13020410 



function 	x301413_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301413_var_GatherPointTypeId, varMap, 0, x301413_var_ItemId)
end




function	 x301413_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301413_var_GatherPointTypeId, x301413_var_ItemId )
end




function	 x301413_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301413_var_GatherPointTypeId, x301413_var_ItemId )
end





function	x301413_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

