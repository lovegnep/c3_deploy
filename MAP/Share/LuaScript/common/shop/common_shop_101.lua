

x560101_var_FileId = 560101
x560101_var_QuestName="–¬ ÷…ÃµÍ"
x560101_var_ShopList={101}






function x560101_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560101_var_ShopList[1] )
end









function x560101_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560101_var_FileId, x560101_var_QuestName,10)
end









function x560101_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560101_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560101_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560101_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560101_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560101_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560101_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560101_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
