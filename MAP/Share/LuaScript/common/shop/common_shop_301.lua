

x560301_var_FileId = 560301
x560301_var_QuestName="´ó¶¼·À¾ßµê"
x560301_var_ShopList={301}






function x560301_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560301_var_ShopList[1] )
end









function x560301_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560301_var_FileId, x560301_var_QuestName,10)
end









function x560301_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560301_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560301_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560301_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560301_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560301_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560301_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560301_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
