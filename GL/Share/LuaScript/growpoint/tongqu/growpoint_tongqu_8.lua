

x301077_var_GatherPointTypeId = 77 
x301077_var_ItemId = 13011757 



function 	x301077_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301077_var_GatherPointTypeId, varMap, 0, x301077_var_ItemId)
end




function	 x301077_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301077_var_GatherPointTypeId, x301077_var_ItemId )
end




function	 x301077_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301077_var_GatherPointTypeId, x301077_var_ItemId )
end





function	x301077_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301077_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
