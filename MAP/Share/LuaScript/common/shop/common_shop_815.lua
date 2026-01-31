

x560815_var_FileId = 560815
x560815_var_QuestName="印度珠宝术特殊类物品配方店"
x560815_var_ShopList={815}






function x560815_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560815_var_ShopList[1] )
end









function x560815_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560815_var_FileId, x560815_var_QuestName,10)
	else
		return
	end
	
end









function x560815_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560815_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560815_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560815_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560815_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560815_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560815_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560815_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
