

x301048_var_GatherPointTypeId = 193 
x301048_var_ItemId = 13020441 



function 	x301048_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301048_var_GatherPointTypeId, varMap, 0, x301048_var_ItemId)
end




function	 x301048_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301048_var_GatherPointTypeId, x301048_var_ItemId )
end




function	 x301048_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301048_var_GatherPointTypeId, x301048_var_ItemId )
end





function	x301048_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



