

x301500_var_GatherPointTypeId = 410 
x301500_var_ItemId = 13010126 



function 	x301500_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301500_var_GatherPointTypeId, varMap, 0, x301500_var_ItemId)
end




function	 x301500_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301500_var_GatherPointTypeId, x301500_var_ItemId )
end




function	 x301500_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301500_var_GatherPointTypeId, x301500_var_ItemId )
	 return 1
end





function	x301500_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end




