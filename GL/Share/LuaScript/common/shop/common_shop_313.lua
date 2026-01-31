

x560313_var_FileId = 560313
x560313_var_QuestName="Õªÿ ∂Õ‘Ï≈‰∑ΩµÍ"
x560313_var_ShopList={313}






function x560313_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560313_var_ShopList[1] )
end









function x560313_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	



		TalkAppendButton(varMap, x560313_var_FileId, x560313_var_QuestName,10)



	
end









function x560313_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560313_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560313_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560313_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560313_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560313_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560313_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560313_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
