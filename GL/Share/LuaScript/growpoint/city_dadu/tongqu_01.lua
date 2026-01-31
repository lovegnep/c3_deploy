

x301040_var_GatherPointTypeId = 120 
x301040_var_ItemId = 13011750 



function 	x301040_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301040_var_GatherPointTypeId, varMap, 0, x301040_var_ItemId)
end




function	 x301040_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301040_var_GatherPointTypeId, x301040_var_ItemId )
end




function	 x301040_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301040_var_GatherPointTypeId, x301040_var_ItemId )
end





function	x301040_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301040_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
