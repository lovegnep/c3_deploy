

x301308_var_GatherPointTypeId = 174 
x301308_var_ItemId = 13030121
 



function 	x301308_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301308_var_GatherPointTypeId, varMap, 0, x301308_var_ItemId)
end




function	 x301308_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301308_var_GatherPointTypeId, x301308_var_ItemId )
end




function	 x301308_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301308_var_GatherPointTypeId, x301308_var_ItemId )
end





function	x301308_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


