

x560842_var_FileId = 560842
x560842_var_QuestName="罗马铸甲术头盔类防具配方店"
x560842_var_ShopList={842}






function x560842_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560842_var_ShopList[1] )
end









function x560842_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560842_var_FileId, x560842_var_QuestName,10)
	else
		return
	end
	
end









function x560842_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560842_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560842_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560842_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560842_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560842_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560842_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560842_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
