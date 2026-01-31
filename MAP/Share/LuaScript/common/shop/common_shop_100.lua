

x560100_var_FileId = 560100
x560100_var_QuestName="–¬ ÷Œ‰∆˜µÍ"
x560100_var_ShopList={100}






function x560100_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560100_var_ShopList[1] )
end









function x560100_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560100_var_FileId, x560100_var_QuestName,10)
end









function x560100_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560100_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560100_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560100_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560100_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560100_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560100_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560100_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
