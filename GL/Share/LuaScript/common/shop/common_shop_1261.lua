

x561261_var_FileId = 561261
x561261_var_QuestName="专精天赋金币商店"
x561261_var_ShopList={1261}






function x561261_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561261_var_ShopList[1] )
end









function x561261_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 80 then
		TalkAppendButton(varMap, x561261_var_FileId, x561261_var_QuestName,10)
	else
		return
	end
	
end









function x561261_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561261_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561261_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561261_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561261_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561261_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561261_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561261_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
