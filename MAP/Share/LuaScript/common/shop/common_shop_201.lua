

x560201_var_FileId = 560201
x560201_var_QuestName="转职道具金币商店"
x560201_var_ShopList={201}






function x560201_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560201_var_ShopList[1] )
end









function x560201_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 70 then
		TalkAppendButton(varMap, x560201_var_FileId, x560201_var_QuestName,10)
	else
		return
	end
	
end









function x560201_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560201_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560201_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560201_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560201_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560201_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560201_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560201_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
