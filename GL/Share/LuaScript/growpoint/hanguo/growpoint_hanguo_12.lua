

x301061_var_GatherPointTypeId = 61 
x301061_var_ItemId = 13011511 
x301061_var_FarScriptId = 300501



function 	x301061_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301061_var_GatherPointTypeId, varMap, 0, x301061_var_ItemId)
end




function	 x301061_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( x301061_var_FarScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301061_var_GatherPointTypeId, x301061_var_ItemId )
end




function	 x301061_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301061_var_FarScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301061_var_GatherPointTypeId, x301061_var_ItemId )
end





function	x301061_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301061_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
