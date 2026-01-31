

x560120_var_FileId = 560120
x560120_var_QuestName="≥ıº∂±¶ Ø…ÃµÍ"
x560120_var_ShopList={120}






function x560120_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560120_var_ShopList[1] )
end









function x560120_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560120_var_FileId, x560120_var_QuestName,10)
end









function x560120_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560120_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560120_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560120_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560120_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560120_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560120_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560120_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
