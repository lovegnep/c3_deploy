

x560814_var_FileId = 560814
x560814_var_QuestName="印度珠宝术绿宝石类宝石配方店"
x560814_var_ShopList={814}






function x560814_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560814_var_ShopList[1] )
end









function x560814_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560814_var_FileId, x560814_var_QuestName,10)
	else
		return
	end
	
end









function x560814_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560814_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560814_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560814_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560814_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560814_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560814_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560814_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
