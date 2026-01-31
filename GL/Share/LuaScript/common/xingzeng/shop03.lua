

x588003_var_FileId = 588003
x588003_var_QuestName="钻石级宝石积分商城"
x588003_var_ShopList={1743}






function x588003_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x588003_var_ShopList[1] )
end









function x588003_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x588003_var_FileId, x588003_var_QuestName,10)
	else
		return
	end
	
end









function x588003_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x588003_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x588003_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x588003_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x588003_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x588003_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x588003_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x588003_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
