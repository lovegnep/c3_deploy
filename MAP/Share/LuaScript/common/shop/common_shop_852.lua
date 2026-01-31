

x560852_var_FileId = 560852
x560852_var_QuestName="波斯工艺术戒指类饰品配方店"
x560852_var_ShopList={852}






function x560852_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560852_var_ShopList[1] )
end









function x560852_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560852_var_FileId, x560852_var_QuestName,10)
	else
		return
	end
	
end









function x560852_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560852_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560852_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560852_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560852_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560852_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560852_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560852_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
