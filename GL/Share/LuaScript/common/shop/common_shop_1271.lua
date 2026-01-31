

x561271_var_FileId = 561271
x561271_var_QuestName="装备升级金币商店"
x561271_var_ShopList={1271}






function x561271_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561271_var_ShopList[1] )
end









function x561271_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x561271_var_FileId, x561271_var_QuestName,10)
	else
		return
	end
	
end









function x561271_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561271_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561271_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561271_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561271_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561271_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561271_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561271_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
