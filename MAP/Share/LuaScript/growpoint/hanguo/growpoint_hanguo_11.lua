

x301060_var_GatherPointTypeId = 60 
x301060_var_ItemId = 13011510 
x301060_var_FarScriptId = 300501



function 	x301060_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301060_var_GatherPointTypeId, varMap, 0, x301060_var_ItemId)
end




function	 x301060_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( x301060_var_FarScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301060_var_GatherPointTypeId, x301060_var_ItemId )
end




function	 x301060_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301060_var_FarScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301060_var_GatherPointTypeId, x301060_var_ItemId )
end





function	x301060_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301060_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
