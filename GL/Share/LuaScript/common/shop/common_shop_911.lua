

x560911_var_FileId = 560911
x560911_var_QuestName="∆Î√Ó ÷“©Ã√"
x560911_var_ShopList={911}






function x560911_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560911_var_ShopList[1] )
end









function x560911_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560911_var_FileId, x560911_var_QuestName,10)

end









function x560911_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560911_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560911_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560911_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560911_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560911_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560911_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560911_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
