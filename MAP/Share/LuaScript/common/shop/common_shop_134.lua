

x560134_var_FileId = 560134
x560134_var_QuestName="药品制造配方商店"
x560134_var_ShopList={134}






function x560134_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560134_var_ShopList[1] )
end









function x560134_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560134_var_FileId, x560134_var_QuestName,10)
end









function x560134_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560134_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560134_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560134_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560134_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560134_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560134_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560134_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
