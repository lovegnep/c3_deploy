

x301227_var_GatherPointTypeId = 186 
x301227_var_ItemId = 13030107 



function 	x301227_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301227_var_GatherPointTypeId, varMap, 0, x301227_var_ItemId)
end




function	 x301227_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301227_var_GatherPointTypeId, x301227_var_ItemId )
end




function	 x301227_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301227_var_GatherPointTypeId, x301227_var_ItemId )
end





function	x301227_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


