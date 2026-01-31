

x301054_var_GatherPointTypeId = 54 
x301054_var_ItemId = 13011504 
x301054_var_FarScriptId = 300520

x301054_var_ScriptTable = {
    300520, 
    300511, 
    300512, 
    300513, 
}



function 	x301054_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301054_var_GatherPointTypeId, varMap, 0, x301054_var_ItemId)
end




function	 x301054_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( x301054_var_ScriptTable[ GetCurCountry( varMap, varPlayer) + 1], "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301054_var_GatherPointTypeId, x301054_var_ItemId )
end




function	 x301054_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301054_var_ScriptTable[ GetCurCountry( varMap, varPlayer) + 1], "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301054_var_GatherPointTypeId, x301054_var_ItemId )
end





function	x301054_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301054_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
