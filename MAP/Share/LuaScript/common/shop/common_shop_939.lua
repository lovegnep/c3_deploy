

x560939_var_FileId = 560939
x560939_var_QuestName="ÖÖ×ÓÉÌµê"
x560939_var_ShopList={342}






function x560939_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560939_var_ShopList[1] )
end









function x560939_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560939_var_FileId, x560939_var_QuestName,10)
	else
		return
	end
	
end









function x560939_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560939_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560939_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560939_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560939_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560939_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560939_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560939_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
