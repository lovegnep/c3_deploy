

x560203_var_FileId = 560203
x560203_var_QuestName="五耀之证商店"
x560203_var_ShopList={203}






function x560203_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560203_var_ShopList[1] )
end









function x560203_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 1 then
		TalkAppendButton(varMap, x560203_var_FileId, x560203_var_QuestName,10)
	else
		return
	end
	
end









function x560203_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560203_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560203_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560203_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560203_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560203_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560203_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560203_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
