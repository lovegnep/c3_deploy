

x560315_var_FileId = 560315
x560315_var_QuestName="波斯工艺配方店"
x560315_var_ShopList={315}






function x560315_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560315_var_ShopList[1] )
end









function x560315_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	



		TalkAppendButton(varMap, x560315_var_FileId, x560315_var_QuestName,10)



	
end









function x560315_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560315_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560315_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560315_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560315_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560315_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560315_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560315_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
