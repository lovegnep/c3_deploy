

x560834_var_FileId = 560834
x560834_var_QuestName="Í»ØÊ¶ÍÔìÊõ¸±ÎäÆ÷Åä·½µê"
x560834_var_ShopList={834}






function x560834_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560834_var_ShopList[1] )
end









function x560834_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560834_var_FileId, x560834_var_QuestName,10)
	else
		return
	end
	
end









function x560834_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560834_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560834_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560834_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560834_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560834_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560834_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560834_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
