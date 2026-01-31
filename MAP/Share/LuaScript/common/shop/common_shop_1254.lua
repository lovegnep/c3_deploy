

x561254_var_FileId = 561254
x561254_var_QuestName="保值金币商店"
x561254_var_ShopList={1254}






function x561254_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561254_var_ShopList[1] )
end









function x561254_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x561254_var_FileId, x561254_var_QuestName,10)
	else
		return
	end
	
end









function x561254_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561254_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561254_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561254_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561254_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561254_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561254_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561254_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
