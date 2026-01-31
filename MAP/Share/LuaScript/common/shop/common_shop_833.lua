

x560833_var_FileId = 560833
x560833_var_QuestName="Í»ØÊ¶ÍÔìÊõÖ÷ÎäÆ÷Åä·½µê"
x560833_var_ShopList={833}






function x560833_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560833_var_ShopList[1] )
end









function x560833_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560833_var_FileId, x560833_var_QuestName,10)
	else
		return
	end
	
end









function x560833_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560833_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560833_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560833_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560833_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560833_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560833_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560833_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
