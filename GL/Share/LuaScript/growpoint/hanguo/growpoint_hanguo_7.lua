

x301056_var_GatherPointTypeId = 56 
x301056_var_ItemId = 13011506 
x301056_var_ScriptTable = {
    300520, 
    300511, 
    300512, 
    300513, 
}


function 	x301056_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301056_var_GatherPointTypeId, varMap, 0, x301056_var_ItemId)
end




function	 x301056_ProcGpOpen(varMap,varPlayer,varTalknpc)
    return LuaCallNoclosure( x301056_var_ScriptTable[ GetCurCountry( varMap, varPlayer) + 1], "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301056_var_GatherPointTypeId, x301056_var_ItemId )
end




function	 x301056_ProcGpRecycle(varMap,varPlayer,varTalknpc)
    return LuaCallNoclosure( x301056_var_ScriptTable[ GetCurCountry( varMap, varPlayer) + 1], "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301056_var_GatherPointTypeId, x301056_var_ItemId )
end





function	x301056_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301056_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
