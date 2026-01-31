


x211019_var_FileId = 211019
x211019_var_QuestName="Œ‰∆˜…ÃµÍ"
x211019_var_ShopList={3}






function x211019_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x211019_var_ShopList[1] )
end









function x211019_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211019_var_FileId, x211019_var_QuestName)
end









function x211019_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211019_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211019_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211019_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211019_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211019_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211019_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211019_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
