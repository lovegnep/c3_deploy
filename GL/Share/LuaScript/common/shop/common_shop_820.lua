

x560820_var_FileId = 560820
x560820_var_QuestName="蒙古驯马术回复类技能配方店"
x560820_var_ShopList={820}






function x560820_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560820_var_ShopList[1] )
end









function x560820_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560820_var_FileId, x560820_var_QuestName,10)
	else
		return
	end
	
end









function x560820_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560820_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560820_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560820_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560820_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560820_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560820_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560820_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
