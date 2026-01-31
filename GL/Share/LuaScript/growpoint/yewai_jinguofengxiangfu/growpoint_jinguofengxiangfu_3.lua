

x301210_var_GatherPointTypeId = 160 
x301210_var_ItemId = 13030045 



function 	x301210_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301210_var_GatherPointTypeId, varMap, 0, x301210_var_ItemId)
end




function	 x301210_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301210_var_GatherPointTypeId, x301210_var_ItemId )
end




function	 x301210_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301210_var_GatherPointTypeId, x301210_var_ItemId )
 return 0
end






function	x301210_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


