

x560845_var_FileId = 560845
x560845_var_QuestName="罗马铸甲术腰带类防具配方店"
x560845_var_ShopList={845}






function x560845_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560845_var_ShopList[1] )
end









function x560845_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560845_var_FileId, x560845_var_QuestName,10)
	else
		return
	end
	
end









function x560845_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560845_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560845_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560845_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560845_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560845_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560845_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560845_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
