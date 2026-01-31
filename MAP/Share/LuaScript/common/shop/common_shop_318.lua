

x560318_var_FileId = 560318
x560318_var_QuestName="声望工艺配方商店"
x560318_var_ShopList={318}






function x560318_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560318_var_ShopList[1] )
end









function x560318_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	



		TalkAppendButton(varMap, x560318_var_FileId, x560318_var_QuestName,10)



	
end









function x560318_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560318_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560318_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560318_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560318_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560318_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560318_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560318_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
