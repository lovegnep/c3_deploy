

x560039_var_FileId = 560039
x560039_var_QuestName="’Ω≥µ¥∏…ÃµÍ"
x560039_var_ShopList={39}






function x560039_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560039_var_ShopList[1] )
end









function x560039_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560039_var_FileId, x560039_var_QuestName,10)
end









function x560039_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560039_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560039_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560039_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560039_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560039_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560039_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560039_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
