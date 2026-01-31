

x560863_var_FileId = 560863
x560863_var_QuestName="冥龙掌门项链工艺大师配方店"
x560863_var_ShopList={863}






function x560863_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560863_var_ShopList[1] )
end









function x560863_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560863_var_FileId, x560863_var_QuestName,10)
	else
		return
	end
	
end









function x560863_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560863_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560863_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560863_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560863_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560863_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560863_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560863_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
