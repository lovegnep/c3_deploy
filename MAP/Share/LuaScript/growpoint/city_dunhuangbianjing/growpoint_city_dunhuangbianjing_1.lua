

x301351_var_GatherPointTypeId = 301 
x301351_var_ItemId = 13020205 



function 	x301351_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301351_var_GatherPointTypeId, varMap, 0, x301351_var_ItemId)
end




function	 x301351_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301351_var_GatherPointTypeId, x301351_var_ItemId )
end




function	 x301351_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301351_var_GatherPointTypeId, x301351_var_ItemId )
end





function	x301351_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


