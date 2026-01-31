

x588001_var_FileId = 588001
x588001_var_QuestName="·ÀÓùÍ¼¼øÉÌ³Ç"
x588001_var_ShopList={1741}






function x588001_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x588001_var_ShopList[1] )
end









function x588001_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x588001_var_FileId, x588001_var_QuestName,10)
	else
		return
	end
	
end









function x588001_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x588001_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x588001_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x588001_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x588001_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x588001_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x588001_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x588001_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
