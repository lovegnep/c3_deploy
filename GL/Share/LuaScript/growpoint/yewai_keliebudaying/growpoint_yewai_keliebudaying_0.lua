

x301003_var_GatherPointTypeId = 4 
x301003_var_ItemId = 13030056 



function 	x301003_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301003_var_GatherPointTypeId, varMap, 0, x301003_var_ItemId)
end




function	 x301003_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301003_var_GatherPointTypeId, x301003_var_ItemId )
end




function	 x301003_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301003_var_GatherPointTypeId, x301003_var_ItemId )
end





function	x301003_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


