

x301221_var_GatherPointTypeId = 180 
x301221_var_ItemId = 13030098 



function 	x301221_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301221_var_GatherPointTypeId, varMap, 0, x301221_var_ItemId)
end




function	 x301221_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301221_var_GatherPointTypeId, x301221_var_ItemId )
end




function	 x301221_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301221_var_GatherPointTypeId, x301221_var_ItemId )
end





function	x301221_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


