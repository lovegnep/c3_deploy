

x301300_var_GatherPointTypeId = 200 
x301300_var_ItemId = 13040000 



function 	x301300_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301300_var_GatherPointTypeId, varMap, 0, x301300_var_ItemId)
end




function	 x301300_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301300_var_GatherPointTypeId, x301300_var_ItemId )
end




function	 x301300_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301300_var_GatherPointTypeId, x301300_var_ItemId )
end





function	x301300_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



