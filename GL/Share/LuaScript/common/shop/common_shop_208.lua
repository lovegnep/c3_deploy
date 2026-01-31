

x560208_var_FileId = 560208
x560208_var_QuestName="战车宝石金币商店"
x560208_var_ShopList={208}






function x560208_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560208_var_ShopList[1] )
end









function x560208_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560208_var_FileId, x560208_var_QuestName,10)
end









function x560208_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560208_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560208_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560208_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560208_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560208_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560208_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560208_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
