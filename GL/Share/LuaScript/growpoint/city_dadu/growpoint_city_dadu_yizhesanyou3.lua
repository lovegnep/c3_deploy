

x301081_var_GatherPointTypeId = 325 
x301081_var_ItemId = 13810089 
x301081_var_QuestId = 300569



function 	x301081_ProcGpCreate(varMap,varGpType,varX,varY, varViewGroup)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301081_var_GatherPointTypeId, varMap, 0, x301081_var_ItemId, -1, varViewGroup)
    SetGrowPointObjID( varMap, x301081_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301081_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301081_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301081_var_GatherPointTypeId, x301081_var_ItemId )
end




function	 x301081_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301081_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301081_var_GatherPointTypeId, x301081_var_ItemId )
end





function	x301081_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



