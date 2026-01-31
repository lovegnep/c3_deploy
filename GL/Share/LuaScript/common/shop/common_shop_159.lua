

x560159_var_FileId = 560159
x560159_var_QuestName="ŒÂº∂∞Ôπ±…ÃµÍ"
x560159_var_ShopList={159}






function x560159_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560159_var_ShopList[1] )
end









function x560159_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560159_var_FileId, x560159_var_QuestName,10)
end









function x560159_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560159_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560159_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560159_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560159_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560159_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560159_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560159_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
