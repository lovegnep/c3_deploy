

x560804_var_FileId = 560804
x560804_var_QuestName="中原草药术增强类药水配方店"
x560804_var_ShopList={804}






function x560804_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560804_var_ShopList[1] )
end









function x560804_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560804_var_FileId, x560804_var_QuestName,10)
	else
		return
	end
	
end









function x560804_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560804_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560804_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560804_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560804_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560804_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560804_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560804_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
