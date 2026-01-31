

x561266_var_FileId = 561266
x561266_var_QuestName="»¢»ê½ð±ÒÉÌµê"
x561266_var_ShopList={1266}






function x561266_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561266_var_ShopList[1] )
end









function x561266_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 40 then
		TalkAppendButton(varMap, x561266_var_FileId, x561266_var_QuestName,10)
	else
		return
	end
	
end









function x561266_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561266_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561266_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561266_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561266_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561266_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561266_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561266_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
