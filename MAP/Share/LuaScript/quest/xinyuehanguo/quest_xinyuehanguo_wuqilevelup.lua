


--DECLARE_QUEST_INFO_START--
x211026_var_FileId = 211026

x211026_var_QuestName = "强化材料商店"

x211026_var_ShopList ={6}
--DECLARE_QUEST_INFO_STOP--






function x211026_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x211026_var_ShopList[1] )
end









function x211026_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x211026_var_FileId, x211026_var_QuestName)
end









function x211026_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end









function x211026_ProcAccept(varMap, varPlayer)
    
end









function x211026_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211026_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211026_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211026_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211026_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211026_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
