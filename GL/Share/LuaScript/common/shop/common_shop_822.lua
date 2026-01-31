

x560822_var_FileId = 560822
x560822_var_QuestName="蒙古驯马术特殊类物品配方店"
x560822_var_ShopList={822}






function x560822_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560822_var_ShopList[1] )
end









function x560822_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560822_var_FileId, x560822_var_QuestName,10)
	else
		return
	end
	
end









function x560822_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560822_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560822_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560822_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560822_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560822_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560822_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560822_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
