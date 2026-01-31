

x560811_var_FileId = 560811
x560811_var_QuestName="印度珠宝术黄宝石类宝石配方店"
x560811_var_ShopList={811}






function x560811_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560811_var_ShopList[1] )
end









function x560811_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560811_var_FileId, x560811_var_QuestName,10)
	else
		return
	end
	
end









function x560811_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560811_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560811_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560811_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560811_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560811_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560811_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560811_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
