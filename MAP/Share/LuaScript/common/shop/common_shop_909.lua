

x560909_var_FileId = 560909
x560909_var_QuestName="“¯∆±…ÃµÍ"
x560909_var_ShopList={909}






function x560909_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560909_var_ShopList[1] )
end









function x560909_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560909_var_FileId, x560909_var_QuestName,10)
end









function x560909_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560909_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560909_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560909_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560909_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560909_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560909_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560909_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
