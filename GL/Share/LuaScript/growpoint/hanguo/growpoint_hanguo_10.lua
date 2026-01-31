

x301059_var_GatherPointTypeId = 59 
x301059_var_ItemId = 13011509 
x301059_var_FarScriptId = 300501



function 	x301059_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301059_var_GatherPointTypeId, varMap, 0, x301059_var_ItemId)
end




function	 x301059_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( x301059_var_FarScriptId, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301059_var_GatherPointTypeId, x301059_var_ItemId )
end




function	 x301059_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( x301059_var_FarScriptId, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301059_var_GatherPointTypeId, x301059_var_ItemId )
end





function	x301059_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301059_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
