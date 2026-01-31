

x301034_var_GatherPointTypeId = 136 
x301034_var_ItemId = 13010123 



function 	x301034_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301034_var_GatherPointTypeId, varMap, 0, x301034_var_ItemId)
end




function	 x301034_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301034_var_GatherPointTypeId, x301034_var_ItemId )
end




function	 x301034_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301034_var_GatherPointTypeId, x301034_var_ItemId )
	 return 0 
end





function	x301034_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



