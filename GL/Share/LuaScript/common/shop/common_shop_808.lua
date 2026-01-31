

x560808_var_FileId = 560808
x560808_var_QuestName="印度珠宝术蓝宝石类宝石配方店"
x560808_var_ShopList={808}






function x560808_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560808_var_ShopList[1] )
end









function x560808_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560808_var_FileId, x560808_var_QuestName,10)
	else
		return
	end
	
end









function x560808_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560808_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560808_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560808_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560808_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560808_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560808_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560808_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
