

x301441_var_GatherPointTypeId = 720 
x301441_var_ItemId = 13070010 
x301441_var_FileId = 305015



function 	x301441_ProcGpCreate( varMap, varGpType, varX, varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301441_var_GatherPointTypeId, varMap, 0, x301441_var_ItemId)
    SetGrowPointObjID( varMap, x301441_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301441_ProcGpOpen( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301441_var_FileId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301441_var_GatherPointTypeId, x301441_var_ItemId)
end




function	 x301441_ProcGpRecycle( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301441_var_FileId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301441_var_GatherPointTypeId, x301441_var_ItemId)
end





function	x301441_ProcGpProcOver( varMap, varPlayer, varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc)
end



