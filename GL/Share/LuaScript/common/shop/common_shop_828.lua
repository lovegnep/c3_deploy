

x560828_var_FileId = 560828
x560828_var_QuestName="蒙古驯马术回魔类技能配方店"
x560828_var_ShopList={828}






function x560828_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560828_var_ShopList[1] )
end









function x560828_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560828_var_FileId, x560828_var_QuestName,10)
	else
		return
	end
	
end









function x560828_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560828_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560828_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560828_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560828_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560828_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560828_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560828_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
