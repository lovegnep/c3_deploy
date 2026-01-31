

x588013_var_FileId = 588013
x588013_var_QuestName="¡¾ÉÌµê¡¿#R×øÆïÍ¼¼ø#W"
x588013_var_ShopList={1748}






function x588013_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x588013_var_ShopList[1] )
end









function x588013_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x588013_var_FileId, x588013_var_QuestName,10)
	else
		return
	end
	
end









function x588013_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x588013_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x588013_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x588013_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x588013_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x588013_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x588013_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x588013_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
