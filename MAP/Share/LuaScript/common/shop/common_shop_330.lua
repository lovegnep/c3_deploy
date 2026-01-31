

x560330_var_FileId = 560330
x560330_var_QuestName="天上人间金币店"
x560330_var_ShopList={330}






function x560330_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560330_var_ShopList[1] )
end









function x560330_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560330_var_FileId, x560330_var_QuestName,10)
end









function x560330_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560330_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560330_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560330_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560330_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560330_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560330_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560330_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
