

x560114_var_FileId = 560114
x560114_var_QuestName="√…π≈—±¬Ì≈‰∑ΩµÍ"
x560114_var_ShopList={114}






function x560114_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560114_var_ShopList[1] )
end









function x560114_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560114_var_FileId, x560114_var_QuestName,10)
end









function x560114_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560114_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560114_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560114_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560114_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560114_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560114_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560114_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
