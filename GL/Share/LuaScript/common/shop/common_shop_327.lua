

x560327_var_FileId = 560327
x560327_var_QuestName="成年马匹商店"
x560327_var_ShopList={327}






function x560327_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560327_var_ShopList[1] )
end









function x560327_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560327_var_FileId, x560327_var_QuestName,10)
	else
		return
	end
	
end









function x560327_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560327_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560327_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560327_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560327_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560327_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560327_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560327_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
