

x560304_var_FileId = 560304
x560304_var_QuestName="±³°üÉÌµê"
x560304_var_ShopList={304}






function x560304_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560304_var_ShopList[1] )
end









function x560304_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560304_var_FileId, x560304_var_QuestName,10)
end









function x560304_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560304_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560304_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560304_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560304_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560304_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560304_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560304_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
