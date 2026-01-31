

x301442_var_GatherPointTypeId = 721 
x301442_var_ItemId = 13070010 
x301442_var_FileId = 305015



function 	x301442_ProcGpCreate( varMap, varGpType, varX, varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301442_var_GatherPointTypeId, varMap, 0, x301442_var_ItemId)
    SetGrowPointObjID( varMap, x301442_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301442_ProcGpOpen( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301442_var_FileId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301442_var_GatherPointTypeId, x301442_var_ItemId)
end




function	 x301442_ProcGpRecycle( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301442_var_FileId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301442_var_GatherPointTypeId, x301442_var_ItemId)
end





function	x301442_ProcGpProcOver( varMap, varPlayer, varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc)
end



