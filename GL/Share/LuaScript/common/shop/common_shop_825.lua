

x560825_var_FileId = 560825
x560825_var_QuestName="蒙古驯马术控制类技能配方店"
x560825_var_ShopList={825}






function x560825_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560825_var_ShopList[1] )
end









function x560825_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560825_var_FileId, x560825_var_QuestName,10)
	else
		return
	end
	
end









function x560825_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560825_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560825_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560825_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560825_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560825_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560825_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560825_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
