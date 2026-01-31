

x560339_var_FileId = 560339
x560339_var_QuestName="情人节商店"
x560339_var_ShopList={339}





function x560339_ProcEventEntry(varMap, varPlayer, varTalknpc)

	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560339_var_ShopList[1] )
	
end









function x560339_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local day =GetDayOfYear()

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560339_var_FileId, x560339_var_QuestName,10)
	else
		return
	end
	
end









function x560339_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560339_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560339_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560339_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560339_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560339_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560339_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560339_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
