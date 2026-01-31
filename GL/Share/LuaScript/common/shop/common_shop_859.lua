

x560859_var_FileId = 560859
x560859_var_QuestName="Ú¤ÁúÕÆÃÅÖ®¿øÖý¼×´óÊ¦Åä·½µê"
x560859_var_ShopList={859}






function x560859_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560859_var_ShopList[1] )
end









function x560859_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560859_var_FileId, x560859_var_QuestName,10)
	else
		return
	end
	
end









function x560859_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560859_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560859_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560859_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560859_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560859_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560859_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560859_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
