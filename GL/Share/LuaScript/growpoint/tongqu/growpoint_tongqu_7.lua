

x301076_var_GatherPointTypeId = 76 
x301076_var_ItemId = 13011756 



function 	x301076_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301076_var_GatherPointTypeId, varMap, 0, x301076_var_ItemId)
end




function	 x301076_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301076_var_GatherPointTypeId, x301076_var_ItemId )
end




function	 x301076_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301076_var_GatherPointTypeId, x301076_var_ItemId )
end





function	x301076_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301076_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
