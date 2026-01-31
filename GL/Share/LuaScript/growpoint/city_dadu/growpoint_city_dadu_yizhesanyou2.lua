

x301080_var_GatherPointTypeId = 324 
x301080_var_ItemId = 13810102 
x301080_var_QuestId = 300569



function 	x301080_ProcGpCreate(varMap,varGpType,varX,varY, varViewGroup)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301080_var_GatherPointTypeId, varMap, 0, x301080_var_ItemId, -1, varViewGroup)
    SetGrowPointObjID( varMap, x301080_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301080_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301080_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301080_var_GatherPointTypeId, x301080_var_ItemId )
end




function	 x301080_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301080_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301080_var_GatherPointTypeId, x301080_var_ItemId )
end





function	x301080_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



