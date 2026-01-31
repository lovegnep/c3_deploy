
x300959_var_FileId              			= 300959
x300959_var_QuestName          			="【国家】图腾进贡"

x300959_var_QuestId						= {7760, 7761, 7762, 7763, 7764, 7765, 7766, 7767, 7768}
x300959_var_Laird							= {6, 9, 13, 18, 21, 24, 27, 31, 34}




function x300959_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local varState = 8
	for varI, item in x300959_var_QuestId do
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, item)
		if varState == 7 then
			break
		end
	end
	if varState == 8 then
		local varRet = 1
		local varCountry = GetCurCountry(varMap, varPlayer)
		for varI, item in x300959_var_Laird do
			local nLairdCountry = GetSceneLairdCountryId(item)
			if nLairdCountry == varCountry then
				varRet = 0
				break
			end
		end
		if varRet == 1 then
			return
		end
	end
	TalkAppendButton(varMap,x300959_var_FileId,x300959_var_QuestName,varState,x300959_var_FileId)
end




function x300959_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )
	
	StartTalkTask(varMap)
	
		TalkAppendString( varMap, "\t领地图腾最高等级为#G5级#W，达到#G40级#W的玩家，可为领地图腾进贡从而升级图腾等级。进贡后可获得#G经验#W、#G天赋值#W奖励。请选择#G本国占领的图腾#W进行进贡！请注意只有在每日的#R9点-23点#W才可接受和完成任务！" )
		LuaCallNoclosure(300950,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 1)
		LuaCallNoclosure(300951,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 2)
		LuaCallNoclosure(300952,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 3)
		LuaCallNoclosure(300953,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 4)
		LuaCallNoclosure(300954,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 5)
		LuaCallNoclosure(300955,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 6)
		LuaCallNoclosure(300956,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 7)
		LuaCallNoclosure(300957,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 8)
		LuaCallNoclosure(300958,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 9)
    
    StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)	

    return 1

end




function x300959_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x300959_ProcAccept( varMap, varPlayer )
end




function x300959_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x300959_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x300959_CheckSubmit( varMap, varPlayer )
end




function x300959_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x300959_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x300959_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300959_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
