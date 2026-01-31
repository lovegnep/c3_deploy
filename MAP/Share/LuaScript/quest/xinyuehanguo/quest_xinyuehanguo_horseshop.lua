


--DECLARE_QUEST_INFO_START--
x211025_var_FileId = 211025

x211025_var_QuestName = "∆Ô≥À…ÃµÍ"
--DECLARE_QUEST_INFO_STOP--






function x211025_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, 950 )
end









function x211025_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x211025_var_FileId, x211025_var_QuestName)
end









function x211025_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end









function x211025_ProcAccept(varMap, varPlayer)
    
end









function x211025_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211025_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211025_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211025_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211025_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211025_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
