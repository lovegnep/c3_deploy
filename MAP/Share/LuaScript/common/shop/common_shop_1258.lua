

x561258_var_FileId = 561258
x561258_var_QuestName="骑乘道具金币商店"
x561258_var_ShopList={1258}






function x561258_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561258_var_ShopList[1] )
end









function x561258_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 40 then
		TalkAppendButton(varMap, x561258_var_FileId, x561258_var_QuestName,10)
	else
		return
	end
	
end









function x561258_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561258_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561258_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561258_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561258_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561258_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561258_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561258_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
