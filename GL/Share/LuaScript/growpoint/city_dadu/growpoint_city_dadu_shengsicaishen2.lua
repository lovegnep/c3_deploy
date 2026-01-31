

x301045_var_GatherPointTypeId = 190 
x301045_var_ItemId = 13810057 
x301045_var_QuestId = 300566



function 	x301045_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301045_var_GatherPointTypeId, varMap, 0, x301045_var_ItemId)
end




function	 x301045_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301045_var_QuestId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301045_var_GatherPointTypeId, x301045_var_ItemId )
end




function	 x301045_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301045_var_QuestId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301045_var_GatherPointTypeId, x301045_var_ItemId )
end





function	x301045_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



