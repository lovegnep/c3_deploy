

x301215_var_GatherPointTypeId = 165 
x301215_var_ItemId = 13030058 



function 	x301215_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301215_var_GatherPointTypeId, varMap, 0, x301215_var_ItemId)
end




function	 x301215_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301215_var_GatherPointTypeId, x301215_var_ItemId )
end




function	 x301215_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301215_var_GatherPointTypeId, x301215_var_ItemId )
end





function	x301215_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



