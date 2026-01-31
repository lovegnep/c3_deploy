

x301047_var_GatherPointTypeId = 192 
x301047_var_ItemId = 13810059 
x301047_var_QuestId = 300566



function 	x301047_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301047_var_GatherPointTypeId, varMap, 0, x301047_var_ItemId)
end




function	 x301047_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301047_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301047_var_GatherPointTypeId, x301047_var_ItemId )
end




function	 x301047_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301047_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301047_var_GatherPointTypeId, x301047_var_ItemId )
end





function	x301047_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



