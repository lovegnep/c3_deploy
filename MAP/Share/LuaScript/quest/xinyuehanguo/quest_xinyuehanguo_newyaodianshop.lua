


x211041_var_FileId = 211041
x211041_var_QuestName="“©∆∑…ÃµÍ"
x211041_var_ShopList={16}






function x211041_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x211041_var_ShopList[1] )
end









function x211041_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211041_var_FileId, x211041_var_QuestName)
end









function x211041_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211041_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211041_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211041_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211041_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211041_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211041_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211041_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
