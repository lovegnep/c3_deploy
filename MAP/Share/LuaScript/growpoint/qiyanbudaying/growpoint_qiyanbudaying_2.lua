

x301002_var_GatherPointTypeId = 3 
x301002_var_ItemId = 13010031 



function 	x301002_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301002_var_GatherPointTypeId, varMap, 0, x301002_var_ItemId)
end




function	 x301002_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301002_var_GatherPointTypeId, x301002_var_ItemId )
end




function	 x301002_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301002_var_GatherPointTypeId, x301002_var_ItemId )
	 return 0
end





function	x301002_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end




