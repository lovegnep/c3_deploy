

x560846_var_FileId = 560846
x560846_var_QuestName="罗马铸甲术靴子类防具配方店"
x560846_var_ShopList={846}






function x560846_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560846_var_ShopList[1] )
end









function x560846_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560846_var_FileId, x560846_var_QuestName,10)
	else
		return
	end
	
end









function x560846_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560846_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560846_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560846_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560846_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560846_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560846_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560846_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
