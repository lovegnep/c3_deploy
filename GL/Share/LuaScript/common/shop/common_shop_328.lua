

x560328_var_FileId = 560328
x560328_var_QuestName="Ìú²ùµê"
x560328_var_ShopList={328}






function x560328_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560328_var_ShopList[1] )
end









function x560328_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560328_var_FileId, x560328_var_QuestName,10)
end









function x560328_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560328_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560328_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560328_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560328_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560328_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560328_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560328_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
