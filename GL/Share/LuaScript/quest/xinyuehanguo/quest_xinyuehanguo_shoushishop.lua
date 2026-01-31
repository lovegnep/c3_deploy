


x211021_var_FileId = 211021
x211021_var_QuestName=" ◊ Œ…ÃµÍ"
x211021_var_ShopList={5}






function x211021_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x211021_var_ShopList[1] )
end









function x211021_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211021_var_FileId, x211021_var_QuestName)
end









function x211021_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211021_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211021_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211021_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211021_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211021_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211021_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211021_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
