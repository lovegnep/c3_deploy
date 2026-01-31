

x301007_var_GatherPointTypeId = 8 
x301007_var_ItemId = 13020009 



function 	x301007_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301007_var_GatherPointTypeId, varMap, 0, x301007_var_ItemId)
end




function	 x301007_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301007_var_GatherPointTypeId, x301007_var_ItemId )
end




function	 x301007_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301007_var_GatherPointTypeId, x301007_var_ItemId )
end





function	x301007_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


