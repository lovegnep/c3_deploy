

x301004_var_GatherPointTypeId = 5 
x301004_var_ItemId = 13020005 



function 	x301004_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301004_var_GatherPointTypeId, varMap, 0, x301004_var_ItemId)
end




function	 x301004_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301004_var_GatherPointTypeId, x301004_var_ItemId )
end




function	 x301004_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301004_var_GatherPointTypeId, x301004_var_ItemId )
end





function	x301004_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


