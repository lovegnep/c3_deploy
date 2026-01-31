

x560848_var_FileId = 560848
x560848_var_QuestName="波斯工艺术戒指类饰品配方店"
x560848_var_ShopList={848}






function x560848_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560848_var_ShopList[1] )
end









function x560848_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560848_var_FileId, x560848_var_QuestName,10)
	else
		return
	end
	
end









function x560848_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560848_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560848_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560848_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560848_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560848_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560848_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560848_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
