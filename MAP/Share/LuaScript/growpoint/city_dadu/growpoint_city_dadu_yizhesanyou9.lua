

x301097_var_GatherPointTypeId = 331 
x301097_var_ItemId = 13810107 
x301097_var_QuestId = 300569



function 	x301097_ProcGpCreate(varMap,varGpType,varX,varY, varViewGroup)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301097_var_GatherPointTypeId, varMap, 0, x301097_var_ItemId, -1, varViewGroup)
    SetGrowPointObjID( varMap, x301097_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301097_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301097_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301097_var_GatherPointTypeId, x301097_var_ItemId )
end




function	 x301097_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301097_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301097_var_GatherPointTypeId, x301097_var_ItemId )
end





function	x301097_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



