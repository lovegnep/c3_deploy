

x301356_var_GatherPointTypeId = 306 
x301356_var_ItemId = 13020222 



function 	x301356_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301356_var_GatherPointTypeId, varMap, 0, x301356_var_ItemId)
end




function	 x301356_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301356_var_GatherPointTypeId, x301356_var_ItemId )
end




function	 x301356_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301356_var_GatherPointTypeId, x301356_var_ItemId )
end





function	x301356_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


