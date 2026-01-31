

x301033_var_GatherPointTypeId = 40 
x301033_var_ItemId = 13010041 



function 	x301033_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301033_var_GatherPointTypeId, varMap, 0, x301033_var_ItemId)
end




function	 x301033_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301033_var_GatherPointTypeId, x301033_var_ItemId )
end




function	 x301033_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301033_var_GatherPointTypeId, x301033_var_ItemId )
	 return 0 
end





function	x301033_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



