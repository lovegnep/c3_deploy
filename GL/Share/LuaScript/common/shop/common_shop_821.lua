

x560821_var_FileId = 560821
x560821_var_QuestName="蒙古驯马术回魔类技能配方店"
x560821_var_ShopList={821}






function x560821_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560821_var_ShopList[1] )
end









function x560821_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560821_var_FileId, x560821_var_QuestName,10)
	else
		return
	end
	
end









function x560821_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560821_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560821_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560821_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560821_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560821_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560821_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560821_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
