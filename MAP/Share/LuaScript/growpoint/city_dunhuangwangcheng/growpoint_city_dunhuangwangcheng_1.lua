

x301031_var_GatherPointTypeId = 38 
x301031_var_ItemId = 13011003 



function 	x301031_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301031_var_GatherPointTypeId, varMap, 0, x301031_var_ItemId)
end




function	 x301031_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301031_var_GatherPointTypeId, x301031_var_ItemId )
end




function	 x301031_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301031_var_GatherPointTypeId, x301031_var_ItemId )
end





function	x301031_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


