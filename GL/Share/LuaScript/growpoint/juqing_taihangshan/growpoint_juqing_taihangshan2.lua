

x301302_var_GatherPointTypeId = 202 
x301302_var_ItemId = 13040002 



function 	x301302_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301302_var_GatherPointTypeId, varMap, 0, x301302_var_ItemId)
end




function	 x301302_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301302_var_GatherPointTypeId, x301302_var_ItemId )
end




function	 x301302_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301302_var_GatherPointTypeId, x301302_var_ItemId )
	return 0 
end





function	x301302_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


