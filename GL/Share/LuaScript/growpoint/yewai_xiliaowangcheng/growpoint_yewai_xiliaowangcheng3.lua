

x301416_var_GatherPointTypeId = 316 
x301416_var_ItemId = 13020414 



function 	x301416_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301416_var_GatherPointTypeId, varMap, 0, x301416_var_ItemId)
end




function	 x301416_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301416_var_GatherPointTypeId, x301416_var_ItemId )
end




function	 x301416_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301416_var_GatherPointTypeId, x301416_var_ItemId )
end





function	x301416_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

