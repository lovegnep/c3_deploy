

x301075_var_GatherPointTypeId = 75 
x301075_var_ItemId = 13011755 



function 	x301075_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301075_var_GatherPointTypeId, varMap, 0, x301075_var_ItemId)
end




function	 x301075_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301075_var_GatherPointTypeId, x301075_var_ItemId )
end




function	 x301075_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301075_var_GatherPointTypeId, x301075_var_ItemId )
end





function	x301075_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301075_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
