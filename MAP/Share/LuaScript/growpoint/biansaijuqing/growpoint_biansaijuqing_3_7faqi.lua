

x110030_var_GatherPointTypeId = 1030 
x110030_var_ItemId = 13050010 



function 	x110030_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110030_var_GatherPointTypeId, varMap, 0, x110030_var_ItemId)
end




function	 x110030_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110030_var_GatherPointTypeId, x110030_var_ItemId )
end




function	 x110030_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110030_var_GatherPointTypeId, x110030_var_ItemId )
	 return 0
end





function	x110030_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

