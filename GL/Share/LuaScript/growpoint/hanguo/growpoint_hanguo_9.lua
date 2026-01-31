

x301058_var_GatherPointTypeId = 58 
x301058_var_ItemId = 13011508 
x301058_var_ScriptTable = {
    300520, 
    300511, 
    300512, 
    300513, 
}



function 	x301058_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301058_var_GatherPointTypeId, varMap, 0, x301058_var_ItemId)
end




function	 x301058_ProcGpOpen(varMap,varPlayer,varTalknpc)
    return LuaCallNoclosure( x301058_var_ScriptTable[ GetCurCountry( varMap, varPlayer) + 1], "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301058_var_GatherPointTypeId, x301058_var_ItemId )
end




function	 x301058_ProcGpRecycle(varMap,varPlayer,varTalknpc)
    return LuaCallNoclosure( x301058_var_ScriptTable[ GetCurCountry( varMap, varPlayer) + 1], "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301058_var_GatherPointTypeId, x301058_var_ItemId )
end





function	x301058_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301058_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
