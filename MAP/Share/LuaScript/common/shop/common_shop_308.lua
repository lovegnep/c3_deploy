

x560308_var_FileId = 560308
x560308_var_QuestName="二级坐骑技能"
x560308_var_ShopList={308}






function x560308_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560308_var_ShopList[1] )
end









function x560308_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 30 then
		TalkAppendButton(varMap, x560308_var_FileId, x560308_var_QuestName,10)
	else
		return
	end
	
end









function x560308_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560308_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560308_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560308_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560308_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560308_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560308_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560308_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
