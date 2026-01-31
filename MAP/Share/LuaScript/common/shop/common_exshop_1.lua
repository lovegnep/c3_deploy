

x561501_var_FileId = 561501
x561501_var_QuestName="…Ò√ÿ…ÃµÍ"
x561501_var_EXShopList={22}






function x561501_ProcEventEntry(varMap, varPlayer, varTalknpc)	

		DeliverDynamicShopItem(varMap, varPlayer, varTalknpc, x561501_var_EXShopList[1])

end









function x561501_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
		if GetGameOpenById(2001)<=0 then

		return
	end
	if nLevel >= 40 then
		TalkAppendButton(varMap, x561501_var_FileId, x561501_var_QuestName,10)
	else
		return
	end
	
end









function x561501_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561501_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561501_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561501_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561501_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561501_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561501_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561501_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
