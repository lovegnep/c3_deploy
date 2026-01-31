

x301418_var_GatherPointTypeId = 318 
x301418_var_ItemId = 13060006 



function 	x301418_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301418_var_GatherPointTypeId, varMap, 0, x301418_var_ItemId)
end




function	 x301418_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301418_var_GatherPointTypeId, x301418_var_ItemId )
end




function	 x301418_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301418_var_GatherPointTypeId, x301418_var_ItemId )
	 return 0
end





function	x301418_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



