

x560321_var_FileId = 560321
x560321_var_QuestName="草药大师配方商店"
x560321_var_ShopList={321}






function x560321_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560321_var_ShopList[1] )
end









function x560321_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560321_var_FileId, x560321_var_QuestName,10)
	else
		return
	end
	
end









function x560321_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560321_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560321_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560321_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560321_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560321_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560321_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560321_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
