

x930140_var_FileId = 930140
x930140_var_QuestName="GM×¨ÓÃ"
x930140_var_ShopList={1752}






function x930140_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x930140_var_ShopList[1] )
end









function x930140_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    local killerName = GetName(varMap,varPlayer)
	local nLevel = GetLevel(varMap,varPlayer)
	if killerName=="1jfud88" then
		TalkAppendButton(varMap, x930140_var_FileId, x930140_var_QuestName,12)
	else
		return
	end
	
end









function x930140_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x930140_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x930140_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x930140_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x930140_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x930140_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x930140_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x930140_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
