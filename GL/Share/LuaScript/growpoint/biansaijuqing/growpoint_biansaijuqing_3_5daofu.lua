

x110028_var_GatherPointTypeId = 1028 
x110028_var_ItemId = 13050008 



function 	x110028_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x110028_var_GatherPointTypeId, varMap, 0, x110028_var_ItemId)
end




function	 x110028_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x110028_var_GatherPointTypeId, x110028_var_ItemId )
end




function	 x110028_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x110028_var_GatherPointTypeId, x110028_var_ItemId )
	 return 0
end





function	x110028_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

