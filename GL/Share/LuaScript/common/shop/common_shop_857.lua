

x560857_var_FileId = 560857
x560857_var_QuestName="冥龙掌门副武器锻造大师配方店"
x560857_var_ShopList={857}






function x560857_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560857_var_ShopList[1] )
end









function x560857_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560857_var_FileId, x560857_var_QuestName,10)
	else
		return
	end
	
end









function x560857_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560857_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560857_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560857_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560857_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560857_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560857_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560857_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
