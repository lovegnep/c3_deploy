

x560849_var_FileId = 560849
x560849_var_QuestName="波斯工艺术手镯类饰品配方店"
x560849_var_ShopList={849}






function x560849_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560849_var_ShopList[1] )
end









function x560849_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560849_var_FileId, x560849_var_QuestName,10)
	else
		return
	end
	
end









function x560849_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560849_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560849_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560849_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560849_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560849_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560849_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560849_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
