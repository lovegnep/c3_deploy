

x301414_var_GatherPointTypeId = 314 
x301414_var_ItemId = 13020420 



function 	x301414_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301414_var_GatherPointTypeId, varMap, 0, x301414_var_ItemId)
end




function	 x301414_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301414_var_GatherPointTypeId, x301414_var_ItemId )
end




function	 x301414_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301414_var_GatherPointTypeId, x301414_var_ItemId )
end





function	x301414_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end

