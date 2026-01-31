

x560856_var_FileId = 560856
x560856_var_QuestName="冥龙掌门主武器锻造大师配方店"
x560856_var_ShopList={856}






function x560856_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560856_var_ShopList[1] )
end









function x560856_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560856_var_FileId, x560856_var_QuestName,10)
	else
		return
	end
	
end









function x560856_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560856_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560856_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560856_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560856_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560856_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560856_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560856_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
