

x560303_var_FileId = 560303
x560303_var_QuestName="Ò©Æ·µê"
x560303_var_ShopList={303}






function x560303_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560303_var_ShopList[1] )
end









function x560303_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560303_var_FileId, x560303_var_QuestName,10)
end









function x560303_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560303_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560303_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560303_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560303_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560303_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560303_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560303_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
