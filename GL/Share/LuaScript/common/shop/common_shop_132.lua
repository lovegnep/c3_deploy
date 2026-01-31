

x560132_var_FileId = 560132
x560132_var_QuestName="药品制造配方商店"
x560132_var_ShopList={132}






function x560132_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560132_var_ShopList[1] )
end









function x560132_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560132_var_FileId, x560132_var_QuestName,10)
end









function x560132_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560132_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560132_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560132_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560132_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560132_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560132_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560132_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
