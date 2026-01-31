

x561269_var_FileId = 561269
x561269_var_QuestName="¸¡ÊÀÓ¡½ð±ÒÉÌµê"
x561269_var_ShopList={1269}






function x561269_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561269_var_ShopList[1] )
end









function x561269_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 40 then
		TalkAppendButton(varMap, x561269_var_FileId, x561269_var_QuestName,10)
	else
		return
	end
	
end









function x561269_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561269_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561269_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561269_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561269_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561269_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561269_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561269_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
