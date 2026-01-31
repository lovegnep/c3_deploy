

x301046_var_GatherPointTypeId = 191 
x301046_var_ItemId = 13810058 
x301046_var_QuestId = 300566



function 	x301046_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301046_var_GatherPointTypeId, varMap, 0, x301046_var_ItemId)
end




function	 x301046_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301046_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301046_var_GatherPointTypeId, x301046_var_ItemId )
end




function	 x301046_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301046_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301046_var_GatherPointTypeId, x301046_var_ItemId )
end





function	x301046_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



