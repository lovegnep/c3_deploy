

x301438_var_GatherPointTypeId = 717 
x301438_var_ItemId = 13070012 
x301438_var_FileId = 305015



function 	x301438_ProcGpCreate( varMap, varGpType, varX, varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301438_var_GatherPointTypeId, varMap, 0, x301438_var_ItemId)
    SetGrowPointObjID( varMap, x301438_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301438_ProcGpOpen( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301438_var_FileId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301438_var_GatherPointTypeId, x301438_var_ItemId)
end




function	 x301438_ProcGpRecycle( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301438_var_FileId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301438_var_GatherPointTypeId, x301438_var_ItemId)
end





function	x301438_ProcGpProcOver( varMap, varPlayer, varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc)
end



