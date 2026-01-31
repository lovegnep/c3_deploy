

x560326_var_FileId = 560326
x560326_var_QuestName="工艺大师配方商店"
x560326_var_ShopList={326}






function x560326_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560326_var_ShopList[1] )
end









function x560326_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560326_var_FileId, x560326_var_QuestName,10)
	else
		return
	end
	
end









function x560326_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560326_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560326_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560326_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560326_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560326_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560326_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560326_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
