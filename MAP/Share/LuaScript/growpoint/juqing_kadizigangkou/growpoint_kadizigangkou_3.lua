

x301503_var_GatherPointTypeId = 413 
x301503_var_ItemId = 13010134 



function 	x301503_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301503_var_GatherPointTypeId, varMap, 0, x301503_var_ItemId)
end




function	 x301503_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301503_var_GatherPointTypeId, x301503_var_ItemId )
end




function	 x301503_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301503_var_GatherPointTypeId, x301503_var_ItemId )
	 return 1
end





function	x301503_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end




