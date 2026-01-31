

x560081_var_FileId = 560081
x560081_var_QuestName="天传声望装备店"
x560081_var_ShopList={81}






function x560081_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560081_var_ShopList[1] )
end









function x560081_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel >= 35 then
		TalkAppendButton(varMap, x560081_var_FileId, x560081_var_QuestName,10)
	else
		return
	end

end









function x560081_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560081_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560081_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560081_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560081_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560081_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560081_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560081_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
