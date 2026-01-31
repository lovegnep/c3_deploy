

x110033_var_GatherPointTypeId = 1033 
x110033_var_ItemId = 13050017 



function 	x110033_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110033_var_GatherPointTypeId, varMap, 0, x110033_var_ItemId)
end




function	 x110033_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110033_var_GatherPointTypeId, x110033_var_ItemId )
end




function	 x110033_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110033_var_GatherPointTypeId, x110033_var_ItemId )
	 return 0
end





function	x110033_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

