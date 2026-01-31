

x560807_var_FileId = 560807
x560807_var_QuestName="印度珠宝术红宝石类宝石配方店"
x560807_var_ShopList={807}






function x560807_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560807_var_ShopList[1] )
end









function x560807_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560807_var_FileId, x560807_var_QuestName,10)
	else
		return
	end
	
end









function x560807_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560807_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560807_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560807_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560807_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560807_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560807_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560807_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
