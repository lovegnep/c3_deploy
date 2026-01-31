

x301074_var_GatherPointTypeId = 74 
x301074_var_ItemId = 13011754 



function 	x301074_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301074_var_GatherPointTypeId, varMap, 0, x301074_var_ItemId)
end




function	 x301074_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301074_var_GatherPointTypeId, x301074_var_ItemId )
end




function	 x301074_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301074_var_GatherPointTypeId, x301074_var_ItemId )
end





function	x301074_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301074_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
