

x301352_var_GatherPointTypeId = 302 
x301352_var_ItemId = 13020208 



function 	x301352_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301352_var_GatherPointTypeId, varMap, 0, x301352_var_ItemId)
end




function	 x301352_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301352_var_GatherPointTypeId, x301352_var_ItemId )
end




function	 x301352_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301352_var_GatherPointTypeId, x301352_var_ItemId )
end





function	x301352_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


