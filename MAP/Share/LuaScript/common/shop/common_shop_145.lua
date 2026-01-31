

x560145_var_FileId = 560145
x560145_var_QuestName="∆Ô≥Àººƒ‹…ÃµÍ"
x560145_var_ShopList={145}






function x560145_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560145_var_ShopList[1] )
end









function x560145_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560145_var_FileId, x560145_var_QuestName,10)
end









function x560145_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560145_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560145_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560145_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560145_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560145_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560145_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560145_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
