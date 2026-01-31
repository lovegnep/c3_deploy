

x560146_var_FileId = 560146
x560146_var_QuestName="∆Ô≥Àµ¿æﬂ…ÃµÍ"
x560146_var_ShopList={146}






function x560146_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560146_var_ShopList[1] )
end









function x560146_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560146_var_FileId, x560146_var_QuestName,10)
end









function x560146_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560146_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560146_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560146_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560146_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560146_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560146_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560146_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
