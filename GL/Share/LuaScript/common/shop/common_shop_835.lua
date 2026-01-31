

x560835_var_FileId = 560835
x560835_var_QuestName="突厥锻造术特殊类物品配方店"
x560835_var_ShopList={835}






function x560835_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560835_var_ShopList[1] )
end









function x560835_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560835_var_FileId, x560835_var_QuestName,10)
	else
		return
	end
	
end









function x560835_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560835_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560835_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560835_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560835_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560835_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560835_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560835_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
