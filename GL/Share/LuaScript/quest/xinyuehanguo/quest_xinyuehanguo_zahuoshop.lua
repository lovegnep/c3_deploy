


x211018_var_FileId = 211018
x211018_var_QuestName="‘”ªı…ÃµÍ"
x211018_var_ShopList={2}






function x211018_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x211018_var_ShopList[1] )
end









function x211018_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211018_var_FileId, x211018_var_QuestName)
end









function x211018_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211018_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211018_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211018_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211018_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211018_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211018_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211018_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
