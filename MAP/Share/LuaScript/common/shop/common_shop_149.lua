

x560149_var_FileId = 560149
x560149_var_QuestName="声望工艺配方店"
x560149_var_ShopList={149}






function x560149_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560149_var_ShopList[1] )
end









function x560149_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	



		TalkAppendButton(varMap, x560149_var_FileId, x560149_var_QuestName,10)



	
end









function x560149_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560149_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560149_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560149_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560149_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560149_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560149_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560149_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
