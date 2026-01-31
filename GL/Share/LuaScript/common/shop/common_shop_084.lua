

x560084_var_FileId = 560084
x560084_var_QuestName="Áú»÷ÅÚ×é¼þÉÌµê"
x560084_var_ShopList={84}






function x560084_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560084_var_ShopList[1] )
end









function x560084_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560084_var_FileId, x560084_var_QuestName,10)
end









function x560084_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560084_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560084_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560084_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560084_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560084_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560084_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560084_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
