

x301062_var_GatherPointTypeId = 62 
x301062_var_ItemId = 13010107 



function 	x301062_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301062_var_GatherPointTypeId, varMap, 0, x301062_var_ItemId)
end




function	 x301062_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301062_var_GatherPointTypeId, x301062_var_ItemId )
end




function	 x301062_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301062_var_GatherPointTypeId, x301062_var_ItemId )
end





function	x301062_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

