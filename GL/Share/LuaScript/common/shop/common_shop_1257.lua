

x561257_var_FileId = 561257
x561257_var_QuestName="±¦Ê¯Í¼Æ×½ð±ÒÉÌµê"
x561257_var_ShopList={1257}






function x561257_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561257_var_ShopList[1] )
end









function x561257_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 50 then
		TalkAppendButton(varMap, x561257_var_FileId, x561257_var_QuestName,10)
	else
		return
	end
	
end









function x561257_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561257_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561257_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561257_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561257_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561257_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561257_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561257_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
