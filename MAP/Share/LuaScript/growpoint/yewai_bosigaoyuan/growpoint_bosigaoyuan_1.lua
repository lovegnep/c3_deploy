

x301369_var_GatherPointTypeId = 333 
x301369_var_ItemId = 13010120 



function 	x301369_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301369_var_GatherPointTypeId, varMap, 0, x301369_var_ItemId)
end




function	 x301369_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 203317, "Growpoint", varMap, varPlayer, 0 )
end




function	 x301369_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 203317, "Growpoint", varMap, varPlayer, 1)
end





function	x301369_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


