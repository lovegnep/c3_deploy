

x560154_var_FileId = 560154
x560154_var_QuestName="ª§…Ì∑˚…ÃµÍ"
x560154_var_ShopList={154}






function x560154_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560154_var_ShopList[1] )
end









function x560154_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	



		TalkAppendButton(varMap, x560154_var_FileId, x560154_var_QuestName,10)



	
end









function x560154_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560154_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560154_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560154_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560154_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560154_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560154_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560154_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
