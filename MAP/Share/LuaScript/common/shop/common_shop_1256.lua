

x561256_var_FileId = 561256
x561256_var_QuestName="±¦Ê¯Ò©¼Á½ð±ÒÉÌµê"
x561256_var_ShopList={1256}






function x561256_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561256_var_ShopList[1] )
end









function x561256_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x561256_var_FileId, x561256_var_QuestName,10)
	else
		return
	end
	
end









function x561256_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561256_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561256_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561256_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561256_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561256_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561256_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561256_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
