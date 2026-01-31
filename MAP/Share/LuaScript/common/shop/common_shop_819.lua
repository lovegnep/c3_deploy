

x560819_var_FileId = 560819
x560819_var_QuestName="蒙古驯马术攻击类技能配方店"
x560819_var_ShopList={819}






function x560819_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560819_var_ShopList[1] )
end









function x560819_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560819_var_FileId, x560819_var_QuestName,10)
	else
		return
	end
	
end









function x560819_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560819_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560819_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560819_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560819_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560819_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560819_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560819_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
