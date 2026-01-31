

x301018_var_GatherPointTypeId = 123 
x301018_var_ItemId = 13080009 



function 	x301018_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301018_var_GatherPointTypeId, varMap, 0, x301018_var_ItemId)
end




function	 x301018_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301018_var_GatherPointTypeId, x301018_var_ItemId )
end




function	 x301018_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301018_var_GatherPointTypeId, x301018_var_ItemId )
end





function	x301018_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



