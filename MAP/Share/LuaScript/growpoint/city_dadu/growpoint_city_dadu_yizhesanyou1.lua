

x301079_var_GatherPointTypeId = 323 
x301079_var_ItemId = 13810084 
x301079_var_QuestId = 300569



function 	x301079_ProcGpCreate(varMap,varGpType,varX,varY, varViewGroup)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301079_var_GatherPointTypeId, varMap, 0, x301079_var_ItemId, -1, varViewGroup)
    SetGrowPointObjID( varMap, x301079_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301079_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301079_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301079_var_GatherPointTypeId, x301079_var_ItemId )
end




function	 x301079_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301079_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301079_var_GatherPointTypeId, x301079_var_ItemId )
end





function	x301079_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



