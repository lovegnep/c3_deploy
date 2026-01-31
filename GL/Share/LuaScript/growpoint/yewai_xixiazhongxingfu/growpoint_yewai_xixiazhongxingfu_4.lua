

x301219_var_GatherPointTypeId = 169 
x301219_var_ItemId = 13030069 



function 	x301219_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301219_var_GatherPointTypeId, varMap, 0, x301219_var_ItemId)
end




function	 x301219_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301219_var_GatherPointTypeId, x301219_var_ItemId )
end




function	 x301219_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301219_var_GatherPointTypeId, x301219_var_ItemId )
end





function	x301219_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



