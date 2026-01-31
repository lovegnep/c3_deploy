

x301451_var_GatherPointTypeId = 126 
x301451_var_ItemId = 13060039 



function 	x301451_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301451_var_GatherPointTypeId, varMap, 0, x301451_var_ItemId)
end




function	 x301451_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301451_var_GatherPointTypeId, x301451_var_ItemId )
end




function	 x301451_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return  LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301451_var_GatherPointTypeId, x301451_var_ItemId )
end





function	x301451_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


