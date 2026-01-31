

x561106_var_FileId = 561106
x561106_var_QuestName="Ú¤¼×Í¼Æ×ÉùÍûÉÌµê"
x561106_var_ShopList={1106}






function x561106_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561106_var_ShopList[1] )
end









function x561106_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 70 then
		TalkAppendButton(varMap, x561106_var_FileId, x561106_var_QuestName,10)
	else
		return
	end
	
end









function x561106_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561106_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561106_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561106_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561106_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561106_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561106_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561106_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
