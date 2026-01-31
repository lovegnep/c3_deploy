

x301041_var_GatherPointTypeId = 121 
x301041_var_ItemId = 13011751 



function 	x301041_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301041_var_GatherPointTypeId, varMap, 0, x301041_var_ItemId)
end




function	 x301041_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301041_var_GatherPointTypeId, x301041_var_ItemId )
end




function	 x301041_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301041_var_GatherPointTypeId, x301041_var_ItemId )
end





function	x301041_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301041_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
