

x560818_var_FileId = 560818
x560818_var_QuestName="蒙古驯马术控制类技能配方店"
x560818_var_ShopList={818}






function x560818_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560818_var_ShopList[1] )
end









function x560818_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560818_var_FileId, x560818_var_QuestName,10)
	else
		return
	end
	
end









function x560818_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560818_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560818_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560818_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560818_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560818_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560818_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560818_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
