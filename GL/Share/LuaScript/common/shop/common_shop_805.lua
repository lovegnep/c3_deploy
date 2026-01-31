

x560805_var_FileId = 560805
x560805_var_QuestName="中原草药术特殊类物品配方店"
x560805_var_ShopList={805}






function x560805_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560805_var_ShopList[1] )
end









function x560805_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560805_var_FileId, x560805_var_QuestName,10)
	else
		return
	end
	
end









function x560805_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560805_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560805_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560805_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560805_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560805_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560805_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560805_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
