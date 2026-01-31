

x301064_var_GatherPointTypeId = 64 
x301064_var_ItemId = 13010119 



function 	x301064_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301064_var_GatherPointTypeId, varMap, 0, x301064_var_ItemId)
end




function	 x301064_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301064_var_GatherPointTypeId, x301064_var_ItemId )
end




function	 x301064_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301064_var_GatherPointTypeId, x301064_var_ItemId )
end





function	x301064_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

