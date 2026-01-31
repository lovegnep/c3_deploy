


x211062_var_FileId = 211062
x211062_var_QuestName="Æï³ËÉÌµê¶þ"
x211062_var_ShopList={12}






function x211062_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x211062_var_ShopList[1] )
end









function x211062_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211062_var_FileId, x211062_var_QuestName)
end









function x211062_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211062_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211062_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211062_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211062_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211062_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211062_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211062_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
