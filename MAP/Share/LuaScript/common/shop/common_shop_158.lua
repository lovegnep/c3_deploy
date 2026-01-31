

x560158_var_FileId = 560158
x560158_var_QuestName="ËÄ¼¶°ï¹±ÉÌµê"
x560158_var_ShopList={158}






function x560158_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560158_var_ShopList[1] )
end









function x560158_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560158_var_FileId, x560158_var_QuestName,10)
end









function x560158_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560158_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560158_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560158_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560158_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560158_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560158_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560158_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
