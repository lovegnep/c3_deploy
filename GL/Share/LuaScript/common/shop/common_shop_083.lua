

x560083_var_FileId = 560083
x560083_var_QuestName="天传声望装备店"
x560083_var_ShopList={83}






function x560083_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560083_var_ShopList[1] )
end









function x560083_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel >= 35 then
		TalkAppendButton(varMap, x560083_var_FileId, x560083_var_QuestName,10)
	else
		return
	end

end









function x560083_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560083_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560083_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560083_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560083_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560083_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560083_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560083_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
