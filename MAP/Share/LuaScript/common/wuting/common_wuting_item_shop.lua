

x300164_var_FileId = 300164
x300164_var_QuestName="°æ√¿¿ˆª·°ø…ÃµÍ"
x300164_var_ShopList={903}






function x300164_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x300164_var_ShopList[1] )
end









function x300164_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x300164_var_FileId, x300164_var_QuestName,10)
end









function x300164_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x300164_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x300164_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x300164_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x300164_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x300164_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x300164_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x300164_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
