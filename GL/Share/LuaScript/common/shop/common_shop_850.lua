

x560850_var_FileId = 560850
x560850_var_QuestName="波斯工艺术项链类饰品配方店"
x560850_var_ShopList={850}






function x560850_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560850_var_ShopList[1] )
end









function x560850_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560850_var_FileId, x560850_var_QuestName,10)
	else
		return
	end
	
end









function x560850_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560850_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560850_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560850_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560850_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560850_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560850_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560850_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
