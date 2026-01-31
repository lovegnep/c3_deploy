

x301095_var_GatherPointTypeId = 329 
x301095_var_ItemId = 13810101 
x301095_var_QuestId = 300569



function 	x301095_ProcGpCreate(varMap,varGpType,varX,varY, varViewGroup)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301095_var_GatherPointTypeId, varMap, 0, x301095_var_ItemId, -1, varViewGroup)
    SetGrowPointObjID( varMap, x301095_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301095_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301095_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301095_var_GatherPointTypeId, x301095_var_ItemId )
end




function	 x301095_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301095_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301095_var_GatherPointTypeId, x301095_var_ItemId )
end





function	x301095_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



