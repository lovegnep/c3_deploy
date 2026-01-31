

x301313_var_GatherPointTypeId = 179 
x301313_var_ItemId = 13030091 



function 	x301313_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301313_var_GatherPointTypeId, varMap, 0, x301313_var_ItemId)
end




function	 x301313_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301313_var_GatherPointTypeId, x301313_var_ItemId )
end




function	 x301313_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301313_var_GatherPointTypeId, x301313_var_ItemId )
end





function	x301313_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


