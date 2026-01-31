

x301063_var_GatherPointTypeId = 63 
x301063_var_ItemId = 13010108 



function 	x301063_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301063_var_GatherPointTypeId, varMap, 0, x301063_var_ItemId)
end




function	 x301063_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301063_var_GatherPointTypeId, x301063_var_ItemId )
end




function	 x301063_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301063_var_GatherPointTypeId, x301063_var_ItemId )
end





function	x301063_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


