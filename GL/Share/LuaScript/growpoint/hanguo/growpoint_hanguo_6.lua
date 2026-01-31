

x301055_var_GatherPointTypeId = 55 
x301055_var_ItemId = 13011505 
x301055_var_ScriptTable = {
    300520, 
    300511, 
    300512, 
    300513, 
}


function 	x301055_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301055_var_GatherPointTypeId, varMap, 0, x301055_var_ItemId)
end




function	 x301055_ProcGpOpen(varMap,varPlayer,varTalknpc)
    return LuaCallNoclosure( x301055_var_ScriptTable[ GetCurCountry( varMap, varPlayer) + 1], "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301055_var_GatherPointTypeId, x301055_var_ItemId )
end




function	 x301055_ProcGpRecycle(varMap,varPlayer,varTalknpc)
    return LuaCallNoclosure( x301055_var_ScriptTable[ GetCurCountry( varMap, varPlayer) + 1], "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301055_var_GatherPointTypeId, x301055_var_ItemId )
end





function	x301055_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301055_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
