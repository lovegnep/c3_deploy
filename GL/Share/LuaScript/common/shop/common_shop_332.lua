

x560332_var_FileId = 560332
x560332_var_QuestName="仲夏娱乐币商店"
x560332_var_ShopList={332}






function x560332_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560332_var_ShopList[1] )
end









function x560332_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local year, month, day = GetYearMonthDay();
	local varday = GetDayOfYear()
	if year == 2011 and varday >= 192 and varday <= 226 then   --2011年7月12日到8月15日
		TalkAppendButton(varMap, x560332_var_FileId, x560332_var_QuestName,10)
	else
		return
	end
end









function x560332_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560332_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560332_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560332_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560332_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560332_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560332_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560332_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
