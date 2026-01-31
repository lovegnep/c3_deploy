

x301082_var_GatherPointTypeId = 326 
x301082_var_ItemId = 13810092 
x301082_var_QuestId = 300569



function 	x301082_ProcGpCreate(varMap,varGpType,varX,varY, varViewGroup)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301082_var_GatherPointTypeId, varMap, 0, x301082_var_ItemId, -1, varViewGroup)
    SetGrowPointObjID( varMap, x301082_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301082_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301082_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301082_var_GatherPointTypeId, x301082_var_ItemId )
end




function	 x301082_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301082_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301082_var_GatherPointTypeId, x301082_var_ItemId )
end





function	x301082_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



