

x560130_var_FileId = 560130
x560130_var_QuestName="ÈÙÓþ±¦Ê¯"
x560130_var_ShopList={130}






function x560130_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560130_var_ShopList[1] )
end









function x560130_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560130_var_FileId, x560130_var_QuestName,10)
end









function x560130_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560130_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560130_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560130_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560130_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560130_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560130_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560130_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
