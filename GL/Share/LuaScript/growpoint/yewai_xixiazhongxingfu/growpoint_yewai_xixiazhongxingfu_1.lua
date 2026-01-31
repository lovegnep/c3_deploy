

x301216_var_GatherPointTypeId = 166 
x301216_var_ItemId = 13030065 



function 	x301216_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301216_var_GatherPointTypeId, varMap, 0, x301216_var_ItemId)
end




function	 x301216_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301216_var_GatherPointTypeId, x301216_var_ItemId )
end




function	 x301216_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301216_var_GatherPointTypeId, x301216_var_ItemId )
	return 0
end





function	x301216_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



