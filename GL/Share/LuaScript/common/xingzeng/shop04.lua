

x588004_var_FileId = 588004
x588004_var_QuestName="现金材料商城"
x588004_var_ShopList={1744}






function x588004_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x588004_var_ShopList[1] )
end









function x588004_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x588004_var_FileId, x588004_var_QuestName,10)
	else
		return
	end
	
end









function x588004_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x588004_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x588004_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x588004_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x588004_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x588004_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x588004_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x588004_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
