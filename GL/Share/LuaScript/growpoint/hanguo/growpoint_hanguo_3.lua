

x301052_var_GatherPointTypeId = 52 
x301052_var_ItemId = 13011506 
x301052_var_FarScriptId = 300520

x301052_var_ScriptTable = {
    300520, 
    300511, 
    300512, 
    300513, 
}


function 	x301052_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301052_var_GatherPointTypeId, varMap, 0, x301052_var_ItemId)
end




function	 x301052_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( x301052_var_ScriptTable[ GetCurCountry( varMap, varPlayer) + 1], "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301052_var_GatherPointTypeId, x301052_var_ItemId )
end




function	 x301052_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301052_var_ScriptTable[ GetCurCountry( varMap, varPlayer) + 1], "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301052_var_GatherPointTypeId, x301052_var_ItemId )
end





function	x301052_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301052_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
