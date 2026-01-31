

x560314_var_FileId = 560314
x560314_var_QuestName="ÂÞÂíÖý¼×Åä·½µê"
x560314_var_ShopList={314}






function x560314_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560314_var_ShopList[1] )
end









function x560314_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	



		TalkAppendButton(varMap, x560314_var_FileId, x560314_var_QuestName,10)



	
end









function x560314_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560314_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560314_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560314_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560314_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560314_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560314_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560314_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
