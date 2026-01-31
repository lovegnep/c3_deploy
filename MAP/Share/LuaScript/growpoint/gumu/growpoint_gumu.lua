

x301066_var_GatherPointTypeId = 66 
x301066_var_ItemId = 13010115 



function 	x301066_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301066_var_GatherPointTypeId, varMap, 0, x301066_var_ItemId)
end




function	 x301066_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301066_var_GatherPointTypeId, x301066_var_ItemId )
end




function	 x301066_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301066_var_GatherPointTypeId, x301066_var_ItemId )
end





function	x301066_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301066_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end
