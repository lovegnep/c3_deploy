

x560908_var_FileId = 560908
x560908_var_QuestName="ÍþÍûÉÌµê"
x560908_var_ShopList={908}






function x560908_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560908_var_ShopList[1] )
end









function x560908_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560908_var_FileId, x560908_var_QuestName,10)
end









function x560908_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560908_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560908_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560908_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560908_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560908_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560908_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560908_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
