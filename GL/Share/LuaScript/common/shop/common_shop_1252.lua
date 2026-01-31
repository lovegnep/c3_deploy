

x561252_var_FileId = 561252
x561252_var_QuestName="Ò¹Ã÷Öé½ð±ÒÉÌµê"
x561252_var_ShopList={1252}






function x561252_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561252_var_ShopList[1] )
end









function x561252_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 80 then
		TalkAppendButton(varMap, x561252_var_FileId, x561252_var_QuestName,10)
	else
		return
	end
	
end









function x561252_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561252_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561252_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561252_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561252_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561252_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561252_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561252_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
