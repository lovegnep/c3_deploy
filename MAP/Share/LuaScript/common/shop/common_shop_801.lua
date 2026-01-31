

x560801_var_FileId = 560801
x560801_var_QuestName="中原草药术增强类药水配方店"
x560801_var_ShopList={801}






function x560801_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560801_var_ShopList[1] )
end









function x560801_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560801_var_FileId, x560801_var_QuestName,10)
	else
		return
	end
	
end









function x560801_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560801_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560801_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560801_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560801_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560801_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560801_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560801_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
