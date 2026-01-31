

x301450_var_GatherPointTypeId = 125 
x301450_var_ItemId = 13010029 



function 	x301450_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301450_var_GatherPointTypeId, varMap, 0, x301450_var_ItemId)
end




function	 x301450_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 203328, "Growpoint", varMap, varPlayer, 0 )
end




function	 x301450_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	 LuaCallNoclosure( 203328, "Growpoint", varMap, varPlayer, 1 )
	  return 0
end





function	x301450_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


