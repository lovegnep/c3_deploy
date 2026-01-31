

x301000_var_GatherPointTypeId = 1 
x301000_var_ItemId = 13010029 



function 	x301000_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301000_var_GatherPointTypeId, varMap, 0, x301000_var_ItemId)
end




function	 x301000_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301000_var_GatherPointTypeId, x301000_var_ItemId )
end




function	 x301000_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301000_var_GatherPointTypeId, x301000_var_ItemId )
	 return 0        	
end





function	x301000_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end




