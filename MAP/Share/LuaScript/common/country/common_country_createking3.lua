

--DECLARE_QUEST_INFO_START--
x300309_var_FileId = 300309
x300309_var_QuestId = 4100
x300309_var_Name	="祖兰德" 
x300309_var_QuestName="弹劾国王 -（全民参与）"








function x300309_ProcEventEntry(varMap, varPlayer, varTalknpc)	
		StartTalkTask(varMap);TalkAppendString(varMap,"#Y".."你是否确认要弹劾国王？");StopTalkTask();DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300309_var_FileId, x300309_var_QuestId);
end









function x300309_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x300309_var_FileId, x300309_var_QuestName)	
end









function x300309_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	CountryDeletaBegin( varMap, varPlayer );
	CountryVoteBegin(varMap, varPlayer);
	
return 1
end








function x300309_CheckPushList(varMap, varPlayer, varTalknpc)






	
end







function x300309_ProcAccept(varMap, varPlayer)
	  StartTalkTask(varMap);TalkAppendString(varMap,"弹劾完成");StopTalkTask();DeliverTalkTips(varMap, varPlayer);   
end









function x300309_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x300309_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x300309_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x300309_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x300309_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
		TalkAppendButton(varMap, x300309_var_FileId, "弹劾国王")
end









function x300309_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end

