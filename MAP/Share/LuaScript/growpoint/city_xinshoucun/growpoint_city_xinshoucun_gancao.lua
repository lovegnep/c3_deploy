

x301309_var_GatherPointTypeId = 175 
x301309_var_ItemId = 13030080
 



function 	x301309_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301309_var_GatherPointTypeId, varMap, 0, x301309_var_ItemId)
end




function	 x301309_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301309_var_GatherPointTypeId, x301309_var_ItemId )
end




function	 x301309_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301309_var_GatherPointTypeId, x301309_var_ItemId )
end





function	x301309_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


