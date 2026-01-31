

x560841_var_FileId = 560841
x560841_var_QuestName="罗马铸甲术特殊类物品配方店"
x560841_var_ShopList={841}






function x560841_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560841_var_ShopList[1] )
end









function x560841_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560841_var_FileId, x560841_var_QuestName,10)
	else
		return
	end
	
end









function x560841_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560841_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560841_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560841_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560841_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560841_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560841_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560841_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
