

x301358_var_GatherPointTypeId = 308 
x301358_var_ItemId = 13020224 



function 	x301358_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301358_var_GatherPointTypeId, varMap, 0, x301358_var_ItemId)
end




function	 x301358_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301358_var_GatherPointTypeId, x301358_var_ItemId )
end




function	 x301358_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301358_var_GatherPointTypeId, x301358_var_ItemId )
end





function	x301358_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


