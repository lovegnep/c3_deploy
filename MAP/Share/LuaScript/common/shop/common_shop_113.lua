

x560113_var_FileId = 560113
x560113_var_QuestName="√…π≈—±¬Ì≈‰∑ΩµÍ"
x560113_var_ShopList={113}






function x560113_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560113_var_ShopList[1] )
end









function x560113_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560113_var_FileId, x560113_var_QuestName,10)
end









function x560113_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560113_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560113_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560113_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560113_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560113_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560113_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560113_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
