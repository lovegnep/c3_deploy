

x301440_var_GatherPointTypeId = 719 
x301440_var_ItemId = 13070012 
x301440_var_FileId = 305015



function 	x301440_ProcGpCreate( varMap, varGpType, varX, varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301440_var_GatherPointTypeId, varMap, 0, x301440_var_ItemId)
    SetGrowPointObjID( varMap, x301440_var_GatherPointTypeId, varX, varY, varBoxId)
end




function	 x301440_ProcGpOpen( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301440_var_FileId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301440_var_GatherPointTypeId, x301440_var_ItemId)
end




function	 x301440_ProcGpRecycle( varMap, varPlayer, varTalknpc)
	return LuaCallNoclosure( x301440_var_FileId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301440_var_GatherPointTypeId, x301440_var_ItemId)
end





function	x301440_ProcGpProcOver( varMap, varPlayer, varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc)
end



