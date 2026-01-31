

x930103_var_FileId = 930103
x930103_var_QuestName="Æí¸£»ý·ÖÉÌµê"
x930103_var_ShopList={1746}






function x930103_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x930103_var_ShopList[1] )
end









function x930103_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x930103_var_FileId, x930103_var_QuestName,10)
	else
		return
	end
	
end









function x930103_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x930103_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x930103_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x930103_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x930103_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x930103_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x930103_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x930103_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
