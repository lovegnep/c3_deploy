

x560838_var_FileId = 560838
x560838_var_QuestName="罗马铸甲术护手类防具配方店"
x560838_var_ShopList={838}






function x560838_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560838_var_ShopList[1] )
end









function x560838_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560838_var_FileId, x560838_var_QuestName,10)
	else
		return
	end
	
end









function x560838_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560838_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560838_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560838_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560838_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560838_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560838_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560838_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
