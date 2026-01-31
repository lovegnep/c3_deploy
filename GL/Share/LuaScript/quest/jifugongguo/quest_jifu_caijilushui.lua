

x203339_var_GrowpointId = 222 
x203339_var_ItemIndex = 13040039 



function 	x203339_ProcGpCreate(varMap,growPointType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x203339_var_GrowpointId, varMap, 0, x203339_var_ItemIndex)
end




function	 x203339_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x203339_var_GrowpointId, x203339_var_ItemIndex )
end




function	 x203339_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x203339_var_GrowpointId, x203339_var_ItemIndex )
	return 0
end





function	x203339_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


