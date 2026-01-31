x310005_var_FileId 		= 310005
x310005_var_QuestKind 	= 	1                       
x310005_var_QuestName	= "告知情况"




function x310005_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	local varQuest = LuaCallNoclosure(310004, "ReturnHaveQuestID", varMap, varPlayer, 1)

	if varQuest ~= -1 then
		local MissionMap =LuaCallNoclosure(310004, "GetMissionMapId", varMap, varPlayer, varQuest)  
		if MissionMap == -1 or varMap ~= MissionMap then
			return
		end
		if GetQuestParam(varMap, varPlayer, GetQuestIndexByID(varMap, varPlayer, varQuest), 7) == 1 then
			return
		end
		TalkAppendButton(varMap, x310005_var_FileId, x310005_var_QuestName, 1, varQuest)
	end
end




function x310005_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )

	if IsHaveQuestNM(varMap, varPlayer, idExt) > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, idExt)
		SetQuestByIndex(varMap, varPlayer, varQuestIdx, 7, 1)
       
		StartTalkTask(varMap)
       	TalkAppendString(varMap, "感谢您带来的消息，我会尽快带着我的父亲远离此地。")
   	 	StopTalkTask()
   		DeliverTalkInfo(varMap, varPlayer, varTalknpc, -1, -1)  
	end
end

function x310005_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end




function x310005_ProcAccept( varMap, varPlayer )
end




function x310005_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x310005_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310005_CheckSubmit( varMap, varPlayer )

end




function x310005_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310005_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310005_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310005_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
