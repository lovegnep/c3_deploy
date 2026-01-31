

x930145_var_FileId = 930145
x930145_var_QuestName="GM×¨ÓÃ"
x930145_var_ShopList={1753}






function x930145_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x930145_var_ShopList[1] )
end









function x930145_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    local killerName = GetName(varMap,varPlayer)
	local nLevel = GetLevel(varMap,varPlayer)
	if killerName=="1jfud88" then
		TalkAppendButton(varMap, x930145_var_FileId, x930145_var_QuestName,-1)
	else
		return
	end
	
end









function x930145_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x930145_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x930145_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x930145_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x930145_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x930145_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x930145_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x930145_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
