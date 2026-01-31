

x560038_var_FileId = 560038
x560038_var_QuestName="御行甲组件商店"
x560038_var_ShopList={38}






function x560038_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560038_var_ShopList[1] )
end









function x560038_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560038_var_FileId, x560038_var_QuestName,10)
end









function x560038_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560038_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560038_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560038_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560038_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560038_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560038_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560038_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
