

x301228_var_GatherPointTypeId = 187 
x301228_var_ItemId = 13030108 



function 	x301228_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301228_var_GatherPointTypeId, varMap, 0, x301228_var_ItemId)
end




function	 x301228_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301228_var_GatherPointTypeId, x301228_var_ItemId )
end




function	 x301228_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301228_var_GatherPointTypeId, x301228_var_ItemId )
end





function	x301228_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



