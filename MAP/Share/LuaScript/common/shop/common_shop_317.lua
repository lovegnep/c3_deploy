

x560317_var_FileId = 560317
x560317_var_QuestName="ÉùÍûÖý¼×Åä·½ÉÌµê"
x560317_var_ShopList={317}






function x560317_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560317_var_ShopList[1] )
end









function x560317_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	



		TalkAppendButton(varMap, x560317_var_FileId, x560317_var_QuestName,10)



	
end









function x560317_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560317_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560317_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560317_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560317_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560317_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560317_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560317_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
