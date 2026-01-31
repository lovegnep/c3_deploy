

x301072_var_GatherPointTypeId = 72 
x301072_var_ItemId = 13011752 



function 	x301072_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301072_var_GatherPointTypeId, varMap, 0, x301072_var_ItemId)
end




function	 x301072_ProcGpOpen(varMap,varPlayer,varTalknpc)

	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301072_var_GatherPointTypeId, x301072_var_ItemId )
end




function	 x301072_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301072_var_GatherPointTypeId, x301072_var_ItemId )
end





function	x301072_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301072_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end
