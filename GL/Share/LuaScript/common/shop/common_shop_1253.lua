

x561253_var_FileId = 561253
x561253_var_QuestName="öÌ½ð½ð±ÒÉÌµê"
x561253_var_ShopList={1253}






function x561253_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561253_var_ShopList[1] )
end









function x561253_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x561253_var_FileId, x561253_var_QuestName,10)
	else
		return
	end
	
end









function x561253_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561253_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561253_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561253_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561253_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561253_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561253_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561253_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
