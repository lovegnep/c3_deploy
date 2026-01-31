

x561250_var_FileId = 561250
x561250_var_QuestName="×êÊ¯¿ó½ð±ÒÉÌµê"
x561250_var_ShopList={1250}






function x561250_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561250_var_ShopList[1] )
end









function x561250_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 65 then
		TalkAppendButton(varMap, x561250_var_FileId, x561250_var_QuestName,10)
	else
		return
	end
	
end









function x561250_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561250_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561250_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561250_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561250_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561250_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561250_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561250_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
