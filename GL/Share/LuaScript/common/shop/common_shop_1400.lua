

x561400_var_FileId = 561400
x561400_var_QuestName="Âí±ÒÉÌµê"
x561400_var_ShopList={1400}






function x561400_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561400_var_ShopList[1] )
end









function x561400_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 75 then
		TalkAppendButton(varMap, x561400_var_FileId, x561400_var_QuestName,10)
	else
		return
	end
	
end









function x561400_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561400_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561400_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561400_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561400_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561400_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561400_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561400_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
