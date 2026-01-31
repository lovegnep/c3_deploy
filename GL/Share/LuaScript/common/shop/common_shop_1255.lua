

x561255_var_FileId = 561255
x561255_var_QuestName="皇家秘银金币商店"
x561255_var_ShopList={1255}






function x561255_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561255_var_ShopList[1] )
end









function x561255_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 30 then
		TalkAppendButton(varMap, x561255_var_FileId, x561255_var_QuestName,10)
	else
		return
	end
	
end









function x561255_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561255_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561255_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561255_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561255_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561255_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561255_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561255_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
