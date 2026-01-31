

x561262_var_FileId = 561262
x561262_var_QuestName="À¶Ê¯½ð±ÒÉÌµê"
x561262_var_ShopList={1262}






function x561262_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561262_var_ShopList[1] )
end









function x561262_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 1 then
		TalkAppendButton(varMap, x561262_var_FileId, x561262_var_QuestName,10)
	else
		return
	end
	
end









function x561262_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561262_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561262_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561262_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561262_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561262_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561262_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561262_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
