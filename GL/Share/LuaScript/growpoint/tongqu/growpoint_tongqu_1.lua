

x301070_var_GatherPointTypeId = 70 
x301070_var_ItemId = 13011750 



function 	x301070_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301070_var_GatherPointTypeId, varMap, 0, x301070_var_ItemId)
end




function	 x301070_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301070_var_GatherPointTypeId, x301070_var_ItemId )
end




function	 x301070_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301070_var_GatherPointTypeId, x301070_var_ItemId )
end





function	x301070_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301070_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
