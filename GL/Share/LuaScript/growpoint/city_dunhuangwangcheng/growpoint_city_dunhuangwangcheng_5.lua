

x301006_var_GatherPointTypeId = 7 
x301006_var_ItemId = 13020008 



function 	x301006_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301006_var_GatherPointTypeId, varMap, 0, x301006_var_ItemId)
end




function	 x301006_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301006_var_GatherPointTypeId, x301006_var_ItemId )
end




function	 x301006_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301006_var_GatherPointTypeId, x301006_var_ItemId )
end





function	x301006_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


