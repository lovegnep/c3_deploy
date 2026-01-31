

x560168_var_FileId = 560168
x560168_var_QuestName="∆ﬂº∂∞Ôπ±…ÃµÍ"
x560168_var_ShopList={168}






function x560168_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560168_var_ShopList[1] )
end









function x560168_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560168_var_FileId, x560168_var_QuestName,10)
end









function x560168_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560168_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560168_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560168_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560168_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560168_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560168_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560168_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
