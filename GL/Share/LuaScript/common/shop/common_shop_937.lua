

x560937_var_FileId = 560937
x560937_var_QuestName="ÔÂ±ýÃæ·ÛÉÌµê"
x560937_var_ShopList={937}






function x560937_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560937_var_ShopList[1] )
end









function x560937_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560937_var_FileId, x560937_var_QuestName,10)

end









function x560937_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560937_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560937_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560937_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560937_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560937_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560937_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560937_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
