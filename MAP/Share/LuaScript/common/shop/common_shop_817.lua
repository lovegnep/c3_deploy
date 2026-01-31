

x560817_var_FileId = 560817
x560817_var_QuestName="蒙古驯马术辅攻类技能配方店"
x560817_var_ShopList={817}






function x560817_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560817_var_ShopList[1] )
end









function x560817_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560817_var_FileId, x560817_var_QuestName,10)
	else
		return
	end
	
end









function x560817_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560817_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560817_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560817_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560817_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560817_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560817_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560817_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
