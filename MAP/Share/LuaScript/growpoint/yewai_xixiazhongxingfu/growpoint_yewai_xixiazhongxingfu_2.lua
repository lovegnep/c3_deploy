

x301217_var_GatherPointTypeId = 167 
x301217_var_ItemId = 13030066 



function 	x301217_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301217_var_GatherPointTypeId, varMap, 0, x301217_var_ItemId)
end




function	 x301217_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301217_var_GatherPointTypeId, x301217_var_ItemId )
end




function	 x301217_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301217_var_GatherPointTypeId, x301217_var_ItemId )
end





function	x301217_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


