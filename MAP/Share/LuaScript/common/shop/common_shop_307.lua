

x560307_var_FileId = 560307
x560307_var_QuestName="装备强化店"
x560307_var_ShopList={307}






function x560307_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560307_var_ShopList[1] )
end









function x560307_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560307_var_FileId, x560307_var_QuestName,10)
end









function x560307_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560307_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560307_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560307_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560307_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560307_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560307_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560307_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
