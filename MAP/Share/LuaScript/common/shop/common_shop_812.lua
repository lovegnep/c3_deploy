

x560812_var_FileId = 560812
x560812_var_QuestName="印度珠宝术红宝石类宝石配方店"
x560812_var_ShopList={812}






function x560812_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560812_var_ShopList[1] )
end









function x560812_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560812_var_FileId, x560812_var_QuestName,10)
	else
		return
	end
	
end









function x560812_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560812_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560812_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560812_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560812_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560812_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560812_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560812_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
