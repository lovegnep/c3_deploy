

x560205_var_FileId = 560205
x560205_var_QuestName="战车道具银币商店"
x560205_var_ShopList={205}






function x560205_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560205_var_ShopList[1] )
end









function x560205_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560205_var_FileId, x560205_var_QuestName,10)
end









function x560205_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560205_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560205_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560205_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560205_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560205_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560205_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560205_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
