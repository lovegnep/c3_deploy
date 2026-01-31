

x301443_var_GatherPointTypeId = 722 
x301443_var_ItemId = 13070010 
x301443_var_FileId = 305015



function 	x301443_ProcGpCreate( varMap, varGpType, varX, varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301443_var_GatherPointTypeId, varMap, 0, x301443_var_ItemId)
    SetGrowPointObjID( varMap, x301443_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301443_ProcGpOpen( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301443_var_FileId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301443_var_GatherPointTypeId, x301443_var_ItemId)
end




function	 x301443_ProcGpRecycle( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301443_var_FileId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301443_var_GatherPointTypeId, x301443_var_ItemId)
end





function	x301443_ProcGpProcOver( varMap, varPlayer, varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc)
end



