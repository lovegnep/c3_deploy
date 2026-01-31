

x560861_var_FileId = 560861
x560861_var_QuestName="冥龙掌门护手铸甲大师配方店"
x560861_var_ShopList={861}






function x560861_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560861_var_ShopList[1] )
end









function x560861_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560861_var_FileId, x560861_var_QuestName,10)
	else
		return
	end
	
end









function x560861_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560861_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560861_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560861_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560861_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560861_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560861_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560861_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
