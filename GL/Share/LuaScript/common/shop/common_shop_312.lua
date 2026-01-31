

x560312_var_FileId = 560312
x560312_var_QuestName="五级坐骑技能"
x560312_var_ShopList={312}






function x560312_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560312_var_ShopList[1] )
end









function x560312_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x560312_var_FileId, x560312_var_QuestName,10)
	else
		return
	end
	
end









function x560312_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560312_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560312_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560312_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560312_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560312_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560312_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560312_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
