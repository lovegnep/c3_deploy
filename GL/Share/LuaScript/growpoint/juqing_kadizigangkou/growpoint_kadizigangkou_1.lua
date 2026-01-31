

x301501_var_GatherPointTypeId = 411 
x301501_var_ItemId = 13010131 



function 	x301501_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301501_var_GatherPointTypeId, varMap, 0, x301501_var_ItemId)
end




function	 x301501_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301501_var_GatherPointTypeId, x301501_var_ItemId )
end




function	 x301501_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301501_var_GatherPointTypeId, x301501_var_ItemId )
	 return 1
end





function	x301501_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end




