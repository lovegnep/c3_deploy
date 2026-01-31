

x560316_var_FileId = 560316
x560316_var_QuestName="声望锻造配方商店"
x560316_var_ShopList={316}






function x560316_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560316_var_ShopList[1] )
end









function x560316_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	



		TalkAppendButton(varMap, x560316_var_FileId, x560316_var_QuestName,10)



	
end









function x560316_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560316_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560316_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560316_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560316_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560316_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560316_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560316_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
