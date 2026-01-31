

x301364_var_GatherPointTypeId = 218 
x301364_var_ItemId = 13810050 



function 	x301364_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301364_var_GatherPointTypeId, varMap, 0, x301364_var_ItemId)
end




function	 x301364_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301364_var_GatherPointTypeId, x301364_var_ItemId )
end




function	 x301364_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301364_var_GatherPointTypeId, x301364_var_ItemId )
end





function	x301364_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end
