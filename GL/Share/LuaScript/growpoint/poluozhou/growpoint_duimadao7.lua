

x301444_var_GatherPointTypeId = 723 
x301444_var_ItemId = 13070011 
x301444_var_FileId = 305015



function 	x301444_ProcGpCreate( varMap, varGpType, varX, varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301444_var_GatherPointTypeId, varMap, 0, x301444_var_ItemId)
    SetGrowPointObjID( varMap, x301444_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301444_ProcGpOpen( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301444_var_FileId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301444_var_GatherPointTypeId, x301444_var_ItemId)
end




function	 x301444_ProcGpRecycle( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301444_var_FileId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301444_var_GatherPointTypeId, x301444_var_ItemId)
end





function	x301444_ProcGpProcOver( varMap, varPlayer, varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc)
end



