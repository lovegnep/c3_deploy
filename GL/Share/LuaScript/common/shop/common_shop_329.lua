

x560329_var_FileId = 560329
x560329_var_QuestName="½ð²ùµê"
x560329_var_ShopList={329}






function x560329_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560329_var_ShopList[1] )
end









function x560329_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560329_var_FileId, x560329_var_QuestName,10)
end









function x560329_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560329_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560329_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560329_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560329_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560329_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560329_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560329_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
