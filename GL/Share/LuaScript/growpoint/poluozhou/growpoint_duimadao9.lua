

x301446_var_GatherPointTypeId = 725 
x301446_var_ItemId = 13070011 
x301446_var_FileId = 305015



function 	x301446_ProcGpCreate( varMap, varGpType, varX, varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301446_var_GatherPointTypeId, varMap, 0, x301446_var_ItemId)
    SetGrowPointObjID( varMap, x301446_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301446_ProcGpOpen( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301446_var_FileId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301446_var_GatherPointTypeId, x301446_var_ItemId)
end




function	 x301446_ProcGpRecycle( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301446_var_FileId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301446_var_GatherPointTypeId, x301446_var_ItemId)
end





function	x301446_ProcGpProcOver( varMap, varPlayer, varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc)
end



