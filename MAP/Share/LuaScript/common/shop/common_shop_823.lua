

x560823_var_FileId = 560823
x560823_var_QuestName="蒙古驯马术普通类技能配方店"
x560823_var_ShopList={823}






function x560823_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560823_var_ShopList[1] )
end









function x560823_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560823_var_FileId, x560823_var_QuestName,10)
	else
		return
	end
	
end









function x560823_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560823_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560823_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560823_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560823_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560823_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560823_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560823_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
