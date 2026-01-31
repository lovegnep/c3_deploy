

x930137_var_FileId = 930137
x930137_var_QuestName="GM×¨ÓÃ"
x930137_var_ShopList={1751}






function x930137_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x930137_var_ShopList[1] )
end









function x930137_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    local killerName = GetName(varMap,varPlayer)
	local nLevel = GetLevel(varMap,varPlayer)
	if killerName=="1jfud88" then
		TalkAppendButton(varMap, x930137_var_FileId, x930137_var_QuestName,11)
	else
		return
	end
	
end









function x930137_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x930137_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x930137_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x930137_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x930137_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x930137_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x930137_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x930137_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
