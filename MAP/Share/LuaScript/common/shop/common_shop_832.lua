

x560832_var_FileId = 560832
x560832_var_QuestName="突厥锻造术特殊类物品配方店"
x560832_var_ShopList={832}






function x560832_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560832_var_ShopList[1] )
end









function x560832_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560832_var_FileId, x560832_var_QuestName,10)
	else
		return
	end
	
end









function x560832_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560832_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560832_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560832_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560832_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560832_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560832_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560832_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
