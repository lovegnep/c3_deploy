

x560865_var_FileId = 560865
x560865_var_QuestName="Ú¤¼×ÊõÅä·½ÉÌµê"
x560865_var_ShopList={865}






function x560865_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560865_var_ShopList[1] )
end









function x560865_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 90 then
		TalkAppendButton(varMap, x560865_var_FileId, x560865_var_QuestName,10)
	else
		return
	end
	
end









function x560865_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560865_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560865_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560865_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560865_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560865_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560865_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560865_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
