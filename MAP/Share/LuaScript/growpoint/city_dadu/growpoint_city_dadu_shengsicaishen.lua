

x301043_var_GatherPointTypeId = 188 
x301043_var_ItemId = 13810055 
x301043_var_QuestId = 300566



function 	x301043_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301043_var_GatherPointTypeId, varMap, 0, x301043_var_ItemId)
end




function	 x301043_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301043_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301043_var_GatherPointTypeId, x301043_var_ItemId )
end




function	 x301043_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301043_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301043_var_GatherPointTypeId, x301043_var_ItemId )
end





function	x301043_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



