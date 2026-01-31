

x301042_var_GatherPointTypeId = 122 
x301042_var_ItemId = 13011752 



function 	x301042_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301042_var_GatherPointTypeId, varMap, 0, x301042_var_ItemId)
end




function	 x301042_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301042_var_GatherPointTypeId, x301042_var_ItemId )
end




function	 x301042_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301042_var_GatherPointTypeId, x301042_var_ItemId )
end





function	x301042_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301042_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
