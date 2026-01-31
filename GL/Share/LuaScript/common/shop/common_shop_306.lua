

x560306_var_FileId = 560306
x560306_var_QuestName="±¶ Ø…ÃµÍ"
x560306_var_ShopList={306}






function x560306_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560306_var_ShopList[1] )
end









function x560306_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560306_var_FileId, x560306_var_QuestName,10)
end









function x560306_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560306_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560306_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560306_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560306_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560306_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560306_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560306_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
