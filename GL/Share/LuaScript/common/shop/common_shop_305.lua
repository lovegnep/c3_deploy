

x560305_var_FileId = 560305
x560305_var_QuestName="ÉùÍû±¦Ê¯µê"
x560305_var_ShopList={305}






function x560305_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560305_var_ShopList[1] )
end









function x560305_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560305_var_FileId, x560305_var_QuestName,10)
end









function x560305_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560305_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560305_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560305_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560305_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560305_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560305_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560305_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
