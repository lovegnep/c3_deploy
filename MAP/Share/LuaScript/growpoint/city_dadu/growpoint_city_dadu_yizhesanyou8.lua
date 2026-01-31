

x301096_var_GatherPointTypeId = 330 
x301096_var_ItemId = 13810104 
x301096_var_QuestId = 300569



function 	x301096_ProcGpCreate(varMap,varGpType,varX,varY, varViewGroup)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301096_var_GatherPointTypeId, varMap, 0, x301096_var_ItemId, -1, varViewGroup)
    SetGrowPointObjID( varMap, x301096_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301096_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301096_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301096_var_GatherPointTypeId, x301096_var_ItemId )
end




function	 x301096_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301096_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301096_var_GatherPointTypeId, x301096_var_ItemId )
end





function	x301096_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



