

x301224_var_GatherPointTypeId = 183 
x301224_var_ItemId = 13030104 



function 	x301224_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301224_var_GatherPointTypeId, varMap, 0, x301224_var_ItemId)
end




function	 x301224_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301224_var_GatherPointTypeId, x301224_var_ItemId )
end




function	 x301224_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301224_var_GatherPointTypeId, x301224_var_ItemId )
end





function	x301224_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



