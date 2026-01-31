

x561265_var_FileId = 561265
x561265_var_QuestName="½ð¸ÕÉ³ÉÌµê"
x561265_var_ShopList={1265}






function x561265_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561265_var_ShopList[1] )
end









function x561265_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 40 then
		TalkAppendButton(varMap, x561265_var_FileId, x561265_var_QuestName,10)
	else
		return
	end
	
end









function x561265_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561265_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561265_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561265_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561265_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561265_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561265_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561265_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
