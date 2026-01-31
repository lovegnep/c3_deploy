

x560310_var_FileId = 560310
x560310_var_QuestName="三级坐骑技能"
x560310_var_ShopList={310}






function x560310_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560310_var_ShopList[1] )
end









function x560310_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 50 then
		TalkAppendButton(varMap, x560310_var_FileId, x560310_var_QuestName,10)
	else
		return
	end
	
end









function x560310_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560310_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560310_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560310_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560310_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560310_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560310_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560310_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
