

x301222_var_GatherPointTypeId = 181 
x301222_var_ItemId = 13030099 



function 	x301222_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301222_var_GatherPointTypeId, varMap, 0, x301222_var_ItemId)
end




function	 x301222_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301222_var_GatherPointTypeId, x301222_var_ItemId )
end




function	 x301222_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301222_var_GatherPointTypeId, x301222_var_ItemId )
end





function	x301222_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


