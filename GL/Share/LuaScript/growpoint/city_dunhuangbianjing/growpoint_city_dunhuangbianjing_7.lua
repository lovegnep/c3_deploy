

x301357_var_GatherPointTypeId = 307 
x301357_var_ItemId = 13020223 



function 	x301357_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301357_var_GatherPointTypeId, varMap, 0, x301357_var_ItemId)
end




function	 x301357_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301357_var_GatherPointTypeId, x301357_var_ItemId )
end




function	 x301357_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301357_var_GatherPointTypeId, x301357_var_ItemId )
end





function	x301357_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


