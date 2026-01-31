

x301001_var_GatherPointTypeId = 2 
x301001_var_ItemId = 13010040 



function 	x301001_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301001_var_GatherPointTypeId, varMap, 0, x301001_var_ItemId)
end




function	 x301001_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301001_var_GatherPointTypeId, x301001_var_ItemId )
end




function	 x301001_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301001_var_GatherPointTypeId, x301001_var_ItemId )
	 return 0 
end





function	x301001_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



