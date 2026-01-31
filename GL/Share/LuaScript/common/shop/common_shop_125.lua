

x560125_var_FileId = 560125
x560125_var_QuestName="ÉùÍû±¦Ê¯Åä·½µê"
x560125_var_ShopList={125}






function x560125_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560125_var_ShopList[1] )
end









function x560125_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560125_var_FileId, x560125_var_QuestName,10)
end









function x560125_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560125_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560125_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560125_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560125_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560125_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560125_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560125_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
