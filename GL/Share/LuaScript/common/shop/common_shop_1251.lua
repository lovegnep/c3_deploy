

x561251_var_FileId = 561251
x561251_var_QuestName="Ãú¿Ì½ð±ÒÉÌµê"
x561251_var_ShopList={1251}






function x561251_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561251_var_ShopList[1] )
end









function x561251_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 45 then
		TalkAppendButton(varMap, x561251_var_FileId, x561251_var_QuestName,10)
	else
		return
	end
	
end









function x561251_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561251_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561251_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561251_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561251_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561251_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561251_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561251_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
