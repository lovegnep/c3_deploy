

x560111_var_FileId = 560111
x560111_var_QuestName="…˘Õ˚“©∆∑≈‰∑ΩµÍ"
x560111_var_ShopList={111}






function x560111_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560111_var_ShopList[1] )
end









function x560111_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560111_var_FileId, x560111_var_QuestName,10)
end









function x560111_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560111_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560111_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560111_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560111_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560111_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560111_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560111_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
