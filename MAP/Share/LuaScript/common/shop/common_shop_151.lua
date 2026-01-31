

x560151_var_FileId = 560151
x560151_var_QuestName="ÂÞÂíÖý¼×Åä·½µê"
x560151_var_ShopList={151}






function x560151_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560151_var_ShopList[1] )
end









function x560151_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	
                TalkAppendButton(varMap, x560151_var_FileId, x560151_var_QuestName,10)







	
end









function x560151_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560151_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560151_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560151_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560151_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560151_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560151_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560151_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
