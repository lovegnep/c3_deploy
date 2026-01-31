

x560933_var_FileId = 560933
x560933_var_QuestName="’Ω≥µ¥∏…ÃµÍ"
x560933_var_ShopList={933}






function x560933_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560933_var_ShopList[1] )
end









function x560933_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560933_var_FileId, x560933_var_QuestName,10)
end









function x560933_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560933_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560933_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560933_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560933_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560933_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560933_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560933_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
