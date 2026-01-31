

x560206_var_FileId = 560206
x560206_var_QuestName="’Ω≥µ»Ÿ”˛…ÃµÍ"
x560206_var_ShopList={206}






function x560206_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560206_var_ShopList[1] )
end









function x560206_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560206_var_FileId, x560206_var_QuestName,10)
end









function x560206_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560206_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560206_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560206_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560206_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560206_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560206_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560206_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
