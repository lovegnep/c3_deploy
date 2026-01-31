

x301044_var_GatherPointTypeId = 189 
x301044_var_ItemId = 13810056 
x301044_var_QuestId = 300566



function 	x301044_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301044_var_GatherPointTypeId, varMap, 0, x301044_var_ItemId)
end




function	 x301044_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301044_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301044_var_GatherPointTypeId, x301044_var_ItemId )
end




function	 x301044_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301044_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301044_var_GatherPointTypeId, x301044_var_ItemId )
end





function	x301044_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



