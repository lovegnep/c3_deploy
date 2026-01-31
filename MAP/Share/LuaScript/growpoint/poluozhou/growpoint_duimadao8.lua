

x301445_var_GatherPointTypeId = 724 
x301445_var_ItemId = 13070011 
x301445_var_FileId = 305015



function 	x301445_ProcGpCreate( varMap, varGpType, varX, varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301445_var_GatherPointTypeId, varMap, 0, x301445_var_ItemId)
    SetGrowPointObjID( varMap, x301445_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301445_ProcGpOpen( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301445_var_FileId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301445_var_GatherPointTypeId, x301445_var_ItemId)
end




function	 x301445_ProcGpRecycle( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301445_var_FileId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301445_var_GatherPointTypeId, x301445_var_ItemId)
end





function	x301445_ProcGpProcOver( varMap, varPlayer, varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc)
end



