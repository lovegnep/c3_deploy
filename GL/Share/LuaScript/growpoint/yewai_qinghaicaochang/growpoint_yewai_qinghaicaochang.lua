

x301456_var_GatherPointTypeId = 830
x301456_var_ItemId =  13810258 



function 	x301456_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301456_var_GatherPointTypeId, varMap, 0, x301456_var_ItemId)
end




function	 x301456_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301456_var_GatherPointTypeId, x301456_var_ItemId )
end




function	 x301456_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301456_var_GatherPointTypeId, x301456_var_ItemId )
end





function	x301456_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



