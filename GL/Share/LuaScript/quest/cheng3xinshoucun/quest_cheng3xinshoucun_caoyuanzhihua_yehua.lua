

x203371_var_GatherPointTypeId = 230 
x203371_var_ItemId = 13810500


function 	x203371_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x203371_var_GatherPointTypeId, varMap, 0, x203371_var_ItemId)
end




function	 x203371_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x203371_var_GatherPointTypeId, x203371_var_ItemId )
end




function	 x203371_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 18,0 )
	Msg2Player(varMap, varPlayer, "ƒ„ªÒµ√¡À@item_13810500", 0, 3)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x203371_var_GatherPointTypeId, x203371_var_ItemId )
	return 0  
end





function	x203371_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


