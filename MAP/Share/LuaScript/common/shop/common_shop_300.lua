

x560300_var_FileId = 560300
x560300_var_QuestName="´ó¶¼ÎäÆ÷µê"
x560300_var_ShopList={300}






function x560300_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560300_var_ShopList[1] )
end









function x560300_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560300_var_FileId, x560300_var_QuestName,10)
end









function x560300_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560300_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560300_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560300_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560300_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560300_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560300_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560300_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
