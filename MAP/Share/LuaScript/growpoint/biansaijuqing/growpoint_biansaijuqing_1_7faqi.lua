

x110014_var_GatherPointTypeId = 1014 
x110014_var_ItemId = 13050010 



function 	x110014_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110014_var_GatherPointTypeId, varMap, 0, x110014_var_ItemId)
end




function	 x110014_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110014_var_GatherPointTypeId, x110014_var_ItemId )
end




function	 x110014_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110014_var_GatherPointTypeId, x110014_var_ItemId )
	 return 0
end





function	x110014_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

