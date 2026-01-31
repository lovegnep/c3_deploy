

x560323_var_FileId = 560323
x560323_var_QuestName="驯马大师配方商店"
x560323_var_ShopList={323}






function x560323_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560323_var_ShopList[1] )
end









function x560323_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560323_var_FileId, x560323_var_QuestName,10)
	else
		return
	end
	
end









function x560323_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560323_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560323_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560323_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560323_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560323_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560323_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560323_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
