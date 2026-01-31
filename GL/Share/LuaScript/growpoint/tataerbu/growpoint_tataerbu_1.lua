

x301025_var_GatherPointTypeId = 33 
x301025_var_ItemId = 13010023 



function 	x301025_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301025_var_GatherPointTypeId, varMap, 0, x301025_var_ItemId)
end




function	 x301025_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301025_var_GatherPointTypeId, x301025_var_ItemId )
end




function	 x301025_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301025_var_GatherPointTypeId, x301025_var_ItemId )
	 return 0
end





function	x301025_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


