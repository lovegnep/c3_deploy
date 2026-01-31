

x301014_var_GatherPointTypeId = 15 
x301014_var_ItemId = 13020304 



function 	x301014_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301014_var_GatherPointTypeId, varMap, 0, x301014_var_ItemId)
end




function	 x301014_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 270008, "Growpoint", varMap, varPlayer, 0 )
end




function	 x301014_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 270008, "Growpoint", varMap, varPlayer, 1)
end





function	x301014_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


