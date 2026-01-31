

x560105_var_FileId = 560105
x560105_var_QuestName="ÐÂÊÖ·À¾ßµê"
x560105_var_ShopList={105}






function x560105_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560105_var_ShopList[1] )
end









function x560105_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560105_var_FileId, x560105_var_QuestName,10)
end









function x560105_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560105_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560105_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560105_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560105_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560105_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560105_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560105_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
