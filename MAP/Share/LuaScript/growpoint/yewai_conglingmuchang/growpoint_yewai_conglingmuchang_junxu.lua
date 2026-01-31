

x301102_var_GatherPointTypeId = 195 
x301102_var_ItemId = 13010121
x301102_var_QuestID = 3209



function 	x301102_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301102_var_GatherPointTypeId, varMap, 0, x301102_var_ItemId)
end




function	 x301102_ProcGpOpen(varMap,varPlayer,varTalknpc)
	if IsHaveQuest(varMap,varPlayer,x301102_var_QuestID) > 0 and IsQuestHaveDone(varMap,varPlayer,x301102_var_QuestID) < 0 then
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 18,0 )
		Msg2Player(varMap, varPlayer, "开始为护卫打绷带", 0, 3)
	end
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, x301102_var_GatherPointTypeId, x301102_var_ItemId )
end




function	 x301102_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x301102_var_GatherPointTypeId, x301102_var_ItemId )
	return 0
end





function	x301102_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	Msg2Player(varMap, varPlayer, "护卫缓缓睁开了眼，满怀感激，赠送给你了几件装备", 0, 3)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


