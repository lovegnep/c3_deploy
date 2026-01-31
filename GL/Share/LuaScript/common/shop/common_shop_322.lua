

x560322_var_FileId = 560322
x560322_var_QuestName="珠宝大师配方商店"
x560322_var_ShopList={322}






function x560322_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560322_var_ShopList[1] )
end









function x560322_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560322_var_FileId, x560322_var_QuestName,10)
	else
		return
	end
	
end









function x560322_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560322_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560322_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560322_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560322_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560322_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560322_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560322_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
