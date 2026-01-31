

x560080_var_FileId = 560080
x560080_var_QuestName="天传声望装备店"
x560080_var_ShopList={80}






function x560080_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560080_var_ShopList[1] )
end









function x560080_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel >= 35 then
		TalkAppendButton(varMap, x560080_var_FileId, x560080_var_QuestName,10)
	else
		return
	end

end









function x560080_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560080_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560080_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560080_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560080_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560080_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560080_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560080_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
