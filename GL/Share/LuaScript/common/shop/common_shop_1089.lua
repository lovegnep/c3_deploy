

x561089_var_FileId = 561089
x561089_var_QuestName="’Ω≥µ¥∏…ÃµÍ"
x561089_var_ShopList={1089}






function x561089_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561089_var_ShopList[1] )
end









function x561089_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x561089_var_FileId, x561089_var_QuestName,10)
end









function x561089_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561089_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561089_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561089_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561089_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561089_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561089_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561089_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
