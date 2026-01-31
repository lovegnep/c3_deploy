

x301439_var_GatherPointTypeId = 718 
x301439_var_ItemId = 13070012 
x301439_var_FileId = 305015



function 	x301439_ProcGpCreate( varMap, varGpType, varX, varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301439_var_GatherPointTypeId, varMap, 0, x301439_var_ItemId)
    SetGrowPointObjID( varMap, x301439_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301439_ProcGpOpen( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301439_var_FileId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301439_var_GatherPointTypeId, x301439_var_ItemId)
end




function	 x301439_ProcGpRecycle( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301439_var_FileId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301439_var_GatherPointTypeId, x301439_var_ItemId)
end





function	x301439_ProcGpProcOver( varMap, varPlayer, varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc)
end



