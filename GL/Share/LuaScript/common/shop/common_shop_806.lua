

x560806_var_FileId = 560806
x560806_var_QuestName="印度珠宝术黄宝石类宝石配方店"
x560806_var_ShopList={806}






function x560806_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560806_var_ShopList[1] )
end









function x560806_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560806_var_FileId, x560806_var_QuestName,10)
	else
		return
	end
	
end









function x560806_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560806_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560806_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560806_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560806_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560806_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560806_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560806_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
