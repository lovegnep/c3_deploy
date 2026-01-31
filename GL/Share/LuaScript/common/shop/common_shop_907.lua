

x560907_var_FileId = 560907
x560907_var_QuestName="生活技能材料店"
x560907_var_ShopList={907}






function x560907_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560907_var_ShopList[1] )
end









function x560907_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560907_var_FileId, x560907_var_QuestName,10)
end









function x560907_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560907_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560907_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560907_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560907_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560907_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560907_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560907_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
