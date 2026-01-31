

x560343_var_FileId = 560343
x560343_var_QuestName="¶ËÎç½ÚôÕ×Ó²ÄÁÏµê"
x560343_var_ShopList={343}






function x560343_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560343_var_ShopList[1] )
end









function x560343_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 1 then
		TalkAppendButton(varMap, x560343_var_FileId, x560343_var_QuestName,10)
	else
		return
	end
	
end









function x560343_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560343_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560343_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560343_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560343_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560343_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560343_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560343_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
