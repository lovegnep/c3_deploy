

x560862_var_FileId = 560862
x560862_var_QuestName="Ú¤ÁúÕÆÃÅÖ®Ñ¥Öý¼×´óÊ¦Åä·½µê"
x560862_var_ShopList={862}






function x560862_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560862_var_ShopList[1] )
end









function x560862_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560862_var_FileId, x560862_var_QuestName,10)
	else
		return
	end
	
end









function x560862_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560862_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560862_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560862_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560862_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560862_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560862_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560862_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
