

x301013_var_GatherPointTypeId = 14 
x301013_var_ItemId = 13020304 



function 	x301013_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301013_var_GatherPointTypeId, varMap, 0, x301013_var_ItemId)
end




function	 x301013_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 270003, "Growpoint", varMap, varPlayer, 0 )
end




function	 x301013_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 270003, "Growpoint", varMap, varPlayer, 1 )
end





function	x301013_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


