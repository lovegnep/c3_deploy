

x301453_var_GatherPointTypeId = 810 
x301453_var_ItemId = 13030045 



function 	x301453_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301453_var_GatherPointTypeId, varMap, 0, x301453_var_ItemId)
end




function	 x301453_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301453_var_GatherPointTypeId, x301453_var_ItemId )
end




function	 x301453_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301453_var_GatherPointTypeId, x301453_var_ItemId )
end





function	x301453_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



