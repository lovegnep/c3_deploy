

x203314_var_GatherPointTypeId = 321 
x203314_var_ItemId = 13060019 



function 	x203314_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x203314_var_GatherPointTypeId, varMap, 0, x203314_var_ItemId)
end




function	 x203314_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x203314_var_GatherPointTypeId, x203314_var_ItemId )
end




function	 x203314_ProcGpRecycle(varMap,varPlayer,varTalknpc)
  LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x203314_var_GatherPointTypeId, x203314_var_ItemId )
	return 0
end





function	x203314_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



