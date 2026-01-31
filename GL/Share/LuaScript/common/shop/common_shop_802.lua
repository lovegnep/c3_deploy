

x560802_var_FileId = 560802
x560802_var_QuestName="中原草药术特殊类物品配方店"
x560802_var_ShopList={802}






function x560802_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560802_var_ShopList[1] )
end









function x560802_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560802_var_FileId, x560802_var_QuestName,10)
	else
		return
	end
	
end









function x560802_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560802_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560802_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560802_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560802_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560802_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560802_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560802_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
