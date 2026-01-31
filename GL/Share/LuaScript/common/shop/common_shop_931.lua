

x560931_var_FileId = 560931
x560931_var_QuestName="重击器组件商店"
x560931_var_ShopList={931}






function x560931_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560931_var_ShopList[1] )
end









function x560931_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560931_var_FileId, x560931_var_QuestName,10)
end









function x560931_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560931_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560931_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560931_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560931_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560931_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560931_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560931_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
