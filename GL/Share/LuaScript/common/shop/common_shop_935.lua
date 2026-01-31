

x560935_var_FileId = 560935
x560935_var_QuestName="时装纹样商店"
x560935_var_ShopList={1267}






function x560935_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560935_var_ShopList[1] )
end









function x560935_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560935_var_FileId, x560935_var_QuestName,10)
end









function x560935_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560935_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560935_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560935_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560935_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560935_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560935_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560935_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
