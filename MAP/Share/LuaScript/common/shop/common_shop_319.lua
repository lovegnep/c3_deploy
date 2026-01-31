

x560319_var_FileId = 560319
x560319_var_QuestName="Áù¼¶×øÆï¼¼ÄÜ"
x560319_var_ShopList={319}






function x560319_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560319_var_ShopList[1] )
end









function x560319_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 80 then
		TalkAppendButton(varMap, x560319_var_FileId, x560319_var_QuestName,10)
	else
		return
	end
	
end









function x560319_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560319_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560319_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560319_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560319_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560319_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560319_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560319_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
