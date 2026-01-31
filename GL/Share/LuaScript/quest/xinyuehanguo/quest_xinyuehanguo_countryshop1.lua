


--DECLARE_QUEST_INFO_START--
x211036_var_FileId = 211036

x211036_var_QuestName = "国家发展商店"
x211036_var_ShopList = {1}
--DECLARE_QUEST_INFO_STOP--






function x211036_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y国家发展商店")
		TalkAppendString(varMap, "为了鼓励大家多为国家做贡献，国王让我去采购了很多好东西以奖励给对国有功之人。现在物品还没有采购完，一旦对外开放我会及时通知大家前来，按功分配！现在你还是先去多积累些功劳才是！\n我这里只奖励对#g国家建设#w的有功之人。对国防有功的人应该去找对面的中军将军。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
end









function x211036_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x211036_var_FileId, x211036_var_QuestName)
end









function x211036_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end









function x211036_ProcAccept(varMap, varPlayer)
    
end









function x211036_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211036_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211036_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211036_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211036_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211036_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
