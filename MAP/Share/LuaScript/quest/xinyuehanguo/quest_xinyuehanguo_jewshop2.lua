


x211059_var_FileId = 211059
x211059_var_QuestName="±¦Ê¯ÉÌµê¶þ"
x211059_var_ShopList={9}






function x211059_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x211059_var_ShopList[1] )
end









function x211059_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211059_var_FileId, x211059_var_QuestName)
end









function x211059_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211059_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211059_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211059_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211059_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211059_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211059_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211059_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
