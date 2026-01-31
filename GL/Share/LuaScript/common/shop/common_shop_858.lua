

x560858_var_FileId = 560858
x560858_var_QuestName="Ú¤ÁúÕÆÃÅÕ½¼×Öý¼×´óÊ¦Åä·½µê"
x560858_var_ShopList={858}






function x560858_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560858_var_ShopList[1] )
end









function x560858_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560858_var_FileId, x560858_var_QuestName,10)
	else
		return
	end
	
end









function x560858_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560858_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560858_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560858_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560858_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560858_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560858_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560858_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
