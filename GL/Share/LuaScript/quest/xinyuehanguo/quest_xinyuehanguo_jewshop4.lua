


x211063_var_FileId = 211063
x211063_var_QuestName="±¦Ê¯ÉÌµêÈý"
x211063_var_ShopList={13}






function x211063_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x211063_var_ShopList[1] )
end









function x211063_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211063_var_FileId, x211063_var_QuestName)
end









function x211063_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211063_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211063_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211063_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211063_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211063_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211063_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211063_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
