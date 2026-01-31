

x301211_var_GatherPointTypeId = 161 
x301211_var_ItemId = 13030046 



function 	x301211_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301211_var_GatherPointTypeId, varMap, 0, x301211_var_ItemId)
end




function	 x301211_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301211_var_GatherPointTypeId, x301211_var_ItemId )
end




function	 x301211_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301211_var_GatherPointTypeId, x301211_var_ItemId )
 return 0
end






function	x301211_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


