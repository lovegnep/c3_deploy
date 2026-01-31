


--DECLARE_QUEST_INFO_START--
x211037_var_FileId = 211037

x211037_var_QuestName = "国家国防商店"
x211037_var_ShopList = {1}
--DECLARE_QUEST_INFO_STOP--






function x211037_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y国家国防商店")
		TalkAppendString(varMap, "国家兴亡，匹夫有责。凡是对国防事业有功之人，国家都会体恤他们的。现在正有一匹物资，正在运送来的路上，一到王城，我就通知大家前来领取。\n我这里只奖励对#g国防事业#w的有功之人。对国家发展建设有功的人应该去找对面的大司马。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
end









function x211037_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x211037_var_FileId, x211037_var_QuestName)
end









function x211037_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end









function x211037_ProcAccept(varMap, varPlayer)
    
end









function x211037_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211037_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211037_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211037_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211037_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211037_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
