

x560153_var_FileId = 560153
x560153_var_QuestName="Õªÿ ∂Õ‘Ï≈‰∑ΩµÍ"
x560153_var_ShopList={153}






function x560153_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560153_var_ShopList[1] )
end









function x560153_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	



		TalkAppendButton(varMap, x560153_var_FileId, x560153_var_QuestName,10)



	
end









function x560153_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560153_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560153_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560153_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560153_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560153_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560153_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560153_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
