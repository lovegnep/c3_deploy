

x560204_var_FileId = 560204
x560204_var_QuestName="战车道具金币商店"
x560204_var_ShopList={204}






function x560204_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560204_var_ShopList[1] )
end









function x560204_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560204_var_FileId, x560204_var_QuestName,10)
end









function x560204_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560204_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560204_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560204_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560204_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560204_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560204_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560204_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
