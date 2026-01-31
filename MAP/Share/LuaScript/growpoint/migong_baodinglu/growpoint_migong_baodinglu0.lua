

x301363_var_GatherPointTypeId = 207 
x301363_var_ItemId = 13810048 



function 	x301363_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301363_var_GatherPointTypeId, varMap, 0, x301363_var_ItemId)
end




function	 x301363_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301363_var_GatherPointTypeId, x301363_var_ItemId )
end




function	 x301363_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301363_var_GatherPointTypeId, x301363_var_ItemId )
end





function	x301363_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end
