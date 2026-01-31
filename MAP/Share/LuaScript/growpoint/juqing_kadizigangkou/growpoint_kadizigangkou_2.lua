

x301502_var_GatherPointTypeId = 412 
x301502_var_ItemId = 13010133 



function 	x301502_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301502_var_GatherPointTypeId, varMap, 0, x301502_var_ItemId)
end




function	 x301502_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301502_var_GatherPointTypeId, x301502_var_ItemId )
end




function	 x301502_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301502_var_GatherPointTypeId, x301502_var_ItemId )
	 return 1
end





function	x301502_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end




