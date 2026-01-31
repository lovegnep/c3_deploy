

x560837_var_FileId = 560837
x560837_var_QuestName="罗马铸甲术衣服类防具配方店"
x560837_var_ShopList={837}






function x560837_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560837_var_ShopList[1] )
end









function x560837_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560837_var_FileId, x560837_var_QuestName,10)
	else
		return
	end
	
end









function x560837_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560837_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560837_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560837_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560837_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560837_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560837_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560837_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
