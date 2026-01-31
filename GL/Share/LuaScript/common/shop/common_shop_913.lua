

x560913_var_FileId = 560913
x560913_var_QuestName="ÎäÒÄ²è×¯"
x560913_var_ShopList={913}






function x560913_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560913_var_ShopList[1] )
end









function x560913_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560913_var_FileId, x560913_var_QuestName,10)

end









function x560913_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560913_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560913_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560913_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560913_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560913_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560913_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560913_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
