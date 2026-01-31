

x560844_var_FileId = 560844
x560844_var_QuestName="罗马铸甲术护手类防具配方店"
x560844_var_ShopList={844}






function x560844_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560844_var_ShopList[1] )
end









function x560844_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560844_var_FileId, x560844_var_QuestName,10)
	else
		return
	end
	
end









function x560844_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560844_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560844_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560844_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560844_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560844_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560844_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560844_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
