

x560936_var_FileId = 560936
x560936_var_QuestName="‘¬±˝œ⁄¡œ…ÃµÍ"
x560936_var_ShopList={1270}






function x560936_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560936_var_ShopList[1] )
end









function x560936_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560936_var_FileId, x560936_var_QuestName,10)
end









function x560936_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560936_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560936_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560936_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560936_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560936_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560936_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560936_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
