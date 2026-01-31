

x560836_var_FileId = 560836
x560836_var_QuestName="罗马铸甲术头盔类防具配方店"
x560836_var_ShopList={836}






function x560836_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560836_var_ShopList[1] )
end









function x560836_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560836_var_FileId, x560836_var_QuestName,10)
	else
		return
	end
	
end









function x560836_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560836_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560836_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560836_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560836_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560836_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560836_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560836_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
