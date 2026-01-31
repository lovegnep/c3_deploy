

x301355_var_GatherPointTypeId = 305 
x301355_var_ItemId = 13020219 



function 	x301355_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301355_var_GatherPointTypeId, varMap, 0, x301355_var_ItemId)
end




function	 x301355_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301355_var_GatherPointTypeId, x301355_var_ItemId )
end




function	 x301355_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301355_var_GatherPointTypeId, x301355_var_ItemId )
end





function	x301355_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


