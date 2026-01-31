

x301420_var_GatherPointTypeId = 320 
x301420_var_ItemId = 13060017 



function 	x301420_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301420_var_GatherPointTypeId, varMap, 0, x301420_var_ItemId)
end




function	 x301420_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301420_var_GatherPointTypeId, x301420_var_ItemId )
end




function	 x301420_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301420_var_GatherPointTypeId, x301420_var_ItemId )
	 return 0
end





function	x301420_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



