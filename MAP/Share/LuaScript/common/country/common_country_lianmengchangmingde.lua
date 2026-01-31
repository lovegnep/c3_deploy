x310006_var_FileId 		= 310006
x310006_var_QuestKind 	= 	1                       
x310006_var_QuestName	= "探寻状况"




function x310006_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	local varQuest = LuaCallNoclosure(310004, "ReturnHaveQuestID", varMap, varPlayer, 2)

	if varQuest ~= -1 then
		local MissionMap =LuaCallNoclosure(310004, "GetMissionMapId", varMap, varPlayer, varQuest)  
		if MissionMap == -1 or varMap ~= MissionMap then
			return
		end
		if GetQuestParam(varMap, varPlayer, GetQuestIndexByID(varMap, varPlayer, varQuest), 7) == 1 then
			return
		end
		TalkAppendButton(varMap, x310006_var_FileId, x310006_var_QuestName, 3, varQuest)
	end
end




function x310006_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )

	if IsHaveQuestNM(varMap, varPlayer, idExt) > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, idExt)
		SetQuestByIndex(varMap, varPlayer, varQuestIdx, 7, 1)
       
		StartTalkTask(varMap)
       	TalkAppendString(varMap, "此事不可明言，不过我可以保证我们的主将绝不是针对贵国的。")
   	 	StopTalkTask()
   		DeliverTalkInfo(varMap, varPlayer, varTalknpc, -1, -1)  
	end
end

function x310006_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end




function x310006_ProcAccept( varMap, varPlayer )
end




function x310006_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x310006_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310006_CheckSubmit( varMap, varPlayer )

end




function x310006_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310006_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310006_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310006_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
