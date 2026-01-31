

x560906_var_FileId = 560906
x560906_var_QuestName="‘”ªı…ÃµÍ"
x560906_var_ShopList={906}






function x560906_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560906_var_ShopList[1] )
end









function x560906_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560906_var_FileId, x560906_var_QuestName,10)
end









function x560906_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560906_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560906_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560906_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560906_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560906_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560906_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560906_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
