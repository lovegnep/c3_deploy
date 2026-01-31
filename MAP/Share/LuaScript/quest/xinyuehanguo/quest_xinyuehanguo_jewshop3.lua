


x211060_var_FileId = 211060
x211060_var_QuestName="²ÄÁÏÉÌµê¶þ"
x211060_var_ShopList={10}






function x211060_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x211060_var_ShopList[1] )
end









function x211060_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211060_var_FileId, x211060_var_QuestName)
end









function x211060_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211060_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211060_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211060_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211060_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211060_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211060_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211060_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
