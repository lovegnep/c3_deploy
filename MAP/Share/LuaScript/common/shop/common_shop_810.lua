

x560810_var_FileId = 560810
x560810_var_QuestName="印度珠宝术特殊类物品配方店"
x560810_var_ShopList={810}






function x560810_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560810_var_ShopList[1] )
end









function x560810_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560810_var_FileId, x560810_var_QuestName,10)
	else
		return
	end
	
end









function x560810_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560810_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560810_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560810_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560810_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560810_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560810_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560810_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
