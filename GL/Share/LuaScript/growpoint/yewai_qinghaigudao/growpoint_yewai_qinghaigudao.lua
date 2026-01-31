

x301455_var_GatherPointTypeId = 820
x301455_var_ItemId =  13810250 



function 	x301455_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301455_var_GatherPointTypeId, varMap, 0, x301455_var_ItemId)
end




function	 x301455_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301455_var_GatherPointTypeId, x301455_var_ItemId )
end




function	 x301455_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301455_var_GatherPointTypeId, x301455_var_ItemId )
end





function	x301455_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



