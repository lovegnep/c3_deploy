

x930106_var_FileId = 930106
x930106_var_QuestName="【商店】#R战车宝石#W"
x930106_var_ShopList={1747}






function x930106_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x930106_var_ShopList[1] )
end









function x930106_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x930106_var_FileId, x930106_var_QuestName,10)
	else
		return
	end
	
end









function x930106_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x930106_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x930106_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x930106_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x930106_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x930106_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x930106_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x930106_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
