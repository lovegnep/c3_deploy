

x301057_var_GatherPointTypeId = 57 
x301057_var_ItemId = 13011507 
x301057_var_FarScriptId = 300501



function 	x301057_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301057_var_GatherPointTypeId, varMap, 0, x301057_var_ItemId)
end




function	 x301057_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( x301057_var_FarScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301057_var_GatherPointTypeId, x301057_var_ItemId )
end




function	 x301057_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301057_var_FarScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301057_var_GatherPointTypeId, x301057_var_ItemId )
end





function	x301057_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301057_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
