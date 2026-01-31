

x560079_var_FileId = 560079
x560079_var_QuestName="天传声望装备店"
x560079_var_ShopList={79}






function x560079_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560079_var_ShopList[1] )
end









function x560079_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel >= 35 then
		TalkAppendButton(varMap, x560079_var_FileId, x560079_var_QuestName,10)
	else
		return
	end

end









function x560079_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560079_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560079_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560079_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560079_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560079_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560079_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560079_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
