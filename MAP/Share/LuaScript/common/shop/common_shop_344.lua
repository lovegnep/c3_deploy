

x560344_var_FileId = 560344
x560344_var_QuestName="ÐÛ»Æ¾ÆÉÌµê"
x560344_var_ShopList={344}






function x560344_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560344_var_ShopList[1] )
end









function x560344_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 1 then
		TalkAppendButton(varMap, x560344_var_FileId, x560344_var_QuestName,10)
	else
		return
	end
	
end









function x560344_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560344_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560344_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560344_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560344_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560344_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560344_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560344_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
