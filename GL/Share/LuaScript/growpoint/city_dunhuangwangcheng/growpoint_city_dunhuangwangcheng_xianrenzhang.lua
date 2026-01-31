

x301223_var_GatherPointTypeId = 182 
x301223_var_ItemId = 13030103 



function 	x301223_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301223_var_GatherPointTypeId, varMap, 0, x301223_var_ItemId)
end




function	 x301223_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301223_var_GatherPointTypeId, x301223_var_ItemId )
end




function	 x301223_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301223_var_GatherPointTypeId, x301223_var_ItemId )
end





function	x301223_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


