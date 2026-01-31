

x301301_var_GatherPointTypeId = 201 
x301301_var_ItemId = 13040001 



function 	x301301_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301301_var_GatherPointTypeId, varMap, 0, x301301_var_ItemId)
end




function	 x301301_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301301_var_GatherPointTypeId, x301301_var_ItemId )
end




function	 x301301_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301301_var_GatherPointTypeId, x301301_var_ItemId )
end





function	x301301_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



