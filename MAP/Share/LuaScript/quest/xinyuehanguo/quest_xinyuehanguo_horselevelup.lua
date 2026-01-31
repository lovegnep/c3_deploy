


--DECLARE_QUEST_INFO_START--
x211027_var_FileId = 211027

x211027_var_QuestName = "骑乘繁殖"
--DECLARE_QUEST_INFO_STOP--






function x211027_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y骑乘繁殖")
		TalkAppendString(varMap, "良种马难得啊，当有了一匹好马，谁不希望可以用得更久呢。经过繁殖获得的新马驹，那是赤兔中的赤兔，吕布中的吕布啊！")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211027_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x211027_var_FileId, x211027_var_QuestName)
end









function x211027_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end









function x211027_ProcAccept(varMap, varPlayer)
    
end









function x211027_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211027_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211027_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211027_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211027_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211027_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
