

x301071_var_GatherPointTypeId = 71 
x301071_var_ItemId = 13011751 



function 	x301071_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301071_var_GatherPointTypeId, varMap, 0, x301071_var_ItemId)
end




function	 x301071_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301071_var_GatherPointTypeId, x301071_var_ItemId )
end




function	 x301071_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301071_var_GatherPointTypeId, x301071_var_ItemId )
end





function	x301071_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301071_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
