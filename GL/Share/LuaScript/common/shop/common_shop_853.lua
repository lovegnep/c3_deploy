

x560853_var_FileId = 560853
x560853_var_QuestName="波斯工艺术手镯类饰品配方店"
x560853_var_ShopList={853}






function x560853_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560853_var_ShopList[1] )
end









function x560853_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560853_var_FileId, x560853_var_QuestName,10)
	else
		return
	end
	
end









function x560853_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560853_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560853_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560853_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560853_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560853_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560853_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560853_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
