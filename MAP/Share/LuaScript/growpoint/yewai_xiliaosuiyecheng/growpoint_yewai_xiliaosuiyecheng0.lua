

x301417_var_GatherPointTypeId = 317 
x301417_var_ItemId = 13010120 



function 	x301417_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301417_var_GatherPointTypeId, varMap, 0, x301417_var_ItemId)
end




function	 x301417_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 203310, "Growpoint", varMap, varPlayer, 0 )
end




function	 x301417_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 203310, "Growpoint", varMap, varPlayer, 1)
end





function	x301417_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


