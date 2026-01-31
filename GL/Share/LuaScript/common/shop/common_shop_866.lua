

x560866_var_FileId = 560866
x560866_var_QuestName="巴尔干战车术配方商店"
x560866_var_ShopList={866}






function x560866_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560866_var_ShopList[1] )
end









function x560866_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 70 then
		TalkAppendButton(varMap, x560866_var_FileId, x560866_var_QuestName,10)
	else
		return
	end
	
end









function x560866_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560866_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560866_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560866_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560866_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560866_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560866_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560866_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
