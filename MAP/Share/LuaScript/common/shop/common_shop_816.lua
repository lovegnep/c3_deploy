

x560816_var_FileId = 560816
x560816_var_QuestName="蒙古驯马术普通类技能配方店"
x560816_var_ShopList={816}






function x560816_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560816_var_ShopList[1] )
end









function x560816_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560816_var_FileId, x560816_var_QuestName,10)
	else
		return
	end
	
end









function x560816_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560816_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560816_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560816_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560816_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560816_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560816_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560816_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
