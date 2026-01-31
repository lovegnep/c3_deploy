

x560136_var_FileId = 560136
x560136_var_QuestName="ª’’¬…ÃµÍ"
x560136_var_ShopList={136}






function x560136_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560136_var_ShopList[1] )
end









function x560136_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560136_var_FileId, x560136_var_QuestName,10)
end









function x560136_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560136_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560136_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560136_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560136_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560136_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560136_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560136_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
