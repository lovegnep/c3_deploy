

x560851_var_FileId = 560851
x560851_var_QuestName="波斯工艺术特殊类物品配方店"
x560851_var_ShopList={851}






function x560851_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560851_var_ShopList[1] )
end









function x560851_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560851_var_FileId, x560851_var_QuestName,10)
	else
		return
	end
	
end









function x560851_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560851_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560851_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560851_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560851_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560851_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560851_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560851_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
