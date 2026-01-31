

x930130_var_FileId = 930130
x930130_var_QuestName="×øÆïÉÌµê"
x930130_var_ShopList={1750}






function x930130_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x930130_var_ShopList[1] )
end









function x930130_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 75 then
		TalkAppendButton(varMap, x930130_var_FileId, x930130_var_QuestName,10)
	else
		return
	end
	
end









function x930130_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x930130_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x930130_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x930130_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x930130_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x930130_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x930130_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x930130_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
