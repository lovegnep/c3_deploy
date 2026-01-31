

x301017_var_GatherPointTypeId = 18 
x301017_var_ItemId = 13010029 



function 	x301017_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301017_var_GatherPointTypeId, varMap, 0, x301017_var_ItemId)
end




function	 x301017_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 270013, "Growpoint", varMap, varPlayer, 0 )
end




function	 x301017_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 270013, "Growpoint", varMap, varPlayer, 1 )
end





function	x301017_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


