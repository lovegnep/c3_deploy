

x560157_var_FileId = 560157
x560157_var_QuestName="Èý¼¶°ï¹±ÉÌµê"
x560157_var_ShopList={157}






function x560157_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560157_var_ShopList[1] )
end









function x560157_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560157_var_FileId, x560157_var_QuestName,10)
end









function x560157_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560157_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560157_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560157_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560157_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560157_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560157_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560157_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
