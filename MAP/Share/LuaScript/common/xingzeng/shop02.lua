

x588002_var_FileId = 588002
x588002_var_QuestName="¡¾ÉÌµê¡¿#R×øÆïÍ¼¼ø#W"
x588002_var_ShopList={1742}






function x588002_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x588002_var_ShopList[1] )
end









function x588002_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x588002_var_FileId, x588002_var_QuestName,10)
	else
		return
	end
	
end









function x588002_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x588002_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x588002_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x588002_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x588002_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x588002_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x588002_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x588002_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
