

x560311_var_FileId = 560311
x560311_var_QuestName="四级坐骑技能"
x560311_var_ShopList={311}






function x560311_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560311_var_ShopList[1] )
end









function x560311_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x560311_var_FileId, x560311_var_QuestName,10)
	else
		return
	end
	
end









function x560311_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560311_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560311_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560311_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560311_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560311_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560311_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560311_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
