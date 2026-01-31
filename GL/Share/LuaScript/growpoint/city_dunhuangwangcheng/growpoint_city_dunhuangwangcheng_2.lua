

x301032_var_GatherPointTypeId = 39 
x301032_var_ItemId = 13011004 



function 	x301032_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301032_var_GatherPointTypeId, varMap, 0, x301032_var_ItemId)
end




function	 x301032_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301032_var_GatherPointTypeId, x301032_var_ItemId )
end




function	 x301032_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301032_var_GatherPointTypeId, x301032_var_ItemId )
end





function	x301032_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


