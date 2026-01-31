

x560860_var_FileId = 560860
x560860_var_QuestName="Ú¤ÁúÕÆÃÅÑü´øÖý¼×´óÊ¦Åä·½µê"
x560860_var_ShopList={860}






function x560860_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560860_var_ShopList[1] )
end









function x560860_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560860_var_FileId, x560860_var_QuestName,10)
	else
		return
	end
	
end









function x560860_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560860_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560860_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560860_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560860_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560860_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560860_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560860_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
