

x560140_var_FileId = 560140
x560140_var_QuestName="装备材料商店"
x560140_var_ShopList={140}






function x560140_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560140_var_ShopList[1] )
end









function x560140_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560140_var_FileId, x560140_var_QuestName,10)
end









function x560140_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560140_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560140_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560140_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560140_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560140_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560140_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560140_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
