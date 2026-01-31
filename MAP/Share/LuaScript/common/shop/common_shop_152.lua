

x560152_var_FileId = 560152
x560152_var_QuestName="波斯工艺配方店"
x560152_var_ShopList={152}






function x560152_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560152_var_ShopList[1] )
end









function x560152_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	



		TalkAppendButton(varMap, x560152_var_FileId, x560152_var_QuestName,10)



	
end









function x560152_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560152_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560152_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560152_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560152_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560152_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560152_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560152_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
