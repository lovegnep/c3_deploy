

x110007_var_GatherPointTypeId = 1007 
x110007_var_ItemId = 13050011 



function 	x110007_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110007_var_GatherPointTypeId, varMap, 0, x110007_var_ItemId)
end




function	 x110007_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110007_var_GatherPointTypeId, x110007_var_ItemId )
end




function	 x110007_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110007_var_GatherPointTypeId, x110007_var_ItemId )
	 return 0
end





function	x110007_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

