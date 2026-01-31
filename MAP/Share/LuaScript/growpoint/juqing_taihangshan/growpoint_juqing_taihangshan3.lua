

x301303_var_GatherPointTypeId = 203 
x301303_var_ItemId = 13040003 



function 	x301303_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301303_var_GatherPointTypeId, varMap, 0, x301303_var_ItemId)
end




function	 x301303_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301303_var_GatherPointTypeId, x301303_var_ItemId )
end




function	 x301303_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301303_var_GatherPointTypeId, x301303_var_ItemId )
end





function	x301303_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


