

x301012_var_GatherPointTypeId = 13 
x301012_var_ItemId = 13010029 



function 	x301012_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301012_var_GatherPointTypeId, varMap, 0, x301012_var_ItemId)
end




function	 x301012_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 270001, "Growpoint", varMap, varPlayer, 0 )
end




function	 x301012_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 270001, "Growpoint", varMap, varPlayer, 1 )
end





function	x301012_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


