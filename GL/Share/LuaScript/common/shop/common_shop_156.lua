

x560156_var_FileId = 560156
x560156_var_QuestName="¶þ¼¶°ï¹±ÉÌµê"
x560156_var_ShopList={156}






function x560156_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560156_var_ShopList[1] )
end









function x560156_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560156_var_FileId, x560156_var_QuestName,10)
end









function x560156_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560156_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560156_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560156_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560156_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560156_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560156_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560156_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
