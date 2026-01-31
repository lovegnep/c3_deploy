

x560843_var_FileId = 560843
x560843_var_QuestName="罗马铸甲术衣服类防具配方店"
x560843_var_ShopList={843}






function x560843_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560843_var_ShopList[1] )
end









function x560843_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560843_var_FileId, x560843_var_QuestName,10)
	else
		return
	end
	
end









function x560843_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560843_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560843_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560843_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560843_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560843_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560843_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560843_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
