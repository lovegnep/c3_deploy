

x560831_var_FileId = 560831
x560831_var_QuestName="Í»ØÊ¶ÍÔìÊõ¸±ÎäÆ÷Åä·½µê"
x560831_var_ShopList={831}






function x560831_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560831_var_ShopList[1] )
end









function x560831_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560831_var_FileId, x560831_var_QuestName,10)
	else
		return
	end
	
end









function x560831_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560831_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560831_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560831_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560831_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560831_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560831_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560831_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
