

x560827_var_FileId = 560827
x560827_var_QuestName="蒙古驯马术回复类技能配方店"
x560827_var_ShopList={827}






function x560827_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560827_var_ShopList[1] )
end









function x560827_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560827_var_FileId, x560827_var_QuestName,10)
	else
		return
	end
	
end









function x560827_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560827_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560827_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560827_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560827_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560827_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560827_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560827_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
