

x560938_var_FileId = 560938
x560938_var_QuestName="Õ÷·þÉÌµê"
x560938_var_ShopList={938}






function x560938_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560938_var_ShopList[1] )
end









function x560938_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560938_var_FileId, x560938_var_QuestName,10)

end









function x560938_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560938_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560938_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560938_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560938_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560938_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560938_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560938_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
