

x301051_var_GatherPointTypeId = 51 
x301051_var_ItemId = 13011500 
x301051_var_FarScriptId = 300520

x301051_var_ScriptTable = {
    300520, 
    300511, 
    300512, 
    300513, 
}



function 	x301051_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301051_var_GatherPointTypeId, varMap, 0, x301051_var_ItemId)
end




function	 x301051_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( x301051_var_ScriptTable[ GetCurCountry( varMap, varPlayer) + 1], "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301051_var_GatherPointTypeId, x301051_var_ItemId )
end




function	 x301051_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301051_var_ScriptTable[ GetCurCountry( varMap, varPlayer) + 1], "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301051_var_GatherPointTypeId, x301051_var_ItemId )
end





function	x301051_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301051_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
