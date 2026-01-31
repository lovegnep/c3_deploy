

x301093_var_GatherPointTypeId = 327 
x301093_var_ItemId = 13810095 
x301093_var_QuestId = 300569



function 	x301093_ProcGpCreate(varMap,varGpType,varX,varY, varViewGroup)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301093_var_GatherPointTypeId, varMap, 0, x301093_var_ItemId, -1, varViewGroup)
    SetGrowPointObjID( varMap, x301093_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301093_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301093_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301093_var_GatherPointTypeId, x301093_var_ItemId )
end




function	 x301093_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301093_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301093_var_GatherPointTypeId, x301093_var_ItemId )
end





function	x301093_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



