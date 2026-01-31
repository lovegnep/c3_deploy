

x560910_var_FileId = 560910
x560910_var_QuestName="ÌìÇÅÃ×ÆÌ"
x560910_var_ShopList={910}






function x560910_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560910_var_ShopList[1] )
end









function x560910_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560910_var_FileId, x560910_var_QuestName,10)

end









function x560910_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560910_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560910_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560910_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560910_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560910_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560910_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560910_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
