

x301065_var_GatherPointTypeId = 65 
x301065_var_ItemId = 13010120 



function 	x301065_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301065_var_GatherPointTypeId, varMap, 0, x301065_var_ItemId)
end




function	 x301065_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301065_var_GatherPointTypeId, x301065_var_ItemId )
end




function	 x301065_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301065_var_GatherPointTypeId, x301065_var_ItemId )
end





function	x301065_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


