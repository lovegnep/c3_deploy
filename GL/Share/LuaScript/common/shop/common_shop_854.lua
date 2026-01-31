

x560854_var_FileId = 560854
x560854_var_QuestName="波斯工艺术项链类饰品配方店"
x560854_var_ShopList={854}






function x560854_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560854_var_ShopList[1] )
end









function x560854_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560854_var_FileId, x560854_var_QuestName,10)
	else
		return
	end
	
end









function x560854_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560854_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560854_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560854_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560854_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560854_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560854_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560854_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
