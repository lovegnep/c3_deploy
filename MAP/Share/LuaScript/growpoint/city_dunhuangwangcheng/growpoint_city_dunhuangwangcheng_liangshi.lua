

x301311_var_GatherPointTypeId = 177 
x301311_var_ItemId = 13030088 



function 	x301311_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301311_var_GatherPointTypeId, varMap, 0, x301311_var_ItemId)
end




function	 x301311_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301311_var_GatherPointTypeId, x301311_var_ItemId )
end




function	 x301311_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301311_var_GatherPointTypeId, x301311_var_ItemId )
	 return 0
end





function	x301311_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


