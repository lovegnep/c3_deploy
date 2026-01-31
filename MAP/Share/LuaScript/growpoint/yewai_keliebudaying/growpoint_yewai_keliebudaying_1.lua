

x301214_var_GatherPointTypeId = 164 
x301214_var_ItemId = 13030057 



function 	x301214_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301214_var_GatherPointTypeId, varMap, 0, x301214_var_ItemId)
end




function	 x301214_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301214_var_GatherPointTypeId, x301214_var_ItemId )
end




function	 x301214_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301214_var_GatherPointTypeId, x301214_var_ItemId )
end





function	x301214_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


