

x301361_var_GatherPointTypeId = 311 
x301361_var_ItemId = 13010120 



function 	x301361_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301361_var_GatherPointTypeId, varMap, 0, x301361_var_ItemId)
end




function	 x301361_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 202000, "Growpoint", varMap, varPlayer, 0 )
end




function	 x301361_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( 202000, "Growpoint", varMap, varPlayer, 1)
	return 0
end





function	x301361_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


