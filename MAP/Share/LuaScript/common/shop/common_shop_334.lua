

x560334_var_FileId = 560334
x560334_var_QuestName="高阶转职道具商店"
x560334_var_ShopList={334}






function x560334_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560334_var_ShopList[1] )
end









function x560334_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560334_var_FileId, x560334_var_QuestName,10)
		
end









function x560334_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560334_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560334_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560334_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560334_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560334_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560334_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560334_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
