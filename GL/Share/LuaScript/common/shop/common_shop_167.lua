

x560167_var_FileId = 560167
x560167_var_QuestName="Áù¼¶°ï¹±ÉÌµê"
x560167_var_ShopList={167}






function x560167_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560167_var_ShopList[1] )
end









function x560167_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560167_var_FileId, x560167_var_QuestName,10)
end









function x560167_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560167_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560167_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560167_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560167_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560167_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560167_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560167_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
