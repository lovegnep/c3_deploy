

x560155_var_FileId = 560155
x560155_var_QuestName="“ªº∂∞Ôπ±…ÃµÍ"
x560155_var_ShopList={155}






function x560155_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560155_var_ShopList[1] )
end









function x560155_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560155_var_FileId, x560155_var_QuestName,10)
end









function x560155_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560155_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560155_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560155_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560155_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560155_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560155_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560155_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
