

x560148_var_FileId = 560148
x560148_var_QuestName="ÉùÍûÖý¼×Åä·½µê"
x560148_var_ShopList={148}






function x560148_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560148_var_ShopList[1] )
end









function x560148_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	



		TalkAppendButton(varMap, x560148_var_FileId, x560148_var_QuestName,10)



	
end









function x560148_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560148_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560148_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560148_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560148_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560148_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560148_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560148_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
