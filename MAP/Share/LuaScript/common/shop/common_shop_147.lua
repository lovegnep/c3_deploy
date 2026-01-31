

x560147_var_FileId = 560147
x560147_var_QuestName="…˘Õ˚∂Õ‘Ï≈‰∑ΩµÍ"
x560147_var_ShopList={147}






function x560147_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560147_var_ShopList[1] )
end









function x560147_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	



		TalkAppendButton(varMap, x560147_var_FileId, x560147_var_QuestName,10)



	
end









function x560147_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560147_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560147_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560147_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560147_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560147_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560147_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560147_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
