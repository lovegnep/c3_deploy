

x301359_var_GatherPointTypeId = 309 
x301359_var_ItemId = 13020227 



function 	x301359_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301359_var_GatherPointTypeId, varMap, 0, x301359_var_ItemId)
end




function	 x301359_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301359_var_GatherPointTypeId, x301359_var_ItemId )
end




function	 x301359_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301359_var_GatherPointTypeId, x301359_var_ItemId )
end





function	x301359_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


