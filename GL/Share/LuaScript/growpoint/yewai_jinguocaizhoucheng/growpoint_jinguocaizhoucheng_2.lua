

x301213_var_GatherPointTypeId = 163 
x301213_var_ItemId = 13030050 



function 	x301213_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301213_var_GatherPointTypeId, varMap, 0, x301213_var_ItemId)
end




function	 x301213_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301213_var_GatherPointTypeId, x301213_var_ItemId )
end




function	 x301213_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301213_var_GatherPointTypeId, x301213_var_ItemId )
 return 0
end






function	x301213_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


