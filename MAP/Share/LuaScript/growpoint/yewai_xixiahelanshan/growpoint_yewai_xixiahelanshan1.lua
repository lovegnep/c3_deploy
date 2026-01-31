

x301306_var_GatherPointTypeId = 206 
x301306_var_ItemId = 13040028 



function 	x301306_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301306_var_GatherPointTypeId, varMap, 0, x301306_var_ItemId)
end




function	 x301306_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301306_var_GatherPointTypeId, x301306_var_ItemId )
end




function	 x301306_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301306_var_GatherPointTypeId, x301306_var_ItemId )
end





function	x301306_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


