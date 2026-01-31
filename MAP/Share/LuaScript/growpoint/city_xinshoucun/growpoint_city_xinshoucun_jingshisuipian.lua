

x301220_var_GatherPointTypeId = 173 
x301220_var_ItemId = 13030072
 



function 	x301220_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301220_var_GatherPointTypeId, varMap, 0, x301220_var_ItemId)
end




function	 x301220_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301220_var_GatherPointTypeId, x301220_var_ItemId )
end




function	 x301220_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301220_var_GatherPointTypeId, x301220_var_ItemId )
end





function	x301220_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


