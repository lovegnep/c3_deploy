

x560914_var_FileId = 560914
x560914_var_QuestName="’‰±¶…ÃµÍ"
x560914_var_ShopList={914}






function x560914_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560914_var_ShopList[1] )
end









function x560914_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560914_var_FileId, x560914_var_QuestName,10)

end









function x560914_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560914_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560914_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560914_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560914_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560914_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560914_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560914_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
