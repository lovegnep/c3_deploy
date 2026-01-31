

x301305_var_GatherPointTypeId = 205 
x301305_var_ItemId = 13040027 



function 	x301305_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301305_var_GatherPointTypeId, varMap, 0, x301305_var_ItemId)
end




function	 x301305_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301305_var_GatherPointTypeId, x301305_var_ItemId )
end




function	 x301305_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301305_var_GatherPointTypeId, x301305_var_ItemId )
end





function	x301305_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


