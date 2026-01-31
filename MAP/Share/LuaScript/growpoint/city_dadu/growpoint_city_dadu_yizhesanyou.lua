

x301078_var_GatherPointTypeId = 322 
x301078_var_ItemId = 13810100 
x301078_var_QuestId = 300569



function 	x301078_ProcGpCreate(varMap,varGpType,varX,varY, varViewGroup)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301078_var_GatherPointTypeId, varMap, 0, x301078_var_ItemId, -1, varViewGroup)
    SetGrowPointObjID( varMap, x301078_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301078_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301078_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301078_var_GatherPointTypeId, x301078_var_ItemId )
end




function	 x301078_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301078_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301078_var_GatherPointTypeId, x301078_var_ItemId )
end





function	x301078_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



