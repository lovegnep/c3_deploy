

x301365_var_GatherPointTypeId = 219 
x301365_var_ItemId = 13810051 



function 	x301365_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301365_var_GatherPointTypeId, varMap, 0, x301365_var_ItemId)
end




function	 x301365_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301365_var_GatherPointTypeId, x301365_var_ItemId )
end




function	 x301365_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301365_var_GatherPointTypeId, x301365_var_ItemId )
end





function	x301365_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end
