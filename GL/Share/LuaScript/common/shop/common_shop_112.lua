

x560112_var_FileId = 560112
x560112_var_QuestName="…˘Õ˚—±¬Ì≈‰∑ΩµÍ"
x560112_var_ShopList={112}






function x560112_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560112_var_ShopList[1] )
end









function x560112_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560112_var_FileId, x560112_var_QuestName,10)
end









function x560112_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560112_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560112_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560112_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560112_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560112_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560112_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560112_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
