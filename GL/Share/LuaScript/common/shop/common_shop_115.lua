

x560115_var_FileId = 560115
x560115_var_QuestName="±³°üÉÌµê"
x560115_var_ShopList={115}






function x560115_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560115_var_ShopList[1] )
end









function x560115_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560115_var_FileId, x560115_var_QuestName,10)
end









function x560115_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560115_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560115_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560115_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560115_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560115_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560115_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560115_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
