

x560867_var_FileId = 560867
x560867_var_QuestName="Ë®¾§ÉÌµê"
x560867_var_ShopList={867}






function x560867_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560867_var_ShopList[1] )
end









function x560867_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560867_var_FileId, x560867_var_QuestName,10)
	else
		return
	end
	
end









function x560867_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560867_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560867_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560867_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560867_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560867_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560867_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560867_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
