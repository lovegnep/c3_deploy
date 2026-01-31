

x560868_var_FileId = 560868
x560868_var_QuestName="¾«ÖÂË®¾§ÉÌµê"
x560868_var_ShopList={868}






function x560868_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560868_var_ShopList[1] )
end









function x560868_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560868_var_FileId, x560868_var_QuestName,10)
	else
		return
	end
	
end









function x560868_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560868_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560868_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560868_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560868_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560868_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560868_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560868_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
