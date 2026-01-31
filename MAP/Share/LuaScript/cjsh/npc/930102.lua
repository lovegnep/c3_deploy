

x930102_var_FileId = 930102
x930102_var_QuestName="Æí¸£»ý·ÖÉÌµê"
x930102_var_ShopList={1745}






function x930102_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x930102_var_ShopList[1] )
end









function x930102_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x930102_var_FileId, x930102_var_QuestName,10)
	else
		return
	end
	
end









function x930102_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x930102_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x930102_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x930102_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x930102_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x930102_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x930102_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x930102_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
