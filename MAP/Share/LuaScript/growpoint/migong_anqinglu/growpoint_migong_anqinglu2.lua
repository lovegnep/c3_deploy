

x301366_var_GatherPointTypeId = 220 
x301366_var_ItemId = 13810052 



function 	x301366_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301366_var_GatherPointTypeId, varMap, 0, x301366_var_ItemId)
end




function	 x301366_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301366_var_GatherPointTypeId, x301366_var_ItemId )
end




function	 x301366_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301366_var_GatherPointTypeId, x301366_var_ItemId )
end





function	x301366_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end
