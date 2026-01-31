

x560809_var_FileId = 560809
x560809_var_QuestName="印度珠宝术绿宝石类宝石配方店"
x560809_var_ShopList={809}






function x560809_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560809_var_ShopList[1] )
end









function x560809_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560809_var_FileId, x560809_var_QuestName,10)
	else
		return
	end
	
end









function x560809_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560809_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560809_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560809_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560809_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560809_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560809_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560809_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
