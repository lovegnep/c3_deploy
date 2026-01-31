

x301367_var_GatherPointTypeId = 221 
x301367_var_ItemId = 13810053 



function 	x301367_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301367_var_GatherPointTypeId, varMap, 0, x301367_var_ItemId)
end




function	 x301367_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301367_var_GatherPointTypeId, x301367_var_ItemId )
end




function	 x301367_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301367_var_GatherPointTypeId, x301367_var_ItemId )
end





function	x301367_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end
