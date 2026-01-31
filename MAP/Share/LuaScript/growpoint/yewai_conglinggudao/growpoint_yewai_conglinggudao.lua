

x301452_var_GatherPointTypeId = 800 
x301452_var_ItemId = 13010028 



function 	x301452_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301452_var_GatherPointTypeId, varMap, 0, x301452_var_ItemId)
end




function	 x301452_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301452_var_GatherPointTypeId, x301452_var_ItemId )
end




function	 x301452_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301452_var_GatherPointTypeId, x301452_var_ItemId )
end





function	x301452_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



