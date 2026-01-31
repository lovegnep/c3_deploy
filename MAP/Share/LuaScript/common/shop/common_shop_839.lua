

x560839_var_FileId = 560839
x560839_var_QuestName="罗马铸甲术腰带类防具配方店"
x560839_var_ShopList={839}






function x560839_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560839_var_ShopList[1] )
end









function x560839_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560839_var_FileId, x560839_var_QuestName,10)
	else
		return
	end
	
end









function x560839_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560839_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560839_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560839_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560839_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560839_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560839_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560839_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
