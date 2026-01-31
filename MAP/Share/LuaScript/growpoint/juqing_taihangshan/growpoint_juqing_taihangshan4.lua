

x301304_var_GatherPointTypeId = 204 
x301304_var_ItemId = 13040004 



function 	x301304_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301304_var_GatherPointTypeId, varMap, 0, x301304_var_ItemId)
end




function	 x301304_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301304_var_GatherPointTypeId, x301304_var_ItemId )
end




function	 x301304_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301304_var_GatherPointTypeId, x301304_var_ItemId )
end





function	x301304_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


