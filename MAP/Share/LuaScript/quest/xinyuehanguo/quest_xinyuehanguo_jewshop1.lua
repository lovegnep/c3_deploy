


x211058_var_FileId = 211058
x211058_var_QuestName="±¶ Ø…ÃµÍ“ª"
x211058_var_ShopList={8}






function x211058_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x211058_var_ShopList[1] )
end









function x211058_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211058_var_FileId, x211058_var_QuestName)
end









function x211058_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211058_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211058_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211058_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211058_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211058_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211058_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211058_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
