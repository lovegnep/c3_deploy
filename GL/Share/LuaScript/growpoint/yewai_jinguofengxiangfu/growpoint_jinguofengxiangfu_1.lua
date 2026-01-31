

x301208_var_GatherPointTypeId = 158 
x301208_var_ItemId = 13030023 



function 	x301208_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301208_var_GatherPointTypeId, varMap, 0, x301208_var_ItemId)
end




function	 x301208_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301208_var_GatherPointTypeId, x301208_var_ItemId )
end




function	 x301208_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301208_var_GatherPointTypeId, x301208_var_ItemId )
 return 0
end






function	x301208_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


