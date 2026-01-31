

x301015_var_GatherPointTypeId = 16 
x301015_var_ItemId = 13010029 



function 	x301015_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301015_var_GatherPointTypeId, varMap, 0, x301015_var_ItemId)
end




function	 x301015_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 270012, "Growpoint", varMap, varPlayer, 0 )
end




function	 x301015_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( 270012, "Growpoint", varMap, varPlayer, 1 )
end





function	x301015_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


