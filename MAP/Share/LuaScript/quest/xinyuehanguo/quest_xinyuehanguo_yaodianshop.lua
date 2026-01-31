


x211024_var_FileId = 211024
x211024_var_QuestName="“©∆∑…ÃµÍ"
x211024_var_ShopList={101}






function x211024_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x211024_var_ShopList[1] )
end









function x211024_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211024_var_FileId, x211024_var_QuestName, 10)
end









function x211024_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211024_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211024_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211024_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211024_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211024_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211024_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211024_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
