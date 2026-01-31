

x560855_var_FileId = 560855
x560855_var_QuestName="波斯工艺术特殊类物品配方店"
x560855_var_ShopList={855}






function x560855_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560855_var_ShopList[1] )
end









function x560855_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560855_var_FileId, x560855_var_QuestName,10)
	else
		return
	end
	
end









function x560855_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560855_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560855_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560855_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560855_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560855_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560855_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560855_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
