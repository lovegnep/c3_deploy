


x211020_var_FileId = 211020
x211020_var_QuestName="∑¿æﬂ…ÃµÍ"
x211020_var_ShopList={4}






function x211020_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x211020_var_ShopList[1] )
end









function x211020_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211020_var_FileId, x211020_var_QuestName)
end









function x211020_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211020_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211020_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211020_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211020_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211020_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211020_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211020_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
