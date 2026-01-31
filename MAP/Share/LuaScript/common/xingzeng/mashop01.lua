

x930129_var_FileId = 930129
x930129_var_QuestName="【商店】#R现银商店#W"
x930129_var_ShopList={1749}






function x930129_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x930129_var_ShopList[1] )
end









function x930129_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 10 then
		TalkAppendButton(varMap, x930129_var_FileId, x930129_var_QuestName,22)
	else
		return
	end
	
end









function x930129_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x930129_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x930129_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x930129_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x930129_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x930129_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x930129_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x930129_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
