

x301094_var_GatherPointTypeId = 328 
x301094_var_ItemId = 13810098 
x301094_var_QuestId = 300569



function 	x301094_ProcGpCreate(varMap,varGpType,varX,varY, varViewGroup)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301094_var_GatherPointTypeId, varMap, 0, x301094_var_ItemId, -1, varViewGroup)
    SetGrowPointObjID( varMap, x301094_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301094_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301094_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301094_var_GatherPointTypeId, x301094_var_ItemId )
end




function	 x301094_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301094_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301094_var_GatherPointTypeId, x301094_var_ItemId )
end





function	x301094_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



