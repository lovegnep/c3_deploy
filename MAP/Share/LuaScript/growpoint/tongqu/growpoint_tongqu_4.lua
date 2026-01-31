

x301073_var_GatherPointTypeId = 73 
x301073_var_ItemId = 13011753 



function 	x301073_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301073_var_GatherPointTypeId, varMap, 0, x301073_var_ItemId)
end




function	 x301073_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301073_var_GatherPointTypeId, x301073_var_ItemId )
end




function	 x301073_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301073_var_GatherPointTypeId, x301073_var_ItemId )
end





function	x301073_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301073_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
