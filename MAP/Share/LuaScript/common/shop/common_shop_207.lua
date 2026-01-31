

x560207_var_FileId = 560207
x560207_var_QuestName="战车宝石加工金币商店"
x560207_var_ShopList={207}






function x560207_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560207_var_ShopList[1] )
end









function x560207_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560207_var_FileId, x560207_var_QuestName,10)
end









function x560207_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560207_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560207_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560207_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560207_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560207_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560207_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560207_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
