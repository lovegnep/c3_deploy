

x560133_var_FileId = 560133
x560133_var_QuestName="珠宝加工配方商店"
x560133_var_ShopList={133}






function x560133_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560133_var_ShopList[1] )
end









function x560133_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560133_var_FileId, x560133_var_QuestName,10)
end









function x560133_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560133_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560133_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560133_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560133_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560133_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560133_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560133_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
