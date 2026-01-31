

x301024_var_GatherPointTypeId = 32 
x301024_var_ItemId = 13010021 



function 	x301024_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301024_var_GatherPointTypeId, varMap, 0, x301024_var_ItemId)
end




function	 x301024_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301024_var_GatherPointTypeId, x301024_var_ItemId )
end




function	 x301024_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301024_var_GatherPointTypeId, x301024_var_ItemId )
end





function	x301024_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



