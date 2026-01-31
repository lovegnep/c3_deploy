

x301350_var_GatherPointTypeId = 300 
x301350_var_ItemId = 13020200 



function 	x301350_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301350_var_GatherPointTypeId, varMap, 0, x301350_var_ItemId)
end




function	 x301350_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301350_var_GatherPointTypeId, x301350_var_ItemId )
end




function	 x301350_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301350_var_GatherPointTypeId, x301350_var_ItemId )
end





function	x301350_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


