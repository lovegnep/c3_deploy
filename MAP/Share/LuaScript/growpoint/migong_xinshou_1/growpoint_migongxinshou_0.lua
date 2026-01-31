

x301206_var_GatherPointTypeId = 156  
x301206_var_ItemId = 13030018 



function 	x301206_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301206_var_GatherPointTypeId, varMap, 0, x301206_var_ItemId)
end




function	 x301206_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301206_var_GatherPointTypeId, x301206_var_ItemId )
end




function	 x301206_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301206_var_GatherPointTypeId, x301206_var_ItemId )
end





function	x301206_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


