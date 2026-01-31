

x560320_var_FileId = 560320
x560320_var_QuestName="装备锻造材料店"
x560320_var_ShopList={320}






function x560320_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560320_var_ShopList[1] )
end









function x560320_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560320_var_FileId, x560320_var_QuestName,10)
	else
		return
	end
	
end









function x560320_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560320_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560320_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560320_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560320_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560320_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560320_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560320_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
