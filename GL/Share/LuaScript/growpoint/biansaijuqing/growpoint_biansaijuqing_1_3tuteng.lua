

x110010_var_GatherPointTypeId = 1010 
x110010_var_ItemId = 13050006 



function 	x110010_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110010_var_GatherPointTypeId, varMap, 0, x110010_var_ItemId)
end




function	 x110010_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110010_var_GatherPointTypeId, x110010_var_ItemId )
end




function	 x110010_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110010_var_GatherPointTypeId, x110010_var_ItemId )
	 return 0
end





function	x110010_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

