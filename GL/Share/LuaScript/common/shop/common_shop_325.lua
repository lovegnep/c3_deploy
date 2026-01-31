

x560325_var_FileId = 560325
x560325_var_QuestName="铸甲大师配方商店"
x560325_var_ShopList={325}






function x560325_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560325_var_ShopList[1] )
end









function x560325_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560325_var_FileId, x560325_var_QuestName,10)
	else
		return
	end
	
end









function x560325_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560325_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560325_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560325_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560325_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560325_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560325_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560325_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
