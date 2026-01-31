

x560813_var_FileId = 560813
x560813_var_QuestName="印度珠宝术蓝宝石类宝石配方店"
x560813_var_ShopList={813}






function x560813_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560813_var_ShopList[1] )
end









function x560813_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560813_var_FileId, x560813_var_QuestName,10)
	else
		return
	end
	
end









function x560813_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560813_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560813_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560813_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560813_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560813_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560813_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560813_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
