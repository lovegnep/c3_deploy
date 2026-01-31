

x560200_var_FileId = 560200
x560200_var_QuestName="行脚商人的店铺"
x560200_var_ShopList={200}






function x560200_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560200_var_ShopList[1] )
end









function x560200_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560200_var_FileId, x560200_var_QuestName,10)
end









function x560200_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560200_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560200_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560200_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560200_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560200_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560200_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560200_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
