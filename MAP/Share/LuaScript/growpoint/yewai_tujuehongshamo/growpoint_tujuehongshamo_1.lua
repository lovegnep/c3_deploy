

x301419_var_GatherPointTypeId = 319 
x301419_var_ItemId = 13060015 



function 	x301419_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301419_var_GatherPointTypeId, varMap, 0, x301419_var_ItemId)
end




function	 x301419_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301419_var_GatherPointTypeId, x301419_var_ItemId )
end




function	 x301419_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301419_var_GatherPointTypeId, x301419_var_ItemId )
	return 0
end





function	x301419_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



