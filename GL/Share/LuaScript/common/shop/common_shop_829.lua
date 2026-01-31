

x560829_var_FileId = 560829
x560829_var_QuestName="蒙古驯马术特殊类物品配方店"
x560829_var_ShopList={829}






function x560829_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560829_var_ShopList[1] )
end









function x560829_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560829_var_FileId, x560829_var_QuestName,10)
	else
		return
	end
	
end









function x560829_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560829_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560829_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560829_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560829_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560829_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560829_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560829_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
