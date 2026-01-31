

x561259_var_FileId = 561259
x561259_var_QuestName="Æï³ËÁ¶»¯½ð±ÒÉÌµê"
x561259_var_ShopList={1259}






function x561259_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561259_var_ShopList[1] )
end









function x561259_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 85 then
		TalkAppendButton(varMap, x561259_var_FileId, x561259_var_QuestName,10)
	else
		return
	end
	
end









function x561259_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561259_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561259_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561259_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561259_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561259_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561259_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561259_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
