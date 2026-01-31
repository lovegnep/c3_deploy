

x560082_var_FileId = 560082
x560082_var_QuestName="天传声望装备店"
x560082_var_ShopList={82}






function x560082_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560082_var_ShopList[1] )
end









function x560082_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel >= 35 then
		TalkAppendButton(varMap, x560082_var_FileId, x560082_var_QuestName,10)
	else
		return
	end

end









function x560082_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560082_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560082_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560082_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560082_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560082_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560082_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560082_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
