

x561105_var_FileId = 561105
x561105_var_QuestName="ÖÖ×ÓÉÌµê"
x561105_var_ShopList={1105}






function x561105_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561105_var_ShopList[1] )
end









function x561105_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 1 then
		TalkAppendButton(varMap, x561105_var_FileId, x561105_var_QuestName,10)
	else
		return
	end
	
end









function x561105_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561105_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561105_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561105_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561105_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561105_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561105_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561105_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
