

x560309_var_FileId = 560309
x560309_var_QuestName="ÂíµÀ¾ßµê"
x560309_var_ShopList={309}






function x560309_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560309_var_ShopList[1] )
end









function x560309_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560309_var_FileId, x560309_var_QuestName,10)
end









function x560309_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560309_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560309_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560309_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560309_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560309_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560309_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560309_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
