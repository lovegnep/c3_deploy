

x561273_var_FileId = 561273
x561273_var_QuestName="军演作战服商店"
x561273_var_ShopList={346}






function x561273_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561273_var_ShopList[1] )
end









function x561273_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 1 then
		TalkAppendButton(varMap, x561273_var_FileId, x561273_var_QuestName,10)
	else
		return
	end
	
end









function x561273_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561273_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561273_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561273_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561273_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561273_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561273_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561273_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
