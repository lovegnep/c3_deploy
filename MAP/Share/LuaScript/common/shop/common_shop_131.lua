

x560131_var_FileId = 560131
x560131_var_QuestName="珠宝加工配方商店"
x560131_var_ShopList={131}






function x560131_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560131_var_ShopList[1] )
end









function x560131_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560131_var_FileId, x560131_var_QuestName,10)
end









function x560131_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560131_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560131_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560131_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560131_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560131_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560131_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560131_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
