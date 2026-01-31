

x561260_var_FileId = 561260
x561260_var_QuestName="平衡天赋金币商店"
x561260_var_ShopList={1260}






function x561260_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561260_var_ShopList[1] )
end









function x561260_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 80 then
		TalkAppendButton(varMap, x561260_var_FileId, x561260_var_QuestName,10)
	else
		return
	end
	
end









function x561260_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561260_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561260_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561260_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561260_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561260_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561260_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561260_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
