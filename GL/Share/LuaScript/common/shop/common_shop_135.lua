

x560135_var_FileId = 560135
x560135_var_QuestName="»Ÿ”˛“©∆∑≈‰∑ΩµÍ"
x560135_var_ShopList={135}






function x560135_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560135_var_ShopList[1] )
end









function x560135_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560135_var_FileId, x560135_var_QuestName,10)
end









function x560135_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560135_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560135_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560135_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560135_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560135_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560135_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560135_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
