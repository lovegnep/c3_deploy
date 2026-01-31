

x301360_var_GatherPointTypeId = 310 
x301360_var_ItemId = 13020234 



function 	x301360_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301360_var_GatherPointTypeId, varMap, 0, x301360_var_ItemId)
end




function	 x301360_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301360_var_GatherPointTypeId, x301360_var_ItemId )
end




function	 x301360_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301360_var_GatherPointTypeId, x301360_var_ItemId )
end





function	x301360_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


