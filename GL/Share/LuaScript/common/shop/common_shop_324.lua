

x560324_var_FileId = 560324
x560324_var_QuestName="锻造大师配方商店"
x560324_var_ShopList={324}






function x560324_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560324_var_ShopList[1] )
end









function x560324_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560324_var_FileId, x560324_var_QuestName,10)
	else
		return
	end
	
end









function x560324_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560324_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560324_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560324_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560324_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560324_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560324_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560324_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
