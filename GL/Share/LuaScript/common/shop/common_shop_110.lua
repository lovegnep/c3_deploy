

x560110_var_FileId = 560110
x560110_var_QuestName="–¬ ÷“©∆∑"
x560110_var_ShopList={110}






function x560110_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560110_var_ShopList[1] )
end









function x560110_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560110_var_FileId, x560110_var_QuestName,10)
end









function x560110_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560110_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560110_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560110_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560110_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560110_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560110_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560110_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
