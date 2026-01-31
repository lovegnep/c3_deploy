

x301454_var_GatherPointTypeId = 811
x301454_var_ItemId = 13020211 



function 	x301454_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301454_var_GatherPointTypeId, varMap, 0, x301454_var_ItemId)
end




function	 x301454_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301454_var_GatherPointTypeId, x301454_var_ItemId )
end




function	 x301454_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301454_var_GatherPointTypeId, x301454_var_ItemId )
end





function	x301454_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



